# Benchmark historys
本目錄為所有測試紀錄與測試指令。

- [rados object using rados-bench](#rados-object-using-rados-bench)
- [rados block device using rbd-bench](#rados-block-device-using-rbd-bench)
- [rados block device using fio-rbd](#rados-block-device-using fio-rbd)
- [rados block device using fio-libaio](#rados-block-device-using-fio-libaio)
- [rados file system using fio-libaio](#rados-file-system-using-fio-libaio)
- [rados gateway using swift-bench](#rados-gateway-using-swift-bench)
- [rados gateway using cosbench](#rados-gateway-using-cosbench)

### rados object using rados-bench
Write 測試指令：
```sh
$ sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
$ rados bench -p bench 20 -b 4K write -t 1 --no-cleanup
```

Read 測試指令：
```sh
$ sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
$ rados bench -p bench 20 -t 1 seq
```

Cleanup 測試指令：
```sh
$ rados -p bench cleanup
```

### rados block device using rbd-bench
測試指令：
```sh
$ rbd bench-write block-device --io-size 4K \
--io-threads 1 --io-total 1024M --io-pattern seq \
--pool=bench
```

### rados block device using fio-rbd
以下為測試的組態檔與指令。組態檔如下：
```sh
[global]
# write_iops_log=write_iops_log
# write_bw_log=write_bw_log
# write_lat_log=write_lat_log

ioengine=rbd
clientname=admin
pool=bench
rbdname=block-device
rw=randrw
bs=4k
runtime=20
numjobs=1
direct=1

[rbd_iodepth32]
iodepth=32
```

IOPs Write：
```sh
$ fio --direct="1" --ioengine="rbd" --clientname="admin" --pool="bench" \
--rbdname="bd" --bs="4k" --rw="write" \
--runtime="60" --iodepth="16" --group_reporting \
--name="fio-rbd"
```

IOPs Read：
```sh
$ fio --direct="1" --ioengine="rbd" --clientname="admin" --pool="bench" \
--rbdname="bd" --bs="4k" --rw="read" --numjobs="1" \
--runtime="60" --iodepth="16" --group_reporting \
--name="fio-rbd"
```

Throughput Write and read 指令：
```sh
$ fio --direct="1" --ioengine="rbd" --clientname="admin" --pool="bench" \
--rbdname="block-device" --bs="4M" --rw="write" --group_reporting \
--runtime="60" --iodepth="16" --size="5G" \
--name="fio-rbd"
```

### rados block device using fio-libaio
以下為測試的組態檔與指令。組態檔如下：
```sh
[global]
ioengine=libaio
rw=write
bs=4k
runtime=20
size=5g
numjobs=1
direct=1
directory=/mnt/block-device
filename=block-device-libaio.txt

[rbd_iodepth32]
iodepth=32
```

IOPS Write 指令：
```sh
$ fio --filename="/mnt/block-device/test" --direct="1" --ioengine="libaio" \
--bs="4k" --rw="write" --size="5G" \
--runtime="20" --iodepth="16" --group_reporting \
--name="libaio-for-rbd"
```

IOPS Read 指令：
```sh
$ fio --filename="/mnt/block-device/test" --direct="1" --ioengine="libaio" \
--bs="4k" --rw="read" --size="5G" --numjobs=1 \
--runtime="20" --iodepth="16" --group_reporting \
--name="libaio-for-rbd"
```

Throughput Write and read 指令：
```sh
$ fio --filename="/mnt/block-device/test" --direct="1" --ioengine="libaio" \
--bs="4M" --rw="write" --size="5G" --group_reporting \
--runtime="60" --iodepth="16" \
--name="libaio-filesystem"
```

### rados file system using fio-libaio
以下為測試的組態檔與指令。組態檔如下：
```sh
[global]
ioengine=libaio
rw=read
bs=4k
runtime=20
size=5g
numjobs=1
direct=1
directory=/mnt/file-system
filename=test

[rbd_iodepth32]
iodepth=32
```

IOPS Write 指令：
```sh
$ fio --filename="/mnt/file-system/test" --direct="1" --ioengine="libaio" \
--bs="4k" --rw="write" --size="5G" --group_reporting \
--runtime="20" --iodepth="16" \
--name="libaio-filesystem"
```

IOPS Read 指令：
```sh
$ fio --filename="/mnt/file-system/test" --direct="1" --ioengine="libaio" \
--bs="4k" --rw="read" --size="5G" --numjobs=1 \
--runtime="20" --iodepth="16" --group_reporting \
--name="libaio-filesystem"
```

Throughput Write and read 指令：
```sh
$ fio --filename="/mnt/file-system/test" --direct="1" --ioengine="libaio" \
--bs="4M" --rw="write" --size="5G" --group_reporting \
--runtime="60" --iodepth="16" \
--name="libaio-filesystem"
```

### rados gateway using swift-bench
建立 radosgw user：
```sh
$ radosgw-admin user create --uid="benchmark" --display-name="benchmark"
$ radosgw-admin subuser create --uid=benchmark --subuser=benchmark:swift --access=full
$ radosgw-admin key create --subuser=benchmark:swift --key-type=swift --secret=guessme
$ radosgw-admin user modify --uid=benchmark --max-buckets=0
```

測試指令：
```sh
$ swift-bench -c 64 -s 4096 -n 100 -g 100 swift.conf
```

組態檔```swift-bench.conf```設定如下所示：
```
[bench]
auth = http://10.26.1.235:7480/auth/v1.0
user = benchmark:swift
key = guessme
auth_version = 1.0

concurrency = 10
object_size = 1
num_objects = 1000
num_gets = 10000
delete = yes
policy_name = gold
```

單位為```objects/sec```。

### rados gateway using cosbench
Swift auth info：
```
username=benchmark:swift;password=guessme;url=http://10.26.1.235:7480/auth/v1.0
```
