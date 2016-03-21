#!/bin/bash
# Program:
#       This program is auto benchmarking ceph.
# History:
# 2016/3/20 Kyle Bai <kyle.b@inwinstack.com> Release
#  _  _ _   _ _____ ___   _  __    _       ___      _
# | \| | | | |_   _/ __| | |/ _  _| |___  | _ )__ _(_)
# | .` | |_| | | || (__  | ' | || | / -_)_| _ / _` | |
# |_|\_|\___/  |_| \___| |_|\_\_, |_\___(_|___\__,_|_|
#                             |__/

# A executor identity name
IDENTITY_NAME="ssd"

# Ceph radowgw address and port
RADOSGW_URL="localhost"

# Ceph cephfs main monitor address
CEPH_FS_ADDRESS="localhost"

# Enable benchmarking multi block_size
ENADBLE_MULTI_BLOCK=false

# Enable benchmarking multi pg_num
ENADBLE_MULTI_PG=false

# Enable benchmarking multi pg_num
ENADBLE_OSD_BENCH=false

RUN_TIME="10"
IO_THREADS="16"
BLOCK_SIZES="2 4 16 32 64 128 256 512"
PG_NUMS="32 64 128 256"
STORE_PATH="/var/www/html/${IDENTITY_NAME}"
DATE=$(date +"%Y-%m-%d-%T")
TIMESTAMPE=$(date +%s)

function init_directory() {
  echo "********* Initiate all directory *********"
  mkdir -p "${STORE_PATH}/osd_bench/${DATE}"
  mkdir -p "${STORE_PATH}/rados_bench/${DATE}"
  mkdir -p "${STORE_PATH}/rbd_bench/${DATE}"
  mkdir -p "${STORE_PATH}/rgw_swift_bench/${DATE}"
  mkdir -p "${STORE_PATH}/cephfs_bench/${DATE}"
}

function msg() {
  echo -e $1
  echo -e $1 >> $2
}

function osd_bench() {
  echo "********* Benchmark and check all osd *********"

  FILE_PATH="${STORE_PATH}/osd_bench/${DATE}/osd-bench.txt"
  OSD_IDS=$(sudo ceph osd tree | grep -o 'osd\.[0-9]*')


  for osd in ${OSD_IDS}; do
    msg "[ -------- ${osd} -------- ]" ${FILE_PATH}
    time ceph tell ${osd} bench >> ${FILE_PATH} 2>&1
  done
}

function rados_bench() {
  local block_size=${1:-"4"}
  local pg_num=${2:-"32"}

  echo "********* Benchmarking ceph rados storage pool (bs=${block_size}k, pg_num=${pg_num}) *********"

  FILE_PATH="${STORE_PATH}/rados_bench/${DATE}/${pg_num}"
  mkdir -p ${FILE_PATH}
  ceph osd pool create scbench ${pg_num} ${pg_num}
  sleep 15

  msg "\nTASK [ RADOS benchmark a ceph storage pool (write) ]" "${FILE_PATH}/rados-write-${block_size}.txt"
  rados bench -p scbench ${RUN_TIME} -b ${block_size}K write --no-cleanup >> "${FILE_PATH}/rados-write-${block_size}.txt"

  msg "\nTASK [ RADOS benchmark a ceph storage pool (read_seq) ]" "${FILE_PATH}/rados-read-seq-${block_size}.txt"
  rados bench -p scbench ${RUN_TIME}  seq >> "${FILE_PATH}/rados-read-seq-${block_size}.txt"

  msg "\nTASK [ RADOS benchmark a ceph storage pool (read_rand) ]" "${FILE_PATH}/rados-read-rand-${block_size}.txt"
  rados bench -p scbench ${RUN_TIME} rand >> "${FILE_PATH}/rados-read-rand-${block_size}.txt"

  # Clean  and delete radso pool
  rados -p scbench cleanup
  ceph osd pool delete scbench scbench --yes-i-really-really-mean-it
}

function fio_run() {
  sudo sed -i "s/bs=.*/bs=${1}k/" ${4}
  sudo sed -i "s/rw=.*/rw=${2}/" ${4}
  sudo sed -i "s/runtime=.*/runtime=${3}/" ${4}
  fio ${4}
}

function rbd_bench() {
  local block_size=${1:-"4"}
  local pg_num=${2:-"32"}

  echo "********* Benchmarking ceph rados block device (bs=${block_size}k, pg_num=${pg_num}) *********"

  FILE_PATH="${STORE_PATH}/rbd_bench/${DATE}/${pg_num}"
  mkdir -p ${FILE_PATH}
  FILE_PATH="${FILE_PATH}/rbd-bench-${block_size}"
  FIO_PATH="../bench-tools/bench-rbd.fio"
  ceph osd pool create rbdbench ${pg_num} ${pg_num}
  sleep 15

  rbd create rbdimage --size 2048 --pool rbdbench
  rbd map rbdimage --pool rbdbench --name client.admin

  msg "\nTASK [ Benchmarking ceph block device using dd ]" "${FILE_PATH}-dd-1g.txt"
  dd if=/dev/zero of=/dev/rbd1 bs=1G count=1 oflag=direct >> "${FILE_PATH}-dd-1g.txt" 2>&1

  msg "\nTASK [ Benchmark a ceph block device (write) ]" "${FILE_PATH}-bench-write.txt"
  rbd bench-write rbdimage --io-size ${block_size}K --io-threads 1 --pool=rbdbench >> "${FILE_PATH}-bench-write.txt"

  FIO_TYPES="read write randread randwrite rw randrw"
  for types in ${FIO_TYPES}; do
    msg "\nTASK [ Benchmark a ceph block device (${types}) ]" "${FILE_PATH}-fio-${types}.txt"
    fio_run ${block_size} ${types} ${RUN_TIME} ${FIO_PATH} >> "${FILE_PATH}-fio-${types}.txt"
  done

  # Clean and delete rbd
  rbd unmap rbdimage --pool rbdbench
  rbd rm rbdimage --pool rbdbench
  ceph osd pool delete rbdbench rbdbench --yes-i-really-really-mean-it
}

function rgw_swift_bench() {
  # The -n and -g parameters control the number of objects to PUT and GET respectively.
  local put_number=${1:-"1000"}
  local get_number=${2:-"100"}
  local url="http:\/\/${RADOSGW_URL}\/auth\/v1.0\/"

  echo "********* Benchmarking ceph radosw gateway for swift (put_num=${put_number}, get_num=${get_number}) *********"

  FILE_PATH="${STORE_PATH}/rgw_swift_bench/${DATE}/rgw-swift-bench-${put_number}-${get_number}.txt"
  SWIFT_CONF_PATH="../bench-tools/swift.conf"

  sudo sed -i "s/auth\s*=.*/auth = ${url} /g" ${SWIFT_CONF_PATH}

  radosgw-admin user create --uid="benchmark" --display-name="benchmark" &>/dev/null
  radosgw-admin subuser create --uid=benchmark --subuser=benchmark:swift --access=full &>/dev/null
  radosgw-admin key create --subuser=benchmark:swift --key-type=swift --secret=guessme &>/dev/null
  radosgw-admin user modify --uid=benchmark --max-buckets=0 &>/dev/null

  msg "\nTASK [ Benchmark a ceph object gateway ]" ${FILE_PATH}
  swift-bench -c 64 -s 4096 -n ${put_number} -g ${get_number} ${SWIFT_CONF_PATH} >> ${FILE_PATH} 2>&1

  # Remove radosgw account
  radosgw-admin user rm --uid=benchmark
}

function cephfs_bench() {
  local block_size=${1:-"4"}
  local admin_secret=$(cat /etc/ceph/ceph.client.admin.keyring | grep key | awk '{print $3}')

  echo "********* Benchmarking ceph file system (bs=${block_size}k) *********"

  FILE_PATH="${STORE_PATH}/cephfs_bench/${DATE}/cephfs-bench-${block_size}k"
  FIO_PATH="../bench-tools/bench-fs.fio"
  SECRET_PATH="../bench-tools/admin.secret"
  echo ${admin_secret} > ${SECRET_PATH}

  mkdir -p /mnt/myceph-fuse
  ceph-fuse -m ${CEPH_FS_ADDRESS}:6789 /mnt/myceph-fuse
  sleep 5

  msg "\nTASK [ Benchmarking ceph file system using dd ]" "${FILE_PATH}-dd-1g.txt"
  dd if=/dev/zero of=ceph-fuse bs=1G count=1 oflag=direct >> "${FILE_PATH}-dd-1g.txt" 2>&1

  FIO_TYPES="read write randread randwrite rw randrw"
  for types in ${FIO_TYPES}; do
    msg "\nTASK [ Benchmark a ceph block device (${types}) ]" "${FILE_PATH}-fio-${types}.txt"
    fio --filename=ceph-fuse --direct=1 --rw=${types} \
    --ioengine=libaio --bs=${block_size}k --rwmixread=100 --iodepth=16 \
    --numjobs=1 --runtime=${RUN_TIME} --group_reporting \
    --name=bench-fs >> "${FILE_PATH}-fio-${types}.txt"
  done

  # Clean and delete cephfs
  umount ceph-fuse
  rm -rf /mnt/myceph-fuse
}

##############################
#                            #
# benchmarking main executor #
#                            #
##############################

function multi_rados_executor() {
  if ${ENADBLE_MULTI_BLOCK}; then
    for block_size in ${BLOCK_SIZES}; do
      if ${ENADBLE_MULTI_PG}; then
        for pg_num in ${PG_NUMS}; do
          ${1} ${block_size} ${pg_num}
        done
      else
        ${1} ${block_size}
      fi
    done
  else
    ${1}
  fi
}

# Initiate all directory
init_directory

# Benchmarking all osd
if ${ENADBLE_OSD_BENCH}; then
  osd_bench
fi

# Benchmarking ceph rados storage pool
multi_rados_executor rados_bench

# Benchmarking ceph rados block device
multi_rados_executor rbd_bench

# Benchmarking ceph radosw gateway for swift
rgw_swift_bench

# Benchmarking ceph radosw gateway for swift
if ${ENADBLE_MULTI_BLOCK}; then
  for block_size in ${BLOCK_SIZES}; do
    cephfs_bench ${block_size}
  done
else
  cephfs_bench
fi
