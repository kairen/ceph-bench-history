#!/bin/bash
# Program:
#       This program is benchmarking ceph iops.
# History:
# 2016/3/22 Kyle Bai <kyle.b@inwinstack.com> Release
#  _  _ _   _ _____ ___   _  __    _       ___      _
# | \| | | | |_   _/ __| | |/ _  _| |___  | _ )__ _(_)
# | .` | |_| | | || (__  | ' | || | / -_)_| _ / _` | |
# |_|\_|\___/  |_| \___| |_|\_\_, |_\___(_|___\__,_|_|
#                             |__/

# A executor identity name
IDENTITY_NAME="ssd-default rules"

# A execute of number
EXECUTE_NUM="10"

FILE_NAME="/dev/rbd1"
TYPE="write"
BLOCK_SIZE="4k"
RW_MIXREAD="100"
RUN_TIME="20"
IO_DEPTH="16"
NUM_JOBS="1"

function MIX_MAX {
  ar=($@)
  IFS=$'\n'
  echo "MIX: $(echo "${ar[*]}" | sort -n | head -n1) MAX: $(echo "${ar[*]}" | sort -nr | head -n1)"
}

sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync

echo "${IDENTITY_NAME} -"
echo "filename: ${FILE_NAME}, rw: ${TYPE}, bs: ${BLOCK_SIZE}, rwmixread: ${RW_MIXREAD}, iodepth: ${IO_DEPTH}, numjobs: ${NUM_JOBS}"
echo "----------------"

SUM=0
IOPS_ARRAY=""
for i in $(seq 1 ${EXECUTE_NUM}); do
    # IOPS=$(fio bench.fio | grep -o 'iops=[0-9]*' | grep -o '[0-9]*')
    IOPS=$(fio --filename=${FILE_NAME} --direct=1 --rw=${TYPE} \
               --ioengine=libaio --bs=${BLOCK_SIZE} --rwmixread=${RW_MIXREAD} --iodepth=${IO_DEPTH} \
               --numjobs=${NUM_JOBS} --runtime=${RUN_TIME} --group_reporting \
               --name=bench | grep -o 'iops=[0-9]*' | grep -o '[0-9]*')
    printf "%7s iops=%d\n" "Step-${i}" "${IOPS}"
    IOPS_ARRAY="${IOPS_ARRAY} ${IOPS}"
    SUM=$((SUM+IOPS))
done

echo "----------------"
echo "IOPS - AVG: $((SUM/EXECUTE_NUM)) $(MIX_MAX ${IOPS_ARRAY})"
