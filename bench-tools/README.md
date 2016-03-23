# Benchmark Tools
本節整理將使用到的 Benchmark Tools。

### dd
```sh
$ dd if=/dev/zero of=/dev/sd[x] bs=1G count=1 status=progress
```

### dcfldd
```sh
$ time dcfldd if=/dev/zero of=/dev/sd[x] bs=4M
```

### hdparm
```sh
$ hdparm -t /dev/sd[x]
```

### fio
```sh
$ fio --filename=/dev/sd[x] --direct=1 --rw=write \
--ioengine=libaio --bs=4k --rwmixread=100 --iodepth=16 \
--numjobs=16 --runtime=20 --group_reporting \
--name=bench
```

### iozone
```sh
$ iozone -i 5 /dev/sd[x] -y 4k -q 2m -g 2m
```

### iostat
```sh
$ while true; do iostat -x; sleep 1; done
```

### ioping
```sh
$ ioping -c 10 /dev/sd[x]
```

### bonnie++
```sh
$ bonnie++ -d /dev/sd[x] -s 8196 -u root
```
> 測試目標可以是目錄。

### iperf (network)
Server :
```sh
$ iperf -s
```
Client :
```sh
$ iperf -c <server>
```

### rados bench
Write：
```sh
$ rados bench -p scbench 20 write -t 8 --no-cleanup
```
Seq read：
```sh
$  rados bench -p scbench 20 -t 8 seq
```
Rand read：
```sh
$  rados bench -p scbench 20 -t 8 rand
```
Clean data：
```sh
$ rados -p scbench cleanup
```

### rbd bench-write
```sh
$ rbd bench-write bench-image --pool=rbd
```

### Swift benchmark
```sh
$ swift-bench -c 64 -s 4096 -n 1000 -g 100 /tmp/swift.conf
```

### OSD Benchmark
```sh
$ time ceph tell osd.0 bench
```
