#!/bin/bash
# Program:
#       This program is benchmarking ceph.
# History:
# 2016/6/18 Kyle Bai <kyle.b@inwinstack.com> Release
#  _  _ _   _ _____ ___   _  __    _       ___      _
# | \| | | | |_   _/ __| | |/ _  _| |___  | _ )__ _(_)
# | .` | |_| | | || (__  | ' | || | / -_)_| _ / _` | |
# |_|\_|\___/  |_| \___| |_|\_\_, |_\___(_|___\__,_|_|
#

BENCHMAKR_NAME="default/journal-1G"
DATE=$(date +"%Y-%m-%d-%T")
TIMESTAMPE=$(date +%s)
OUTPUT_PATH="/var/www/html/${BENCHMAKR_NAME}"
OUTPUT_DATE_DIR="${OUTPUT_PATH}/${DATE}"

# radowgw address
RADOSGW_URL="10.26.1.235:7480"

# cephfs main monitor address
MON_ADDR="10.26.1.232:6789"

# Enable benchmarking multi block_size
ENADBLE_MULTI_BLOCK=false

# Enable benchmarking multi pg_num
ENADBLE_MULTI_PG=false

# Enable benchmarking multi pg_num
ENADBLE_OSD_BENCH=false

# RADOS benchmark configurations
RADOS_JOB_RUNTIME="20"

# Fio configurations
FIO_JOB_RUNTIME="20"
FIO_IO_DEPTH="16"
FIO_BLOCK_SIZES="2k 4k 16k 32k 64k 128k 256k 512k 1M 2M 4M 8M"
FIO_IOPS_TYPES="write read randwrite randread"
FIO_THG_TYPES="write read"

# Swift bench configurations
SWIFT_OBJECT_SIZES="4096 40960"
SWIFT_OBJECT_NUMS="100 500 1000"

# Ceph pool configurations
PG_NUM="64"
PG_NUMS="32 64 128 256"
SIZE="1"
CRUSH_RULESET="replicated_ruleset"
CACHE_POOL="cbench"

# Checking run
read -p "Do you want to run \"${BENCHMAKR_NAME}\" benchmark?(yes/no) " check

if [ "${check}" != "yes" ] && [ "${check}" != "YES" ]; then
    echo "Terminating process"
    exit 1
fi

# ======================================================================
# Benchmark script common function
# ======================================================================
function task_msg() {
  sync
  printf "[ TASK %-.60s ]\n" "${1} ****************************************************************"
}

function step_msg() {
  sync
  printf "Step - %-.40s \n" "${1} **************************************************"
}

function init_directory() {
  task_msg "Creating directorys"
  local job_types="rados-bench rbd-bench fio-rbd fio-libaio-bd fio-libaio-fs swift-bench"

  for name in ${job_types}; do
      mkdir -p "${OUTPUT_DATE_DIR}/${name}"
  done
}

# ======================================================================
# Benchmarking Ceph all OSD
# ======================================================================
function osd_bench() {
  task_msg "Benchmarking all osd"

  local path="${OUTPUT_DATE_DIR}"
  local osds=$(ceph osd tree | grep -o 'osd\.[0-9]*')

  for osd in ${osds}; do
      step_msg "${osd}" > "${path}/osd-bench.txt"
      time ceph tell ${osd} bench >> "${path}/osd-bench.txt" 2>&1
  done
}

# ======================================================================
# Benchmarking object using radosd bench tool
# ======================================================================
function rados_bench() {
    task_msg "RADOS Storage Pool (pg=${1}, bs=${2})"

    local pg=${1:-"64"}
    local bs=${2:-"4k"}
    local num=${3:-"1"}
    local path="${OUTPUT_DATE_DIR}/rados-bench"
    mkdir -p ${path}

    ceph osd pool create bench ${pg} ${pg} ${CRUSH_RULESET}
    ceph osd pool set bench size ${SIZE}
    while [ $(ceph -s | grep creating -c) -gt 0 ]; do sleep 1; done

    for i in $(seq 1 ${num}); do
        step_msg "${i}"
        step_msg "Benchmark rados pool (write)"
        rados bench -p bench ${RADOS_JOB_RUNTIME} \
                    -b ${bs^^} write -t 1 \
                    --no-cleanup >> "${path}/write-${i}-${pg}-${bs}.txt"

        step_msg "Benchmark rados pool (seq)"
        rados bench -p bench ${RADOS_JOB_RUNTIME} \
        -t 1 seq >> "${path}/seq-${i}-${pg}-${bs}.txt"

        step_msg "Benchmark rados pool (rand)"
        rados bench -p bench ${RADOS_JOB_RUNTIME} \
        -t 1 rand >> "${path}/rand-${i}-${pg}-${bs}.txt"
    done

    # Clean and delete radso pool
    rados -p bench cleanup
    ceph osd pool delete bench bench --yes-i-really-really-mean-it
}

# ======================================================================
# Benchmarking block device using rbd bench tool
# ======================================================================
function rbd_bench() {
    task_msg "RADOS Block Device (pg=${1}, bs=${2})"

    local pg=${1:-"64"}
    local bs=${2:-"4k"}
    local num=${3:-"1"}
    local path="${OUTPUT_DATE_DIR}/rbd-bench"
    mkdir -p ${path}

    ceph osd pool create bench ${pg} ${pg} ${CRUSH_RULESET}
    ceph osd pool set bench size ${SIZE}
    while [ $(ceph -s | grep creating -c) -gt 0 ]; do sleep 1; done
    rbd create block-device --size 10240 -p bench

    for i in $(seq 1 ${num}); do
        step_msg "${i}"
        step_msg "Benchmark write rbd (seq)"
        rbd bench-write block-device --io-size ${bs^^} \
                                     --io-threads 1 \
                                     --io-total 1024M \
                                     --io-pattern seq \
                                     --pool=bench > "${path}/seq-${i}-${pg}-${bs}.txt"

        step_msg "Benchmark write rbd (rand)"
        rbd bench-write block-device --io-size ${bs^^} \
                                     --io-threads 1 \
                                     --io-total 1024M \
                                     --io-pattern rand \
                                     --pool=bench > "${path}/rand-${i}-${pg}-${bs}.txt"
    done

    # Clean and delete radso pool
    rbd rm block-device -p bench
    ceph osd pool delete bench bench --yes-i-really-really-mean-it
}

# ======================================================================
# Benchmarking block device using fio rbd engine
# ======================================================================
function fio_rbd_bench() {
    task_msg "FIO RBD Eninge (pg=${1}, bs=${2})"

    local pg=${1:-"64"}
    local bs=${2:-"4k"}
    local num=${3:-"1"}
    local path="${OUTPUT_DATE_DIR}/fio-rbd"
    mkdir -p ${path}

    ceph osd pool create bench ${pg} ${pg} ${CRUSH_RULESET}
    ceph osd pool set bench size ${SIZE}
    while [ $(ceph -s | grep creating -c) -gt 0 ]; do sleep 1; done
    rbd create block-device --size 10240 -p bench

    for i in $(seq 1 ${num}); do
        step_msg "${i}"
        for name in ${FIO_IOPS_TYPES}; do
            JOBS=""
            if [ "${name}" == "read" ] || [ "${name}" == "randread" ]; then
                 JOBS="--numjobs=1"
            fi

            step_msg "Fio rbd bd (${name})"
            fio --direct="1" --ioengine="rbd" \
                --clientname="admin" --pool="bench" \
                --rbdname="block-device" --bs="${bs}" ${JOBS} \
                --rw="${name}" --runtime="${FIO_JOB_RUNTIME}" \
                --iodepth="${FIO_IO_DEPTH}" --group_reporting \
                --name="fio-rbd" >> "${path}/${name}-${i}-${pg}-${bs}.txt"
        done

        for name in ${FIO_THG_TYPES}; do
            step_msg "Fio rbd bd (throughput ${name})"
            fio --direct="1" --ioengine="rbd" \
                --clientname="admin" --pool="bench" \
                --rbdname="block-device" --bs="4M" \
                --rw="${name}" --runtime="60" \
                --size="5G" --group_reporting --iodepth="${FIO_IO_DEPTH}" \
                --name="fio-rbd" >> "${path}/throughput-${name}-${i}-${pg}-${bs}.txt"
        done
    done

    # Clean and delete radso pool
    rbd rm block-device -p bench
    ceph osd pool delete bench bench --yes-i-really-really-mean-it
}

# ======================================================================
# Benchmarking block device using fio libaio engine
# ======================================================================
function fio_libaio_bd_bench() {
    task_msg "FIO Libaio Eninge for bd (pg=${1}, bs=${2})"

    local pg=${1:-"64"}
    local bs=${2:-"4k"}
    local num=${3:-"1"}
    local path="${OUTPUT_DATE_DIR}/fio-libaio-bd"
    mkdir -p ${path}

    ceph osd pool create bench ${pg} ${pg} ${CRUSH_RULESET}
    ceph osd pool set bench size ${SIZE}
    while [ $(ceph -s | grep creating -c) -gt 0 ]; do sleep 1; done
    rbd create block-device --size 10240 -p bench
    rbd map block-device -p bench
    mkfs.ext4 /dev/rbd1
    mkdir -p /mnt/block-device
    mount /dev/rbd1 /mnt/block-device

    for i in $(seq 1 ${num}); do
        step_msg "${i}"
        for name in ${FIO_IOPS_TYPES}; do
            JOBS=""
            if [ "${name}" == "read" ] || [ "${name}" == "randread" ]; then
                 JOBS="--numjobs=1"
            fi

            step_msg "Fio libaio bd (${name})"
            rm /mnt/block-device/test
            fio --filename="/mnt/block-device/test" \
                --direct="1" --ioengine="libaio" --bs="${bs}" ${JOBS} \
                --rw="${name}" --size="5G" --runtime="${FIO_JOB_RUNTIME}" \
                --iodepth="${FIO_IO_DEPTH}" --group_reporting \
                --name="fio-libaio-rbd" >> "${path}/${name}-${i}-${pg}-${bs}.txt"
        done

        for name in ${FIO_THG_TYPES}; do
            step_msg "Fio libaio bd (throughput ${name})"
            rm /mnt/block-device/test
            fio --filename="/mnt/block-device/test" \
                --direct="1" --ioengine="libaio" \
                --bs="4M" --rw="${name}" --size="5G" \
                --runtime="60" --iodepth="${FIO_IO_DEPTH}" \
                --group_reporting \
                --name="libaio-filesystem" >> "${path}/throughput-${name}-${i}-${pg}-${bs}.txt"
        done
    done

    # Clean and delete radso pool
    umount /dev/rbd1
    rbd unmap block-device -p bench
    rbd rm block-device -p bench
    ceph osd pool delete bench bench --yes-i-really-really-mean-it
}

# ======================================================================
# Benchmarking file system using fio libaio engine
# ======================================================================
function fio_libaio_fs_bench() {
    task_msg "FIO Libaio Eninge for fs (pg=${1}, bs=${2})"

    local pg=${1:-"64"}
    local bs=${2:-"4k"}
    local num=${3:-"1"}
    local path="${OUTPUT_DATE_DIR}/fio-libaio-fs"
    local keypath="/etc/ceph/ceph.client.admin.keyring"
    mkdir -p ${path}

    ceph osd pool create cephfs_data ${pg} ${pg} ${CRUSH_RULESET}
    ceph osd pool set cephfs_data size ${SIZE}
    ceph osd pool create cephfs_metadata ${pg} ${pg} ${CRUSH_RULESET}
    ceph osd pool set cephfs_metadata size ${SIZE}
    while [ $(ceph -s | grep creating -c) -gt 0 ]; do sleep 1; done
    ceph fs new cephfs cephfs_metadata cephfs_data

    local key=$(cat ${keypath} | grep -o "A.*==$")
    echo "${key}" > admin.secret

    mkdir -p /mnt/file-system
    mount -t ceph ${MON_ADDR}:/ /mnt/file-system/ \
          -o name=admin,secretfile=admin.secret

    for i in $(seq 1 ${num}); do
        step_msg "${i}"
        for name in ${FIO_IOPS_TYPES}; do
            JOBS=""
            if [ "${name}" == "read" ] || [ "${name}" == "randread" ]; then
                 JOBS="--numjobs=1"
            fi

            step_msg "Fio libaio fs (${name})"
            rm /mnt/file-system/test
            fio --filename="/mnt/file-system/test" \
                --direct="1" --ioengine="libaio" --bs="${bs}" ${JOBS} \
                --rw="${name}" --size="5G" --runtime="${FIO_JOB_RUNTIME}" \
                --iodepth="${FIO_IO_DEPTH}" --group_reporting \
                --name="fio-libaio-rbd" >> "${path}/${name}-${i}-${pg}-${bs}.txt"
        done

        for name in ${FIO_THG_TYPES}; do
            step_msg "Fio libaio fs (throughput ${name})"
            rm /mnt/file-system/test
            fio --filename="/mnt/file-system/test" \
                --direct="1" --ioengine="libaio" \
                --bs="4M" --rw="${name}" --size="5G" \
                --runtime="60" --iodepth="${FIO_IO_DEPTH}" \
                --group_reporting \
                --name="libaio-filesystem" >> "${path}/throughput-${name}-${i}-${pg}-${bs}.txt"
        done
    done

    # Clean and delete radso pool
    umount /mnt/file-system; rm -rf /mnt/file-system;
    ceph mds fail 0; ceph mds set_max_mds 0; ceph mds rm 0;
    ceph fs rm cephfs --yes-i-really-mean-it
    ceph osd pool delete cephfs_data cephfs_data --yes-i-really-really-mean-it
    ceph osd pool delete cephfs_metadata cephfs_metadata --yes-i-really-really-mean-it
}

# ======================================================================
# Benchmarking object storage using swift-bench
# ======================================================================
function rgw_swift_bench() {
    task_msg "RADOS Gateway Swift (c=${1}, s=${2}, n=${3}, g="${4}")"

    local c=${1:-"64"}
    local s=${2:-"4096"}
    local n=${3:-"100"}
    local g=${4:-"100"}
    local num=${5:-"1"}
    local path="${OUTPUT_DATE_DIR}/swift-bench"
    mkdir -p ${path}
    echo -e "[bench]\nauth = http://${RADOSGW_URL}/auth/v1.0\nuser = benchmark:swift\nkey = guessme\nauth_version = 1.0" > swift.conf

    radosgw-admin user create --uid="benchmark" --display-name="benchmark" &>/dev/null
    radosgw-admin subuser create --uid=benchmark --subuser=benchmark:swift --access=full &>/dev/null
    radosgw-admin key create --subuser=benchmark:swift --key-type=swift --secret=guessme &>/dev/null
    radosgw-admin user modify --uid=benchmark --max-buckets=0 &>/dev/null

    while [ $(ceph -s | grep creating -c) -gt 0 ]; do sleep 1; done

    for i in $(seq 1 ${num}); do
        step_msg "${i}"
        step_msg "Benchmarking swift"
        swift-bench -c ${c} \
                    -s ${s} \
                    -n ${n} \
                    -g ${g} \
                    swift.conf > "${path}/${i}-${c}-${s}-${n}-${g}.txt" 2>&1
    done

    # Remove radosgw account
    for pool in $(ceph osd pool ls); do
        ceph osd pool delete ${pool} ${pool} --yes-i-really-really-mean-it
    done
}

# ======================================================================
# Benchmarking cache tiering using rbd
# ======================================================================
function cache_tiering_bench() {
    task_msg "FIO RBD Eninge for Cache Tiering (pg=${1}, bs=${2})"

    local pg=${1:-"64"}
    local bs=${2:-"4k"}
    local num=${3:-"1"}
    local path="${OUTPUT_DATE_DIR}/fio-rbd"
    mkdir -p ${path}

    rbd create block-device --size 10240 -p bench

    for i in $(seq 1 ${num}); do
        step_msg "${i}"
        for name in ${FIO_IOPS_TYPES}; do
            JOBS=""
            if [ "${name}" == "read" ] || [ "${name}" == "randread" ]; then
                 JOBS="--numjobs=1"
            fi

            step_msg "Fio rbd bd (${name})"
            fio --direct="1" --ioengine="rbd" \
                --clientname="admin" --pool="${CACHE_POOL}" \
                --rbdname="block-device" --bs="${bs}" ${JOBS} \
                --rw="${name}" --runtime="${FIO_JOB_RUNTIME}" \
                --iodepth="${FIO_IO_DEPTH}" --group_reporting \
                --name="fio-rbd" >> "${path}/${name}-${i}-${pg}-${bs}.txt"
        done

        for name in ${FIO_THG_TYPES}; do
            step_msg "Fio rbd bd (throughput ${name})"
            fio --direct="1" --ioengine="rbd" \
                --clientname="admin" --pool="${CACHE_POOL}" \
                --rbdname="block-device" --bs="4M" \
                --rw="${name}" --runtime="60" \
                --size="5G" --group_reporting --iodepth="${FIO_IO_DEPTH}" \
                --name="fio-rbd" >> "${path}/throughput-${name}-${i}-${pg}-${bs}.txt"
        done
    done

    # Clean and delete radso pool
    rbd rm block-device -p bench
}

##############################
# benchmarking main executor #
##############################
init_directory

# Running benchmark all osd
# osd_bench

# Running rados bench (pg, bs, num)
# rados_bench 64 4k 5
# rados_bench 64 4M 5

# Running rbd bench (pg, bs, num)
# rbd_bench 64 4k 5
# rbd_bench 64 4M 5

# Running fio bd (pg, bs, num)
# fio_rbd_bench 64 4k 5
# fio_rbd_bench 64 16k 5
# fio_rbd_bench 64 128k 5
# fio_rbd_bench 64 1M 5
# fio_rbd_bench 64 2M 5
# fio_rbd_bench 64 4M 5

# Running fio libaio for bd (pg, bs, num)
# fio_libaio_bd_bench 64 4k 5
# fio_libaio_bd_bench 64 128k 5

# Running fio libaio for fs (pg, bs, num)
# fio_libaio_fs_bench 64 4k 5

# Running swift-bench (c, s, n, g)
# rgw_swift_bench 64 4096 100 100 5
# rgw_swift_bench 64 4096 500 100 5
# rgw_swift_bench 64 4096 1000 100 5

# rgw_swift_bench 64 40960 100 100 5
# rgw_swift_bench 64 40960 500 100 5
# rgw_swift_bench 64 40960 1000 100 5

# Running fio rbd for cache tiering(pg, bs, num)
cache_tiering_bench 64 4k 5
cache_tiering_bench 64 8k 5
cache_tiering_bench 64 16k 5
cache_tiering_bench 64 4M 5
