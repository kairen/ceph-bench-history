#!/bin/bash

if [[ -z $1 ]] && [[ -z $2 ]] && [[ -z $3 ]] && [[ -z $4 ]] && [[ -z $5 ]] && [[ -z $6 ]] ; then
	echo "Usage : "
	echo "bench {pool_name} {block_size_mb} {bench_sec} {write/seq} {threads_num} {ouput_file_dir}"
	echo "Example: bench rbd 1 10 write 0 ./home/"
	exit 1
fi

echo -e "Pool Name : $1 \nBlock Size : $2\nBench Sec : $3\nType : $4\nThreads Number : $5\n"
read -p "* Benchmarking number：" bench_number

if [ "$bench_number" -gt 0 ] 2>/dev/null; then
	echo ""
else
	echo "ERROR："
	echo "This is not a Number"
	exit 1
fi

BLOCK_SIZE=""
if [ $2 != "0" ]; then
	BLOCK_SIZE="-b $2"
if

THREADS_NUM=""
if [ $5 != "0" ]; then
	THREADS_NUM="-t $5"
if

function bench() {
	for sitenu in $(seq 1 $bench_number)
	do
		echo "Bench step $sitenu ..."
		# rados -p $1 bench $BLOCK_SIZE $3 $4 $THREADS_NUM > $6
	done
}

case  $4 in
  "write")
	echo "START Write Benchmarking ..."
	bench
	;;
  "seq")
	echo "START Seq Read Benchmarking ..."
#	WRITE=$(rados -p $1 bench $BLOCK_SIZE $3 $4 $THREADS_NUM --no-cleanup)
	bench
	;;
  *)
	echo "ERROR："
	echo "Not Supporting type name ..."
	exit 1
	;;
esac
