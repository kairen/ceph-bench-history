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
> * read 循序讀取
> * write 循序寫入
> * rw,readwrite 循序讀寫

> * randwrite 隨機寫入
> * randread 隨機讀取
> * randrw 隨機讀寫


> * io 總共輸出輸入量
> * bw：頻寬 KB/s
> * iops：每秒 IO 數
> * runt：總執行時間
> * lat (msec)：延遲(毫秒)
> * msec： 毫秒


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
> 其他參數：
```sh
$ bench <seconds> write|seq|rand [-t concurrent_operations] [--no-cleanup] [--run-name run_name]
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
> 其他參數：
```sh
$ bench-write <image-spec>                    simple write benchmark
             --io-size <size in B/K/M/G/T>    write size
             --io-threads <num>               ios in flight
             --io-total <size in B/K/M/G/T>   total size to write
             --io-pattern <seq|rand>          write pattern
```

### Swift benchmark
```sh
$ swift-bench -c 64 -s 4096 -n 1000 -g 100 /tmp/swift.conf
```

### SSBench


### COSBench
首先安裝 JRE 與 Git 工具：
```sh
$ sudo apt-get install -y openjdk-7-jre git
```

接著下載專案，並切換到 cosbench release 目錄：
```sh
$ wget https://github.com/intel-cloud/cosbench/releases/download/v0.4.1.0/0.4.1.0.zip
$ unzip 0.4.1.0.zip && mv 0.4.1.0 cosbench
$ chmod +x *.sh
```

接著驗證安裝：
```sh
$ ./start-all.sh
$ ./cli.sh submit conf/workload-config.xml
$ ./cli.sh info
$ ./cli.sh cancel w1
$ ./stop-all.sh
```

### OSD Benchmark
```sh
$ time ceph tell osd.0 bench
```
