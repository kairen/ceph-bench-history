#!/bin/bash
# Program:
#       This program is auto benchmarking ceph.
# History:
# 2016/3/30 Kyle Bai <kyle.b@inwinstack.com> Release
#  _  _ _   _ _____ ___   _  __    _       ___      _
# | \| | | | |_   _/ __| | |/ _  _| |___  | _ )__ _(_)
# | .` | |_| | | || (__  | ' | || | / -_)_| _ / _` | |
# |_|\_|\___/  |_| \___| |_|\_\_, |_\___(_|___\__,_|_|
#                             |__/

# A executor identity name
IDENTITY_NAME="ssd"

# Ceph radowgw url
RADOSGW_URL="localhost"

# Enable benchmarking multi block_size
ENADBLE_MULTI_BLOCK=false

# Enable benchmarking multi pg_num
ENADBLE_MULTI_PG=false

IO_THREADS="16"
BLOCK_SIZES="2 4 16 32 64 128 256 512"
PG_NUMS="16 32 64 128 256"
STORE_PATH="/var/www/html/${IDENTITY_NAME}"
DATE=$(date +"%Y-%m-%d-%T")
TIMESTAMPE=$(date +%s)

function init_directory() {
  mkdir -p "${STORE_PATH}/osd_bench"
  mkdir -p "${STORE_PATH}/rados_bench"
  mkdir -p "${STORE_PATH}/rbd_bench"
  mkdir -p "${STORE_PATH}/rgw_swift_bench"
}

function osd_bench() {
  FILE_PATH="${STORE_PATH}/osd_bench/${DATE}.txt"
  OSD_IDS=$(sudo ceph osd tree | grep -o 'osd\.[0-9]*')

  echo -e "TASK [ Benchmark a ceph object sotrage device ]\n" >> ${FILE_PATH}
  for osd in ${OSD_IDS}; do
    echo "[ -------- ${osd} -------- ]" >> ${FILE_PATH}
    echo $(time ceph tell ${osd} bench) >> ${FILE_PATH}
  done
}

function rados_bench() {
  local block_size=${1:-"4"}
  local pg_num=${2:-"32"}

  FILE_PATH="${STORE_PATH}/rados_bench/${DATE}-${block_size}.txt"
  ceph osd pool create scbench ${pg_num} ${pg_num}
  sleep 10

  echo -e "TASK [ RADOS benchmark a ceph storage pool (write) ] \n" >> ${FILE_PATH}
  rados bench -p scbench 20 -b ${block_size}K write --no-cleanup >> ${FILE_PATH}

  echo -e "TASK [ RADOS benchmark a ceph storage pool (read_seq) ] \n" >> ${FILE_PATH}
  rados bench -p scbench 20  seq >> ${FILE_PATH}

  echo -e "TASK [ RADOS benchmark a ceph storage pool (read_rand) ] \n" >> ${FILE_PATH}
  rados bench -p scbench 20 rand >> ${FILE_PATH}

  # Clean  and delete radso pool
  rados -p scbench cleanup
  ceph osd pool delete scbench scbench --yes-i-really-really-mean-it
}

function fio_run() {
  sudo sed -i "s/bs=.*/bs=${1}k/" ${3}
  sudo sed -i "s/rw=.*/rw=${2}/" ${3}
  fio ${3}
}

function rbd_bench() {
  local block_size=${1:-"4"}
  local pg_num=${2:-"32"}

  FILE_PATH="${STORE_PATH}/rbd_bench/${DATE}-${block_size}"
  FIO_PATH="../bench-tools/bench.fio"
  ceph osd pool create rbdbench ${pg_num} ${pg_num}
  sleep 10

  rbd create rbdimage --size 2048 --pool rbdbench
  rbd map rbdimage --pool rbdbench --name client.admin

  echo -e "TASK [ Benchmark a ceph block device (write) ] \n" >> "${FILE_PATH}-bench-write.txt"
  rbd bench-write rbdimage --io-size ${block_size}K --io-threads 1 --pool=rbdbench >> "${FILE_PATH}-bench-write.txt"

  echo -e "TASK [ Benchmark a ceph block device (fio_read) ] \n" >> "${FILE_PATH}-fio-read.txt"
  fio_run ${block_size} read ${FIO_PATH} >> "${FILE_PATH}-fio-read.txt"

  echo -e "TASK [ Benchmark a ceph block device (fio_write) ]\n" >> "${FILE_PATH}-fio-write.txt"
  fio_run ${block_size} write ${FIO_PATH} >> "${FILE_PATH}-fio-write.txt"

  echo -e "TASK [ Benchmark a ceph block device (fio_randread) ] \n" >> "${FILE_PATH}-fio-randread.txt"
  fio_run ${block_size} randread ${FIO_PATH} >> "${FILE_PATH}-fio-randread.txt"

  echo -e "TASK [ Benchmark a ceph block device (fio_randwrite) ] \n" >> "${FILE_PATH}-fio-randwrite.txt"
  fio_run ${block_size} randwrite ${FIO_PATH} >> "${FILE_PATH}-fio-randwrite.txt"

  echo -e "TASK [ Benchmark a ceph block device (fio_rw) ] \n" >> "${FILE_PATH}-fio-rw.txt"
  fio_run ${block_size} rw ${FIO_PATH} >> "${FILE_PATH}-fio-rw.txt"

  echo -e "TASK [ Benchmark a ceph block device (fio_randrw) ] \n" >> "${FILE_PATH}-fio-randrw.txt"
  fio_run ${block_size} randrw ${FIO_PATH} >> "${FILE_PATH}-fio-randrw.txt"

  # Clean and delete rbd
  rbd unmap rbdimage --pool rbdbench
  rbd rm rbdimage --pool rbdbench
  ceph osd pool delete rbdbench rbdbench --yes-i-really-really-mean-it
}

function rgw_swift_bench() {
  local put_number=${1:-"1000"}
  local get_number=${2:-"100"}

  FILE_PATH="${STORE_PATH}/rgw_swift_bench/${DATE}.txt"
  SWIFT_CONF_PATH="../bench-tools/swift.conf"
  sudo sed -i "s/auth\s*=.*/auth = http://${RADOSGW_URL}/auth/v1.0/" ${SWIFT_CONF_PATH}

  radosgw-admin user create --uid="benchmark" --display-name="benchmark"
  radosgw-admin subuser create --uid=benchmark --subuser=benchmark:swift --access=full
  radosgw-admin key create --subuser=benchmark:swift --key-type=swift --secret=guessme
  radosgw-admin user modify --uid=benchmark --max-buckets=0

  echo -e "TASK [ Benchmark a ceph object gateway ]\n" >> ${FILE_PATH}
  # The -n and -g parameters control the number of objects to PUT and GET respectively.
  swift-bench -c 64 -s 4096 -n ${put_number} -g ${get_number} ${SWIFT_CONF_PATH} >> ${FILE_PATH}

  # Remove radosgw account
  radosgw-admin user rm --uid=benchmark
}

##############################
#                            #
# benchmarking main executor #
#                            #
##############################

# Initiate all directory
echo "********* Initiate all directory *********"
init_directory

# Benchmarking all osd
echo "********* Benchmarking all osd *********"
osd_bench

# Benchmarking ceph rados storage pool
echo "********* Benchmarking ceph rados storage pool *********"
if ${ENADBLE_MULTI_BLOCK}; then
  for block_size in ${BLOCK_SIZES}; do
    if ${ENADBLE_MULTI_PG}; then
      for pg_num in ${PG_NUMS}; do
        rados_bench ${block_size} ${pg_num}
      done
    else
      rados_bench ${block_size}
    fi
  done
else
  rados_bench
fi

# Benchmarking ceph rados block device
echo "********* Benchmarking ceph rados block device *********"
if ${ENADBLE_MULTI_BLOCK}; then
  for block_size in ${BLOCK_SIZES}; do
    if ${ENADBLE_MULTI_PG}; then
      for pg_num in ${PG_NUMS}; do
        rbd_bench ${block_size} ${pg_num}
      done
    else
      rbd_bench ${block_size}
    fi
  done
else
  rbd_bench
fi

# Benchmarking ceph radosw gateway for swift
echo "********* Benchmarking ceph radosw gateway for swift *********"
rgw_swift_bench
