# rados block device using fio-libaio

- [Configuration and command](#configuration-and-command)
- [Write](#write)
- [Read](#read)
- [Read Write](#read-write)
- [Rand Write](#rand-write)
- [Rand Read](#rand-read)
- [Rand Read Write](#rand-read-write)
- [Throughput Write](#throughput-write)
- [Throughput Read](#throughput-read)

## Configuration and command
以下為測試的組態檔與項目連結。組態檔如下：
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

### WRITE
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-for-rbd: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/1660KB/0KB /s] [0/415/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=6535: Thu Jun 16 16:21:56 2016
  write: io=49444KB, bw=2469.7KB/s, iops=617, runt= 20021msec
    slat (usec): min=11, max=19611, avg=39.66, stdev=298.75
    clat (msec): min=6, max=212, avg=25.87, stdev=17.91
     lat (msec): min=6, max=212, avg=25.91, stdev=17.91
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   12], 10.00th=[   13], 20.00th=[   15],
     | 30.00th=[   16], 40.00th=[   18], 50.00th=[   25], 60.00th=[   29],
     | 70.00th=[   34], 80.00th=[   36], 90.00th=[   38], 95.00th=[   40],
     | 99.00th=[   57], 99.50th=[  178], 99.90th=[  204], 99.95th=[  204],
     | 99.99th=[  212]
    bw (KB  /s): min= 1304, max= 4612, per=100.00%, avg=2469.79, stdev=938.77
    lat (msec) : 10=2.79%, 20=42.99%, 50=53.01%, 100=0.31%, 250=0.91%
  cpu          : usr=0.29%, sys=1.76%, ctx=13885, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12361/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=49444KB, aggrb=2469KB/s, minb=2469KB/s, maxb=2469KB/s, mint=20021msec, maxt=20021msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2116KB/0KB /s] [0/529/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=7548: Thu Jun 16 16:22:29 2016
  write: io=48920KB, bw=2443.5KB/s, iops=610, runt= 20021msec
    slat (usec): min=7, max=191635, avg=60.72, stdev=2442.75
    clat (msec): min=6, max=224, avg=26.13, stdev=20.25
     lat (msec): min=6, max=225, avg=26.19, stdev=20.38
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   12], 10.00th=[   13], 20.00th=[   16],
     | 30.00th=[   18], 40.00th=[   19], 50.00th=[   25], 60.00th=[   28],
     | 70.00th=[   34], 80.00th=[   35], 90.00th=[   38], 95.00th=[   39],
     | 99.00th=[  157], 99.50th=[  194], 99.90th=[  225], 99.95th=[  225],
     | 99.99th=[  225]
    bw (KB  /s): min= 1238, max= 4422, per=100.00%, avg=2452.18, stdev=927.17
    lat (msec) : 10=2.44%, 20=44.06%, 50=52.13%, 100=0.21%, 250=1.16%
  cpu          : usr=0.40%, sys=1.37%, ctx=13740, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12230/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=48920KB, aggrb=2443KB/s, minb=2443KB/s, maxb=2443KB/s, mint=20021msec, maxt=20021msec
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2080KB/0KB /s] [0/520/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=8562: Thu Jun 16 16:23:03 2016
  write: io=50944KB, bw=2544.5KB/s, iops=636, runt= 20022msec
    slat (usec): min=7, max=195600, avg=47.19, stdev=1744.48
    clat (msec): min=5, max=208, avg=25.10, stdev=16.94
     lat (msec): min=5, max=208, avg=25.15, stdev=17.01
    clat percentiles (msec):
     |  1.00th=[    9],  5.00th=[   11], 10.00th=[   13], 20.00th=[   15],
     | 30.00th=[   16], 40.00th=[   18], 50.00th=[   25], 60.00th=[   28],
     | 70.00th=[   34], 80.00th=[   35], 90.00th=[   37], 95.00th=[   39],
     | 99.00th=[   50], 99.50th=[  176], 99.90th=[  200], 99.95th=[  200],
     | 99.99th=[  208]
    bw (KB  /s): min= 1390, max= 4771, per=100.00%, avg=2557.23, stdev=1032.01
    lat (msec) : 10=4.00%, 20=42.43%, 50=52.61%, 100=0.21%, 250=0.75%
  cpu          : usr=0.23%, sys=1.61%, ctx=14047, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12736/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=50944KB, aggrb=2544KB/s, minb=2544KB/s, maxb=2544KB/s, mint=20022msec, maxt=20022msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/1576KB/0KB /s] [0/394/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=9657: Thu Jun 16 16:23:36 2016
  write: io=49452KB, bw=2469.4KB/s, iops=617, runt= 20026msec
    slat (usec): min=7, max=198775, avg=60.33, stdev=2459.43
    clat (msec): min=6, max=229, avg=25.85, stdev=21.33
     lat (msec): min=6, max=229, avg=25.91, stdev=21.45
    clat percentiles (msec):
     |  1.00th=[    9],  5.00th=[   11], 10.00th=[   13], 20.00th=[   15],
     | 30.00th=[   16], 40.00th=[   18], 50.00th=[   24], 60.00th=[   28],
     | 70.00th=[   34], 80.00th=[   35], 90.00th=[   37], 95.00th=[   39],
     | 99.00th=[  174], 99.50th=[  196], 99.90th=[  227], 99.95th=[  229],
     | 99.99th=[  229]
    bw (KB  /s): min= 1229, max= 4855, per=100.00%, avg=2477.05, stdev=964.41
    lat (msec) : 10=4.02%, 20=43.78%, 50=50.70%, 100=0.23%, 250=1.28%
  cpu          : usr=0.45%, sys=1.34%, ctx=13763, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12363/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=49452KB, aggrb=2469KB/s, minb=2469KB/s, maxb=2469KB/s, mint=20026msec, maxt=20026msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2612KB/0KB /s] [0/653/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=10518: Thu Jun 16 16:24:04 2016
  write: io=52276KB, bw=2611.4KB/s, iops=652, runt= 20019msec
    slat (usec): min=8, max=18532, avg=35.18, stdev=245.23
    clat (msec): min=5, max=209, avg=24.47, stdev=15.88
     lat (msec): min=5, max=209, avg=24.50, stdev=15.88
    clat percentiles (msec):
     |  1.00th=[    9],  5.00th=[   11], 10.00th=[   12], 20.00th=[   14],
     | 30.00th=[   16], 40.00th=[   18], 50.00th=[   24], 60.00th=[   27],
     | 70.00th=[   33], 80.00th=[   35], 90.00th=[   37], 95.00th=[   39],
     | 99.00th=[   48], 99.50th=[  165], 99.90th=[  206], 99.95th=[  210],
     | 99.99th=[  210]
    bw (KB  /s): min= 1279, max= 4902, per=100.00%, avg=2627.46, stdev=947.33
    lat (msec) : 10=3.98%, 20=42.78%, 50=52.35%, 100=0.28%, 250=0.61%
  cpu          : usr=0.40%, sys=1.48%, ctx=15037, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=13069/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=52276KB, aggrb=2611KB/s, minb=2611KB/s, maxb=2611KB/s, mint=20019msec, maxt=20019msec
```

### READ
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-for-rbd: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [R(1)] [100.0% done] [39524KB/0KB/0KB /s] [9881/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=15638: Thu Jun 16 16:26:53 2016
  read : io=798216KB, bw=39907KB/s, iops=9976, runt= 20002msec
    slat (usec): min=7, max=5044, avg=22.54, stdev=22.99
    clat (usec): min=249, max=9345, avg=1578.00, stdev=484.58
     lat (usec): min=487, max=9369, avg=1601.13, stdev=484.35
    clat percentiles (usec):
     |  1.00th=[  980],  5.00th=[ 1064], 10.00th=[ 1112], 20.00th=[ 1208],
     | 30.00th=[ 1304], 40.00th=[ 1400], 50.00th=[ 1480], 60.00th=[ 1592],
     | 70.00th=[ 1720], 80.00th=[ 1896], 90.00th=[ 2128], 95.00th=[ 2320],
     | 99.00th=[ 3152], 99.50th=[ 3696], 99.90th=[ 6112], 99.95th=[ 7328],
     | 99.99th=[ 8512]
    bw (KB  /s): min=33840, max=48784, per=100.00%, avg=39911.79, stdev=3916.17
    lat (usec) : 250=0.01%, 500=0.01%, 750=0.14%, 1000=1.27%
    lat (msec) : 2=83.90%, 4=14.38%, 10=0.31%
  cpu          : usr=4.19%, sys=19.23%, ctx=346246, majf=0, minf=46
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=199554/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=798216KB, aggrb=39906KB/s, minb=39906KB/s, maxb=39906KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [37668KB/0KB/0KB /s] [9417/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=3107: Thu Jun 16 16:37:40 2016
  read : io=785640KB, bw=39278KB/s, iops=9819, runt= 20002msec
    slat (usec): min=7, max=5399, avg=22.51, stdev=22.98
    clat (usec): min=291, max=11561, avg=1603.67, stdev=531.57
     lat (usec): min=379, max=11574, avg=1626.76, stdev=531.26
    clat percentiles (usec):
     |  1.00th=[  980],  5.00th=[ 1048], 10.00th=[ 1096], 20.00th=[ 1192],
     | 30.00th=[ 1288], 40.00th=[ 1400], 50.00th=[ 1496], 60.00th=[ 1624],
     | 70.00th=[ 1768], 80.00th=[ 1960], 90.00th=[ 2192], 95.00th=[ 2448],
     | 99.00th=[ 3248], 99.50th=[ 3696], 99.90th=[ 6112], 99.95th=[ 7648],
     | 99.99th=[10560]
    bw (KB  /s): min=28144, max=48664, per=99.96%, avg=39260.85, stdev=4694.44
    lat (usec) : 500=0.03%, 750=0.22%, 1000=1.23%
    lat (msec) : 2=80.70%, 4=17.50%, 10=0.31%, 20=0.02%
  cpu          : usr=4.09%, sys=19.12%, ctx=336459, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=196410/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=785640KB, aggrb=39278KB/s, minb=39278KB/s, maxb=39278KB/s, mint=20002msec, maxt=20002msec

Disk stats (read/write):
  rbd1: ios=195468/0, merge=0/0, ticks=313552/0, in_queue=313552, util=99.06%
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [38040KB/0KB/0KB /s] [9510/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=4200: Thu Jun 16 16:38:17 2016
  read : io=792400KB, bw=39614KB/s, iops=9903, runt= 20003msec
    slat (usec): min=7, max=3800, avg=22.46, stdev=17.97
    clat (usec): min=274, max=8591, avg=1589.90, stdev=478.58
     lat (usec): min=370, max=8609, avg=1612.93, stdev=478.39
    clat percentiles (usec):
     |  1.00th=[  980],  5.00th=[ 1064], 10.00th=[ 1128], 20.00th=[ 1224],
     | 30.00th=[ 1304], 40.00th=[ 1384], 50.00th=[ 1464], 60.00th=[ 1608],
     | 70.00th=[ 1768], 80.00th=[ 1944], 90.00th=[ 2128], 95.00th=[ 2320],
     | 99.00th=[ 3120], 99.50th=[ 3664], 99.90th=[ 5344], 99.95th=[ 6112],
     | 99.99th=[ 7968]
    bw (KB  /s): min=33816, max=46032, per=99.93%, avg=39587.69, stdev=3067.46
    lat (usec) : 500=0.02%, 750=0.25%, 1000=1.13%
    lat (msec) : 2=81.50%, 4=16.78%, 10=0.32%
  cpu          : usr=4.35%, sys=18.97%, ctx=341907, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=198100/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=792400KB, aggrb=39614KB/s, minb=39614KB/s, maxb=39614KB/s, mint=20003msec, maxt=20003msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [36544KB/0KB/0KB /s] [9136/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=7522: Thu Jun 16 16:40:05 2016
  read : io=764388KB, bw=38216KB/s, iops=9553, runt= 20002msec
    slat (usec): min=7, max=4261, avg=22.58, stdev=27.17
    clat (usec): min=243, max=9111, avg=1649.00, stdev=517.31
     lat (usec): min=467, max=9123, avg=1672.15, stdev=517.02
    clat percentiles (usec):
     |  1.00th=[  996],  5.00th=[ 1096], 10.00th=[ 1144], 20.00th=[ 1272],
     | 30.00th=[ 1368], 40.00th=[ 1448], 50.00th=[ 1512], 60.00th=[ 1640],
     | 70.00th=[ 1800], 80.00th=[ 1976], 90.00th=[ 2192], 95.00th=[ 2512],
     | 99.00th=[ 3472], 99.50th=[ 3792], 99.90th=[ 5472], 99.95th=[ 6816],
     | 99.99th=[ 8640]
    bw (KB  /s): min=26640, max=46896, per=100.00%, avg=38348.72, stdev=3907.21
    lat (usec) : 250=0.01%, 500=0.01%, 750=0.21%, 1000=0.89%
    lat (msec) : 2=79.93%, 4=18.61%, 10=0.35%
  cpu          : usr=3.99%, sys=18.38%, ctx=336672, majf=0, minf=48
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=191097/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=764388KB, aggrb=38215KB/s, minb=38215KB/s, maxb=38215KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [39176KB/0KB/0KB /s] [9794/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=8468: Thu Jun 16 16:40:37 2016
  read : io=800976KB, bw=40045KB/s, iops=10011, runt= 20002msec
    slat (usec): min=7, max=3628, avg=22.27, stdev=13.84
    clat (usec): min=369, max=9346, avg=1572.71, stdev=472.09
     lat (usec): min=397, max=9366, avg=1595.57, stdev=471.84
    clat percentiles (usec):
     |  1.00th=[  972],  5.00th=[ 1064], 10.00th=[ 1112], 20.00th=[ 1208],
     | 30.00th=[ 1304], 40.00th=[ 1384], 50.00th=[ 1480], 60.00th=[ 1592],
     | 70.00th=[ 1736], 80.00th=[ 1896], 90.00th=[ 2096], 95.00th=[ 2288],
     | 99.00th=[ 2992], 99.50th=[ 3536], 99.90th=[ 5792], 99.95th=[ 7264],
     | 99.99th=[ 8512]
    bw (KB  /s): min=33328, max=47304, per=99.81%, avg=39967.51, stdev=3422.37
    lat (usec) : 500=0.01%, 750=0.23%, 1000=1.17%
    lat (msec) : 2=84.42%, 4=13.85%, 10=0.32%
  cpu          : usr=4.28%, sys=19.39%, ctx=343136, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=200244/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=800976KB, aggrb=40044KB/s, minb=40044KB/s, maxb=40044KB/s, mint=20002msec, maxt=20002msec
```

### READ-WRITE
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-for-rbd: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [M(1)] [100.0% done] [648KB/504KB/0KB /s] [162/126/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=11729: Thu Jun 16 16:42:25 2016
  read : io=13576KB, bw=693081B/s, iops=169, runt= 20058msec
    slat (usec): min=7, max=203671, avg=84.51, stdev=3495.61
    clat (usec): min=351, max=594116, avg=44380.65, stdev=37032.90
     lat (usec): min=465, max=594137, avg=44465.75, stdev=37125.84
    clat percentiles (usec):
     |  1.00th=[ 1240],  5.00th=[17024], 10.00th=[21632], 20.00th=[25728],
     | 30.00th=[29056], 40.00th=[31872], 50.00th=[35584], 60.00th=[41216],
     | 70.00th=[51968], 80.00th=[62720], 90.00th=[74240], 95.00th=[83456],
     | 99.00th=[119296], 99.50th=[218112], 99.90th=[585728], 99.95th=[585728],
     | 99.99th=[593920]
    bw (KB  /s): min=   70, max= 1189, per=100.00%, avg=682.15, stdev=294.10
  write: io=13492KB, bw=688792B/s, iops=168, runt= 20058msec
    slat (usec): min=8, max=202332, avg=150.55, stdev=4799.67
    clat (msec): min=6, max=605, avg=50.22, stdev=37.12
     lat (msec): min=7, max=605, avg=50.37, stdev=37.30
    clat percentiles (msec):
     |  1.00th=[   17],  5.00th=[   23], 10.00th=[   26], 20.00th=[   30],
     | 30.00th=[   33], 40.00th=[   36], 50.00th=[   39], 60.00th=[   45],
     | 70.00th=[   60], 80.00th=[   72], 90.00th=[   85], 95.00th=[   93],
     | 99.00th=[  184], 99.50th=[  223], 99.90th=[  586], 99.95th=[  594],
     | 99.99th=[  603]
    bw (KB  /s): min=   63, max= 1187, per=100.00%, avg=678.41, stdev=294.87
    lat (usec) : 500=0.06%, 750=0.21%, 1000=0.12%
    lat (msec) : 2=0.38%, 4=0.06%, 10=0.18%, 20=4.33%, 50=60.41%
    lat (msec) : 100=32.11%, 250=1.85%, 500=0.06%, 750=0.24%
  cpu          : usr=0.21%, sys=0.82%, ctx=9398, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=3394/w=3373/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=13576KB, aggrb=676KB/s, minb=676KB/s, maxb=676KB/s, mint=20058msec, maxt=20058msec
  WRITE: io=13492KB, aggrb=672KB/s, minb=672KB/s, maxb=672KB/s, mint=20058msec, maxt=20058msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [520KB/536KB/0KB /s] [130/134/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=18206: Thu Jun 16 17:03:25 2016
  read : io=14208KB, bw=725526B/s, iops=177, runt= 20053msec
    slat (usec): min=7, max=192482, avg=185.36, stdev=5527.30
    clat (usec): min=232, max=240448, avg=41777.79, stdev=23358.35
     lat (usec): min=472, max=240464, avg=41963.72, stdev=23723.59
    clat percentiles (usec):
     |  1.00th=[ 1080],  5.00th=[17792], 10.00th=[21376], 20.00th=[25472],
     | 30.00th=[29056], 40.00th=[31872], 50.00th=[35584], 60.00th=[41216],
     | 70.00th=[50944], 80.00th=[59136], 90.00th=[68096], 95.00th=[73216],
     | 99.00th=[112128], 99.50th=[199680], 99.90th=[230400], 99.95th=[232448],
     | 99.99th=[240640]
    bw (KB  /s): min=  349, max= 1200, per=100.00%, avg=714.28, stdev=259.45
  write: io=14152KB, bw=722667B/s, iops=176, runt= 20053msec
    slat (usec): min=9, max=133, avg=33.47, stdev=14.97
    clat (msec): min=5, max=240, avg=48.50, stdev=28.14
     lat (msec): min=5, max=240, avg=48.53, stdev=28.14
    clat percentiles (msec):
     |  1.00th=[   18],  5.00th=[   23], 10.00th=[   26], 20.00th=[   30],
     | 30.00th=[   32], 40.00th=[   36], 50.00th=[   40], 60.00th=[   48],
     | 70.00th=[   59], 80.00th=[   67], 90.00th=[   76], 95.00th=[   84],
     | 99.00th=[  194], 99.50th=[  212], 99.90th=[  231], 99.95th=[  231],
     | 99.99th=[  241]
    bw (KB  /s): min=  340, max= 1211, per=100.00%, avg=710.54, stdev=270.86
    lat (usec) : 250=0.01%, 500=0.10%, 750=0.24%, 1000=0.10%
    lat (msec) : 2=0.28%, 4=0.08%, 10=0.18%, 20=4.30%, 50=60.17%
    lat (msec) : 100=32.58%, 250=1.95%
  cpu          : usr=0.16%, sys=0.93%, ctx=10038, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=3552/w=3538/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=14208KB, aggrb=708KB/s, minb=708KB/s, maxb=708KB/s, mint=20053msec, maxt=20053msec
  WRITE: io=14152KB, aggrb=705KB/s, minb=705KB/s, maxb=705KB/s, mint=20053msec, maxt=20053msec
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [440KB/464KB/0KB /s] [110/116/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=19112: Thu Jun 16 17:03:56 2016
  read : io=14044KB, bw=716259B/s, iops=174, runt= 20078msec
    slat (usec): min=7, max=416, avg=24.69, stdev=11.76
    clat (usec): min=455, max=275238, avg=42486.63, stdev=24524.50
     lat (usec): min=473, max=275270, avg=42511.91, stdev=24524.36
    clat percentiles (usec):
     |  1.00th=[ 1352],  5.00th=[17792], 10.00th=[21376], 20.00th=[25728],
     | 30.00th=[28800], 40.00th=[31872], 50.00th=[35584], 60.00th=[40704],
     | 70.00th=[51456], 80.00th=[59648], 90.00th=[71168], 95.00th=[78336],
     | 99.00th=[112128], 99.50th=[203776], 99.90th=[234496], 99.95th=[264192],
     | 99.99th=[276480]
    bw (KB  /s): min=  315, max= 1182, per=100.00%, avg=707.67, stdev=263.60
  write: io=13988KB, bw=713403B/s, iops=174, runt= 20078msec
    slat (usec): min=7, max=191681, avg=193.75, stdev=5490.06
    clat (msec): min=5, max=248, avg=48.96, stdev=29.00
     lat (msec): min=7, max=248, avg=49.15, stdev=29.29
    clat percentiles (msec):
     |  1.00th=[   17],  5.00th=[   23], 10.00th=[   26], 20.00th=[   29],
     | 30.00th=[   33], 40.00th=[   36], 50.00th=[   39], 60.00th=[   47],
     | 70.00th=[   59], 80.00th=[   69], 90.00th=[   80], 95.00th=[   89],
     | 99.00th=[  192], 99.50th=[  223], 99.90th=[  241], 99.95th=[  249],
     | 99.99th=[  249]
    bw (KB  /s): min=  333, max= 1189, per=100.00%, avg=704.15, stdev=269.58
    lat (usec) : 500=0.06%, 750=0.20%, 1000=0.09%
    lat (msec) : 2=0.27%, 4=0.06%, 10=0.27%, 20=4.24%, 50=59.87%
    lat (msec) : 100=32.85%, 250=2.05%, 500=0.04%
  cpu          : usr=0.24%, sys=0.83%, ctx=9744, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=3511/w=3497/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=14044KB, aggrb=699KB/s, minb=699KB/s, maxb=699KB/s, mint=20078msec, maxt=20078msec
  WRITE: io=13988KB, aggrb=696KB/s, minb=696KB/s, maxb=696KB/s, mint=20078msec, maxt=20078msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [472KB/492KB/0KB /s] [118/123/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=23729: Thu Jun 16 17:06:25 2016
  read : io=14092KB, bw=719818B/s, iops=175, runt= 20047msec
    slat (usec): min=7, max=184426, avg=77.29, stdev=3106.78
    clat (usec): min=185, max=264420, avg=42604.33, stdev=24864.43
     lat (usec): min=481, max=264442, avg=42682.21, stdev=24968.76
    clat percentiles (usec):
     |  1.00th=[  980],  5.00th=[18304], 10.00th=[21632], 20.00th=[25728],
     | 30.00th=[29056], 40.00th=[32128], 50.00th=[35584], 60.00th=[41216],
     | 70.00th=[51456], 80.00th=[60160], 90.00th=[69120], 95.00th=[78336],
     | 99.00th=[101888], 99.50th=[203776], 99.90th=[254976], 99.95th=[264192],
     | 99.99th=[264192]
    bw (KB  /s): min=  241, max= 1229, per=100.00%, avg=706.92, stdev=258.81
  write: io=14024KB, bw=716345B/s, iops=174, runt= 20047msec
    slat (usec): min=7, max=191071, avg=141.92, stdev=4525.74
    clat (msec): min=4, max=228, avg=48.43, stdev=27.13
     lat (msec): min=9, max=228, avg=48.57, stdev=27.33
    clat percentiles (msec):
     |  1.00th=[   18],  5.00th=[   23], 10.00th=[   26], 20.00th=[   30],
     | 30.00th=[   33], 40.00th=[   36], 50.00th=[   40], 60.00th=[   48],
     | 70.00th=[   60], 80.00th=[   69], 90.00th=[   78], 95.00th=[   87],
     | 99.00th=[  184], 99.50th=[  210], 99.90th=[  229], 99.95th=[  229],
     | 99.99th=[  229]
    bw (KB  /s): min=  315, max= 1155, per=100.00%, avg=703.44, stdev=262.97
    lat (usec) : 250=0.01%, 500=0.07%, 750=0.23%, 1000=0.20%
    lat (msec) : 2=0.21%, 4=0.06%, 10=0.21%, 20=3.97%, 50=60.05%
    lat (msec) : 100=33.33%, 250=1.59%, 500=0.06%
  cpu          : usr=0.16%, sys=0.92%, ctx=9986, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=3523/w=3506/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=14092KB, aggrb=702KB/s, minb=702KB/s, maxb=702KB/s, mint=20047msec, maxt=20047msec
  WRITE: io=14024KB, aggrb=699KB/s, minb=699KB/s, maxb=699KB/s, mint=20047msec, maxt=20047msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [516KB/528KB/0KB /s] [129/132/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=24599: Thu Jun 16 17:06:54 2016
  read : io=14384KB, bw=733965B/s, iops=179, runt= 20068msec
    slat (usec): min=8, max=16977, avg=29.20, stdev=282.84
    clat (usec): min=449, max=258480, avg=41709.24, stdev=21687.06
     lat (usec): min=462, max=258502, avg=41739.00, stdev=21682.75
    clat percentiles (usec):
     |  1.00th=[ 1240],  5.00th=[18304], 10.00th=[21888], 20.00th=[25984],
     | 30.00th=[29312], 40.00th=[32640], 50.00th=[36096], 60.00th=[41216],
     | 70.00th=[50432], 80.00th=[58624], 90.00th=[67072], 95.00th=[73216],
     | 99.00th=[98816], 99.50th=[126464], 99.90th=[240640], 99.95th=[240640],
     | 99.99th=[259072]
    bw (KB  /s): min=  355, max= 1176, per=100.00%, avg=721.72, stdev=261.90
  write: io=14308KB, bw=730087B/s, iops=178, runt= 20068msec
    slat (usec): min=9, max=182478, avg=86.68, stdev=3052.96
    clat (msec): min=8, max=259, avg=47.69, stdev=24.65
     lat (msec): min=8, max=259, avg=47.78, stdev=24.76
    clat percentiles (msec):
     |  1.00th=[   18],  5.00th=[   24], 10.00th=[   26], 20.00th=[   30],
     | 30.00th=[   33], 40.00th=[   37], 50.00th=[   40], 60.00th=[   47],
     | 70.00th=[   58], 80.00th=[   67], 90.00th=[   75], 95.00th=[   84],
     | 99.00th=[  157], 99.50th=[  190], 99.90th=[  229], 99.95th=[  249],
     | 99.99th=[  260]
    bw (KB  /s): min=  336, max= 1168, per=100.00%, avg=719.41, stdev=266.10
    lat (usec) : 500=0.03%, 750=0.20%, 1000=0.20%
    lat (msec) : 2=0.25%, 4=0.06%, 10=0.06%, 20=3.40%, 50=61.49%
    lat (msec) : 100=32.83%, 250=1.46%, 500=0.03%
  cpu          : usr=0.24%, sys=0.86%, ctx=10010, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=3596/w=3577/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=14384KB, aggrb=716KB/s, minb=716KB/s, maxb=716KB/s, mint=20068msec, maxt=20068msec
  WRITE: io=14308KB, aggrb=712KB/s, minb=712KB/s, maxb=712KB/s, mint=20068msec, maxt=20068msec
```

### RAND-WRITE
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-for-rbd: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/2864KB/0KB /s] [0/716/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=28730: Thu Jun 16 17:09:11 2016
  write: io=72316KB, bw=3607.7KB/s, iops=901, runt= 20045msec
    slat (usec): min=13, max=23771, avg=47.80, stdev=184.80
    clat (msec): min=3, max=308, avg=17.68, stdev=19.68
     lat (msec): min=3, max=308, avg=17.73, stdev=19.68
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    6], 10.00th=[    6], 20.00th=[    8],
     | 30.00th=[    9], 40.00th=[   10], 50.00th=[   13], 60.00th=[   18],
     | 70.00th=[   20], 80.00th=[   24], 90.00th=[   30], 95.00th=[   42],
     | 99.00th=[  103], 99.50th=[  137], 99.90th=[  241], 99.95th=[  249],
     | 99.99th=[  306]
    bw (KB  /s): min= 1944, max= 4662, per=100.00%, avg=3607.97, stdev=784.80
    lat (msec) : 4=0.13%, 10=40.18%, 20=30.04%, 50=25.81%, 100=2.78%
    lat (msec) : 250=1.00%, 500=0.05%
  cpu          : usr=0.47%, sys=3.00%, ctx=28386, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=18079/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=72316KB, aggrb=3607KB/s, minb=3607KB/s, maxb=3607KB/s, mint=20045msec, maxt=20045msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/4072KB/0KB /s] [0/1018/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=31477: Thu Jun 16 17:10:41 2016
  write: io=73784KB, bw=3681.2KB/s, iops=920, runt= 20044msec
    slat (usec): min=9, max=11075, avg=36.85, stdev=131.17
    clat (msec): min=3, max=318, avg=17.34, stdev=18.57
     lat (msec): min=3, max=318, avg=17.38, stdev=18.57
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    6], 10.00th=[    6], 20.00th=[    8],
     | 30.00th=[    9], 40.00th=[   11], 50.00th=[   13], 60.00th=[   18],
     | 70.00th=[   21], 80.00th=[   24], 90.00th=[   29], 95.00th=[   37],
     | 99.00th=[  101], 99.50th=[  137], 99.90th=[  227], 99.95th=[  258],
     | 99.99th=[  306]
    bw (KB  /s): min= 1964, max= 4576, per=100.00%, avg=3684.95, stdev=769.16
    lat (msec) : 4=0.17%, 10=39.55%, 20=29.72%, 50=27.83%, 100=1.72%
    lat (msec) : 250=0.96%, 500=0.05%
  cpu          : usr=0.69%, sys=2.09%, ctx=27654, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=18446/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=73784KB, aggrb=3681KB/s, minb=3681KB/s, maxb=3681KB/s, mint=20044msec, maxt=20044msec
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/2876KB/0KB /s] [0/719/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=32346: Thu Jun 16 17:11:09 2016
  write: io=71624KB, bw=3577.9KB/s, iops=894, runt= 20019msec
    slat (usec): min=9, max=198154, avg=47.77, stdev=1497.97
    clat (msec): min=3, max=291, avg=17.83, stdev=20.11
     lat (msec): min=3, max=291, avg=17.88, stdev=20.18
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    6], 10.00th=[    6], 20.00th=[    8],
     | 30.00th=[    9], 40.00th=[   11], 50.00th=[   13], 60.00th=[   18],
     | 70.00th=[   20], 80.00th=[   24], 90.00th=[   29], 95.00th=[   39],
     | 99.00th=[  116], 99.50th=[  149], 99.90th=[  215], 99.95th=[  239],
     | 99.99th=[  281]
    bw (KB  /s): min= 1944, max= 4630, per=100.00%, avg=3592.21, stdev=806.11
    lat (msec) : 4=0.21%, 10=39.61%, 20=30.63%, 50=25.80%, 100=2.45%
    lat (msec) : 250=1.28%, 500=0.02%
  cpu          : usr=0.48%, sys=2.19%, ctx=26643, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=17906/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=71624KB, aggrb=3577KB/s, minb=3577KB/s, maxb=3577KB/s, mint=20019msec, maxt=20019msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/2952KB/0KB /s] [0/738/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=1296: Thu Jun 16 17:11:55 2016
  write: io=72176KB, bw=3602.6KB/s, iops=900, runt= 20035msec
    slat (usec): min=9, max=22020, avg=37.90, stdev=215.91
    clat (msec): min=3, max=563, avg=17.72, stdev=21.64
     lat (msec): min=3, max=563, avg=17.76, stdev=21.64
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    6], 10.00th=[    6], 20.00th=[    8],
     | 30.00th=[    9], 40.00th=[   10], 50.00th=[   13], 60.00th=[   18],
     | 70.00th=[   20], 80.00th=[   24], 90.00th=[   29], 95.00th=[   38],
     | 99.00th=[  106], 99.50th=[  145], 99.90th=[  215], 99.95th=[  383],
     | 99.99th=[  529]
    bw (KB  /s): min= 1248, max= 4768, per=100.00%, avg=3614.33, stdev=870.28
    lat (msec) : 4=0.29%, 10=39.95%, 20=29.92%, 50=26.35%, 100=2.31%
    lat (msec) : 250=1.09%, 500=0.07%, 750=0.02%
  cpu          : usr=0.55%, sys=2.16%, ctx=27068, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=18044/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=72176KB, aggrb=3602KB/s, minb=3602KB/s, maxb=3602KB/s, mint=20035msec, maxt=20035msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/2844KB/0KB /s] [0/711/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=2276: Thu Jun 16 17:12:27 2016
  write: io=72176KB, bw=3604.4KB/s, iops=901, runt= 20025msec
    slat (usec): min=8, max=29934, avg=38.27, stdev=273.84
    clat (msec): min=3, max=412, avg=17.71, stdev=21.10
     lat (msec): min=3, max=412, avg=17.75, stdev=21.10
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    5], 10.00th=[    6], 20.00th=[    7],
     | 30.00th=[    9], 40.00th=[   10], 50.00th=[   13], 60.00th=[   18],
     | 70.00th=[   21], 80.00th=[   24], 90.00th=[   29], 95.00th=[   38],
     | 99.00th=[  102], 99.50th=[  157], 99.90th=[  281], 99.95th=[  306],
     | 99.99th=[  396]
    bw (KB  /s): min= 1346, max= 4656, per=100.00%, avg=3634.69, stdev=840.31
    lat (msec) : 4=0.29%, 10=39.96%, 20=29.38%, 50=26.90%, 100=2.42%
    lat (msec) : 250=0.91%, 500=0.14%
  cpu          : usr=0.54%, sys=2.17%, ctx=27140, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=18044/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=72176KB, aggrb=3604KB/s, minb=3604KB/s, maxb=3604KB/s, mint=20025msec, maxt=20025msec
```

### RAND-READ
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [644.8MB/0KB/0KB /s] [165K/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=26772: Thu Jun 16 16:15:20 2016
  read : io=4341.8MB, bw=222284KB/s, iops=55571, runt= 20001msec
    slat (usec): min=1, max=942, avg= 3.38, stdev= 3.32
    clat (usec): min=0, max=44373, avg=282.41, stdev=2468.61
     lat (usec): min=2, max=44398, avg=286.09, stdev=2470.15
    clat percentiles (usec):
     |  1.00th=[   57],  5.00th=[   58], 10.00th=[   59], 20.00th=[   61],
     | 30.00th=[   66], 40.00th=[  100], 50.00th=[  100], 60.00th=[  101],
     | 70.00th=[  101], 80.00th=[  102], 90.00th=[  102], 95.00th=[  104],
     | 99.00th=[ 1640], 99.50th=[ 8160], 99.90th=[38144], 99.95th=[39168],
     | 99.99th=[40192]
    bw (KB  /s): min= 5242, max=852584, per=96.50%, avg=214509.21, stdev=319731.59
    lat (usec) : 2=0.16%, 4=0.01%, 10=0.01%, 20=0.01%, 50=0.59%
    lat (usec) : 100=38.71%, 250=58.57%, 500=0.02%, 750=0.32%, 1000=0.24%
    lat (msec) : 2=0.50%, 4=0.23%, 10=0.18%, 20=0.01%, 50=0.47%
  cpu          : usr=13.22%, sys=20.95%, ctx=35612, majf=0, minf=49
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1111476/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=4341.8MB, aggrb=222284KB/s, minb=222284KB/s, maxb=222284KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [597.6MB/0KB/0KB /s] [153K/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=27861: Thu Jun 16 16:15:56 2016
  read : io=4463.4MB, bw=228522KB/s, iops=57130, runt= 20000msec
    slat (usec): min=1, max=89, avg= 3.19, stdev= 3.05
    clat (usec): min=0, max=43809, avg=274.84, stdev=2460.79
     lat (usec): min=4, max=43833, avg=278.33, stdev=2462.31
    clat percentiles (usec):
     |  1.00th=[   56],  5.00th=[   57], 10.00th=[   57], 20.00th=[   58],
     | 30.00th=[   60], 40.00th=[   65], 50.00th=[  100], 60.00th=[  100],
     | 70.00th=[  101], 80.00th=[  102], 90.00th=[  102], 95.00th=[  104],
     | 99.00th=[ 1528], 99.50th=[ 7712], 99.90th=[38144], 99.95th=[39168],
     | 99.99th=[40192]
    bw (KB  /s): min= 4848, max=1018944, per=99.83%, avg=228124.72, stdev=346009.96
    lat (usec) : 2=0.01%, 4=0.01%, 10=0.01%, 20=0.01%, 50=0.01%
    lat (usec) : 100=48.71%, 250=49.37%, 500=0.03%, 750=0.31%, 1000=0.24%
    lat (msec) : 2=0.47%, 4=0.21%, 10=0.16%, 20=0.02%, 50=0.46%
  cpu          : usr=13.48%, sys=19.86%, ctx=35424, majf=0, minf=49
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1142608/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=4463.4MB, aggrb=228521KB/s, minb=228521KB/s, maxb=228521KB/s, mint=20000msec, maxt=20000msec
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [651.6MB/0KB/0KB /s] [167K/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=29091: Thu Jun 16 16:16:36 2016
  read : io=4234.1MB, bw=216775KB/s, iops=54193, runt= 20001msec
    slat (usec): min=1, max=431, avg= 3.33, stdev= 3.19
    clat (usec): min=0, max=42697, avg=289.82, stdev=2547.88
     lat (usec): min=4, max=42722, avg=293.44, stdev=2549.46
    clat percentiles (usec):
     |  1.00th=[   57],  5.00th=[   58], 10.00th=[   59], 20.00th=[   60],
     | 30.00th=[   64], 40.00th=[   77], 50.00th=[  101], 60.00th=[  102],
     | 70.00th=[  102], 80.00th=[  103], 90.00th=[  104], 95.00th=[  105],
     | 99.00th=[ 1624], 99.50th=[11200], 99.90th=[38144], 99.95th=[39168],
     | 99.99th=[40192]
    bw (KB  /s): min= 4854, max=910712, per=98.37%, avg=213244.10, stdev=322755.32
    lat (usec) : 2=0.02%, 4=0.01%, 10=0.01%, 20=0.01%, 50=0.01%
    lat (usec) : 100=44.65%, 250=53.31%, 500=0.03%, 750=0.32%, 1000=0.27%
    lat (msec) : 2=0.51%, 4=0.23%, 10=0.15%, 20=0.01%, 50=0.49%
  cpu          : usr=12.55%, sys=20.14%, ctx=35680, majf=0, minf=50
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1083927/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=4234.1MB, aggrb=216774KB/s, minb=216774KB/s, maxb=216774KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [626.4MB/0KB/0KB /s] [160K/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=30252: Thu Jun 16 16:17:14 2016
  read : io=4263.3MB, bw=218265KB/s, iops=54566, runt= 20001msec
    slat (usec): min=1, max=422, avg= 3.36, stdev= 3.16
    clat (usec): min=0, max=43436, avg=287.72, stdev=2511.47
     lat (usec): min=4, max=43488, avg=291.39, stdev=2513.03
    clat percentiles (usec):
     |  1.00th=[   56],  5.00th=[   57], 10.00th=[   58], 20.00th=[   60],
     | 30.00th=[   64], 40.00th=[  100], 50.00th=[  100], 60.00th=[  101],
     | 70.00th=[  101], 80.00th=[  102], 90.00th=[  102], 95.00th=[  104],
     | 99.00th=[ 1656], 99.50th=[10560], 99.90th=[38144], 99.95th=[39168],
     | 99.99th=[40192]
    bw (KB  /s): min= 5448, max=859000, per=98.60%, avg=215217.05, stdev=321350.66
    lat (usec) : 2=0.01%, 4=0.01%, 10=0.01%, 20=0.01%, 50=0.72%
    lat (usec) : 100=38.72%, 250=58.56%, 500=0.03%, 750=0.33%, 1000=0.25%
    lat (msec) : 2=0.50%, 4=0.22%, 10=0.16%, 20=0.02%, 50=0.48%
  cpu          : usr=12.78%, sys=20.64%, ctx=36004, majf=0, minf=49
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1091381/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=4263.3MB, aggrb=218265KB/s, minb=218265KB/s, maxb=218265KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [623.1MB/0KB/0KB /s] [160K/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=32052: Thu Jun 16 16:18:12 2016
  read : io=3532.5MB, bw=180861KB/s, iops=45215, runt= 20000msec
    slat (usec): min=1, max=770, avg= 3.63, stdev= 3.61
    clat (usec): min=0, max=43682, avg=347.99, stdev=2863.78
     lat (usec): min=3, max=43706, avg=351.94, stdev=2865.51
    clat percentiles (usec):
     |  1.00th=[   57],  5.00th=[   59], 10.00th=[   61], 20.00th=[   76],
     | 30.00th=[   99], 40.00th=[  100], 50.00th=[  101], 60.00th=[  101],
     | 70.00th=[  102], 80.00th=[  102], 90.00th=[  103], 95.00th=[  106],
     | 99.00th=[ 2480], 99.50th=[34560], 99.90th=[38656], 99.95th=[39168],
     | 99.99th=[40192]
    bw (KB  /s): min= 4854, max=771224, per=99.77%, avg=180440.03, stdev=290887.21
    lat (usec) : 2=0.01%, 4=0.01%, 10=0.01%, 20=0.01%, 50=0.70%
    lat (usec) : 100=30.79%, 250=66.09%, 500=0.03%, 750=0.38%, 1000=0.30%
    lat (msec) : 2=0.60%, 4=0.27%, 10=0.19%, 20=0.01%, 50=0.62%
  cpu          : usr=11.89%, sys=17.63%, ctx=36665, majf=0, minf=49
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=904307/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=3532.5MB, aggrb=180861KB/s, minb=180861KB/s, maxb=180861KB/s, mint=20000msec, maxt=20000msec
```

### RAND-READ-WRITE
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-for-rbd: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [m(1)] [100.0% done] [3840KB/3868KB/0KB /s] [960/967/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=5999: Thu Jun 16 17:14:31 2016
  read : io=61324KB, bw=3059.7KB/s, iops=764, runt= 20043msec
    slat (usec): min=7, max=50511, avg=29.40, stdev=408.41
    clat (usec): min=2, max=546930, avg=3842.41, stdev=25266.90
     lat (usec): min=358, max=546961, avg=3872.40, stdev=25269.57
    clat percentiles (usec):
     |  1.00th=[  470],  5.00th=[  516], 10.00th=[  540], 20.00th=[  572],
     | 30.00th=[  596], 40.00th=[  628], 50.00th=[  668], 60.00th=[  708],
     | 70.00th=[  772], 80.00th=[ 1032], 90.00th=[ 3888], 95.00th=[ 8096],
     | 99.00th=[42752], 99.50th=[203776], 99.90th=[382976], 99.95th=[423936],
     | 99.99th=[536576]
    bw (KB  /s): min= 1035, max= 4208, per=100.00%, avg=3063.00, stdev=882.18
  write: io=61488KB, bw=3067.9KB/s, iops=766, runt= 20043msec
    slat (usec): min=8, max=46526, avg=41.64, stdev=399.51
    clat (msec): min=3, max=416, avg=16.95, stdev=21.67
     lat (msec): min=3, max=416, avg=16.99, stdev=21.67
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    6], 10.00th=[    6], 20.00th=[    8],
     | 30.00th=[    8], 40.00th=[   11], 50.00th=[   13], 60.00th=[   18],
     | 70.00th=[   20], 80.00th=[   24], 90.00th=[   28], 95.00th=[   33],
     | 99.00th=[   79], 99.50th=[  157], 99.90th=[  334], 99.95th=[  396],
     | 99.99th=[  408]
    bw (KB  /s): min= 1282, max= 4024, per=99.84%, avg=3062.15, stdev=882.48
    lat (usec) : 4=0.01%, 250=0.01%, 500=1.38%, 750=32.33%, 1000=5.89%
    lat (msec) : 2=3.47%, 4=2.06%, 10=22.54%, 20=16.48%, 50=14.47%
    lat (msec) : 100=0.57%, 250=0.48%, 500=0.31%, 750=0.01%
  cpu          : usr=0.80%, sys=3.45%, ctx=51297, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=15331/w=15372/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=61324KB, aggrb=3059KB/s, minb=3059KB/s, maxb=3059KB/s, mint=20043msec, maxt=20043msec
  WRITE: io=61488KB, aggrb=3067KB/s, minb=3067KB/s, maxb=3067KB/s, mint=20043msec, maxt=20043msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [3976KB/4044KB/0KB /s] [994/1011/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=7233: Thu Jun 16 17:15:12 2016
  read : io=65308KB, bw=3261.4KB/s, iops=815, runt= 20025msec
    slat (usec): min=7, max=460, avg=25.59, stdev=10.59
    clat (usec): min=177, max=516612, avg=3649.75, stdev=23858.76
     lat (usec): min=334, max=516639, avg=3675.93, stdev=23858.93
    clat percentiles (usec):
     |  1.00th=[  470],  5.00th=[  516], 10.00th=[  540], 20.00th=[  572],
     | 30.00th=[  596], 40.00th=[  628], 50.00th=[  668], 60.00th=[  708],
     | 70.00th=[  772], 80.00th=[ 1048], 90.00th=[ 3824], 95.00th=[ 7776],
     | 99.00th=[38656], 99.50th=[201728], 99.90th=[370688], 99.95th=[387072],
     | 99.99th=[460800]
    bw (KB  /s): min= 1640, max= 4768, per=99.43%, avg=3242.49, stdev=764.06
  write: io=65536KB, bw=3272.8KB/s, iops=818, runt= 20025msec
    slat (usec): min=8, max=26860, avg=41.85, stdev=321.84
    clat (msec): min=3, max=400, avg=15.84, stdev=15.92
     lat (msec): min=3, max=400, avg=15.88, stdev=15.93
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    6], 10.00th=[    6], 20.00th=[    7],
     | 30.00th=[    8], 40.00th=[   10], 50.00th=[   12], 60.00th=[   17],
     | 70.00th=[   20], 80.00th=[   23], 90.00th=[   28], 95.00th=[   32],
     | 99.00th=[   57], 99.50th=[  111], 99.90th=[  215], 99.95th=[  239],
     | 99.99th=[  351]
    bw (KB  /s): min= 1648, max= 4256, per=99.62%, avg=3259.72, stdev=769.05
    lat (usec) : 250=0.01%, 500=1.37%, 750=32.28%, 1000=5.72%
    lat (msec) : 2=3.71%, 4=2.06%, 10=23.67%, 20=16.27%, 50=13.86%
    lat (msec) : 100=0.42%, 250=0.42%, 500=0.21%, 750=0.01%
  cpu          : usr=0.74%, sys=3.73%, ctx=54312, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=16327/w=16384/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=65308KB, aggrb=3261KB/s, minb=3261KB/s, maxb=3261KB/s, mint=20025msec, maxt=20025msec
  WRITE: io=65536KB, aggrb=3272KB/s, minb=3272KB/s, maxb=3272KB/s, mint=20025msec, maxt=20025msec
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [2336KB/2608KB/0KB /s] [584/652/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=8140: Thu Jun 16 17:15:42 2016
  read : io=63540KB, bw=3172.6KB/s, iops=793, runt= 20028msec
    slat (usec): min=7, max=418, avg=25.72, stdev= 7.43
    clat (usec): min=315, max=536491, avg=3554.01, stdev=22570.45
     lat (usec): min=370, max=536508, avg=3580.32, stdev=22570.33
    clat percentiles (usec):
     |  1.00th=[  466],  5.00th=[  516], 10.00th=[  540], 20.00th=[  572],
     | 30.00th=[  596], 40.00th=[  628], 50.00th=[  668], 60.00th=[  708],
     | 70.00th=[  772], 80.00th=[ 1032], 90.00th=[ 3856], 95.00th=[ 8032],
     | 99.00th=[40704], 99.50th=[168960], 99.90th=[358400], 99.95th=[407552],
     | 99.99th=[452608]
    bw (KB  /s): min= 1940, max= 4328, per=100.00%, avg=3190.77, stdev=732.42
  write: io=63924KB, bw=3191.8KB/s, iops=797, runt= 20028msec
    slat (usec): min=8, max=26292, avg=41.11, stdev=270.23
    clat (msec): min=3, max=361, avg=16.44, stdev=18.85
     lat (msec): min=3, max=361, avg=16.48, stdev=18.85
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    6], 10.00th=[    6], 20.00th=[    8],
     | 30.00th=[    8], 40.00th=[   10], 50.00th=[   12], 60.00th=[   17],
     | 70.00th=[   20], 80.00th=[   23], 90.00th=[   28], 95.00th=[   33],
     | 99.00th=[   79], 99.50th=[  159], 99.90th=[  281], 99.95th=[  297],
     | 99.99th=[  359]
    bw (KB  /s): min= 2027, max= 4112, per=100.00%, avg=3206.44, stdev=728.83
    lat (usec) : 500=1.42%, 750=32.26%, 1000=5.89%
    lat (msec) : 2=3.53%, 4=1.96%, 10=23.29%, 20=16.80%, 50=13.41%
    lat (msec) : 100=0.70%, 250=0.50%, 500=0.24%, 750=0.01%
  cpu          : usr=0.82%, sys=3.58%, ctx=53195, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=15885/w=15981/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=63540KB, aggrb=3172KB/s, minb=3172KB/s, maxb=3172KB/s, mint=20028msec, maxt=20028msec
  WRITE: io=63924KB, aggrb=3191KB/s, minb=3191KB/s, maxb=3191KB/s, mint=20028msec, maxt=20028msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [2608KB/2872KB/0KB /s] [652/718/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=9642: Thu Jun 16 17:16:28 2016
  read : io=63556KB, bw=3173.9KB/s, iops=793, runt= 20025msec
    slat (usec): min=7, max=20914, avg=26.67, stdev=165.89
    clat (usec): min=97, max=465714, avg=3614.97, stdev=21970.79
     lat (usec): min=378, max=465734, avg=3642.23, stdev=21971.00
    clat percentiles (usec):
     |  1.00th=[  470],  5.00th=[  516], 10.00th=[  540], 20.00th=[  572],
     | 30.00th=[  604], 40.00th=[  636], 50.00th=[  668], 60.00th=[  708],
     | 70.00th=[  780], 80.00th=[ 1064], 90.00th=[ 4192], 95.00th=[ 8512],
     | 99.00th=[47872], 99.50th=[171008], 99.90th=[358400], 99.95th=[391168],
     | 99.99th=[444416]
    bw (KB  /s): min= 1896, max= 4072, per=99.79%, avg=3166.46, stdev=651.64
  write: io=63944KB, bw=3193.3KB/s, iops=798, runt= 20025msec
    slat (usec): min=8, max=20437, avg=39.05, stdev=213.18
    clat (msec): min=3, max=327, avg=16.37, stdev=16.43
     lat (msec): min=3, max=327, avg=16.41, stdev=16.43
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    6], 10.00th=[    6], 20.00th=[    7],
     | 30.00th=[    8], 40.00th=[   10], 50.00th=[   12], 60.00th=[   17],
     | 70.00th=[   20], 80.00th=[   24], 90.00th=[   28], 95.00th=[   34],
     | 99.00th=[   85], 99.50th=[  116], 99.90th=[  212], 99.95th=[  227],
     | 99.99th=[  273]
    bw (KB  /s): min= 2008, max= 4112, per=99.57%, avg=3179.31, stdev=616.90
    lat (usec) : 100=0.01%, 500=1.50%, 750=31.72%, 1000=6.00%
    lat (msec) : 2=3.56%, 4=2.03%, 10=23.71%, 20=15.92%, 50=14.04%
    lat (msec) : 100=0.82%, 250=0.54%, 500=0.17%
  cpu          : usr=0.66%, sys=3.72%, ctx=52258, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=15889/w=15986/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=63556KB, aggrb=3173KB/s, minb=3173KB/s, maxb=3173KB/s, mint=20025msec, maxt=20025msec
  WRITE: io=63944KB, aggrb=3193KB/s, minb=3193KB/s, maxb=3193KB/s, mint=20025msec, maxt=20025msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [2420KB/2484KB/0KB /s] [605/621/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=22625: Thu Jun 16 17:23:31 2016
  read : io=61596KB, bw=3071.3KB/s, iops=767, runt= 20056msec
    slat (usec): min=7, max=449, avg=25.34, stdev= 8.52
    clat (usec): min=190, max=577703, avg=3869.75, stdev=25252.27
     lat (usec): min=342, max=577728, avg=3895.67, stdev=25252.13
    clat percentiles (usec):
     |  1.00th=[  474],  5.00th=[  524], 10.00th=[  548], 20.00th=[  580],
     | 30.00th=[  612], 40.00th=[  644], 50.00th=[  676], 60.00th=[  724],
     | 70.00th=[  788], 80.00th=[ 1048], 90.00th=[ 4048], 95.00th=[ 8768],
     | 99.00th=[38144], 99.50th=[199680], 99.90th=[395264], 99.95th=[444416],
     | 99.99th=[509952]
    bw (KB  /s): min= 1668, max= 4344, per=100.00%, avg=3073.05, stdev=779.57
  write: io=61792KB, bw=3080.1KB/s, iops=770, runt= 20056msec
    slat (usec): min=8, max=50692, avg=44.15, stdev=521.41
    clat (msec): min=3, max=410, avg=16.84, stdev=19.37
     lat (msec): min=3, max=410, avg=16.88, stdev=19.37
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    6], 10.00th=[    6], 20.00th=[    7],
     | 30.00th=[    8], 40.00th=[   10], 50.00th=[   12], 60.00th=[   17],
     | 70.00th=[   20], 80.00th=[   24], 90.00th=[   28], 95.00th=[   35],
     | 99.00th=[  100], 99.50th=[  149], 99.90th=[  237], 99.95th=[  265],
     | 99.99th=[  400]
    bw (KB  /s): min= 1536, max= 4000, per=100.00%, avg=3080.93, stdev=784.54
    lat (usec) : 250=0.01%, 500=1.24%, 750=31.27%, 1000=6.96%
    lat (msec) : 2=3.60%, 4=1.88%, 10=23.42%, 20=16.25%, 50=13.65%
    lat (msec) : 100=0.85%, 250=0.64%, 500=0.23%, 750=0.01%
  cpu          : usr=0.76%, sys=3.49%, ctx=50549, majf=0, minf=34
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=15399/w=15448/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=61596KB, aggrb=3071KB/s, minb=3071KB/s, maxb=3071KB/s, mint=20056msec, maxt=20056msec
  WRITE: io=61792KB, aggrb=3080KB/s, minb=3080KB/s, maxb=3080KB/s, mint=20056msec, maxt=20056msec
```

# Throughput Write
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/49152KB/0KB /s] [0/12/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=13914: Thu Jun 16 20:11:09 2016
  write: io=5120.0MB, bw=114122KB/s, iops=27, runt= 45941msec
    slat (usec): min=643, max=540222, avg=3108.88, stdev=22935.21
    clat (msec): min=117, max=2459, avg=570.57, stdev=456.86
     lat (msec): min=121, max=2460, avg=573.68, stdev=456.10
    clat percentiles (msec):
     |  1.00th=[  137],  5.00th=[  169], 10.00th=[  190], 20.00th=[  225],
     | 30.00th=[  255], 40.00th=[  306], 50.00th=[  388], 60.00th=[  469],
     | 70.00th=[  635], 80.00th=[  938], 90.00th=[ 1270], 95.00th=[ 1565],
     | 99.00th=[ 1958], 99.50th=[ 2114], 99.90th=[ 2343], 99.95th=[ 2474],
     | 99.99th=[ 2474]
    bw (KB  /s): min= 7585, max=208000, per=99.44%, avg=113487.40, stdev=25298.71
    lat (msec) : 250=29.22%, 500=33.59%, 750=11.80%, 1000=7.11%, 2000=17.66%
    lat (msec) : >=2000=0.62%
  cpu          : usr=1.30%, sys=1.99%, ctx=2276, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1280/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=5120.0MB, aggrb=114122KB/s, minb=114122KB/s, maxb=114122KB/s, mint=45941msec, maxt=45941msec

Disk stats (read/write):
  rbd1: ios=0/10254, merge=0/103, ticks=0/4904980, in_queue=4912876, util=99.75%
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/108.0MB/0KB /s] [0/27/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=17757: Thu Jun 16 20:13:16 2016
  write: io=5120.0MB, bw=114271KB/s, iops=27, runt= 45881msec
    slat (usec): min=618, max=508101, avg=3384.58, stdev=24593.16
    clat (msec): min=101, max=2308, avg=569.72, stdev=456.24
     lat (msec): min=102, max=2309, avg=573.11, stdev=455.81
    clat percentiles (msec):
     |  1.00th=[  143],  5.00th=[  174], 10.00th=[  194], 20.00th=[  227],
     | 30.00th=[  258], 40.00th=[  310], 50.00th=[  379], 60.00th=[  461],
     | 70.00th=[  619], 80.00th=[  947], 90.00th=[ 1287], 95.00th=[ 1598],
     | 99.00th=[ 1958], 99.50th=[ 2040], 99.90th=[ 2311], 99.95th=[ 2311],
     | 99.99th=[ 2311]
    bw (KB  /s): min=33758, max=194661, per=100.00%, avg=114333.75, stdev=20778.57
    lat (msec) : 250=28.05%, 500=35.23%, 750=11.80%, 1000=6.41%, 2000=17.81%
    lat (msec) : >=2000=0.70%
  cpu          : usr=1.22%, sys=2.05%, ctx=2267, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1280/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=5120.0MB, aggrb=114271KB/s, minb=114271KB/s, maxb=114271KB/s, mint=45881msec, maxt=45881msec

Disk stats (read/write):
  rbd1: ios=0/10212, merge=0/9, ticks=0/4889332, in_queue=4912864, util=99.74%
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/49152KB/0KB /s] [0/12/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=19458: Thu Jun 16 20:14:15 2016
  write: io=5120.0MB, bw=114152KB/s, iops=27, runt= 45929msec
    slat (usec): min=638, max=492419, avg=2932.82, stdev=22066.43
    clat (msec): min=109, max=2366, avg=570.57, stdev=458.62
     lat (msec): min=110, max=2367, avg=573.51, stdev=458.02
    clat percentiles (msec):
     |  1.00th=[  141],  5.00th=[  169], 10.00th=[  192], 20.00th=[  223],
     | 30.00th=[  253], 40.00th=[  302], 50.00th=[  379], 60.00th=[  478],
     | 70.00th=[  619], 80.00th=[  955], 90.00th=[ 1319], 95.00th=[ 1582],
     | 99.00th=[ 1975], 99.50th=[ 2114], 99.90th=[ 2343], 99.95th=[ 2376],
     | 99.99th=[ 2376]
    bw (KB  /s): min=41051, max=188039, per=100.00%, avg=114652.76, stdev=22571.28
    lat (msec) : 250=29.06%, 500=32.97%, 750=12.11%, 1000=7.34%, 2000=17.73%
    lat (msec) : >=2000=0.78%
  cpu          : usr=1.18%, sys=2.07%, ctx=2189, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1280/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=5120.0MB, aggrb=114151KB/s, minb=114151KB/s, maxb=114151KB/s, mint=45929msec, maxt=45929msec

Disk stats (read/write):
  rbd1: ios=0/10247, merge=0/8, ticks=0/4905192, in_queue=4913384, util=99.75%
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/49152KB/0KB /s] [0/12/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=21012: Thu Jun 16 20:15:09 2016
  write: io=5120.0MB, bw=114184KB/s, iops=27, runt= 45916msec
    slat (usec): min=623, max=473983, avg=3056.24, stdev=22886.33
    clat (msec): min=121, max=2367, avg=570.29, stdev=455.01
     lat (msec): min=125, max=2368, avg=573.34, stdev=454.44
    clat percentiles (msec):
     |  1.00th=[  143],  5.00th=[  172], 10.00th=[  194], 20.00th=[  225],
     | 30.00th=[  253], 40.00th=[  306], 50.00th=[  388], 60.00th=[  465],
     | 70.00th=[  635], 80.00th=[  930], 90.00th=[ 1303], 95.00th=[ 1582],
     | 99.00th=[ 1909], 99.50th=[ 2073], 99.90th=[ 2343], 99.95th=[ 2376],
     | 99.99th=[ 2376]
    bw (KB  /s): min=22140, max=196215, per=99.85%, avg=114008.46, stdev=23880.79
    lat (msec) : 250=28.28%, 500=34.06%, 750=11.88%, 1000=7.66%, 2000=17.34%
    lat (msec) : >=2000=0.78%
  cpu          : usr=1.15%, sys=2.12%, ctx=2161, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1280/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=5120.0MB, aggrb=114184KB/s, minb=114184KB/s, maxb=114184KB/s, mint=45916msec, maxt=45916msec

Disk stats (read/write):
  rbd1: ios=0/10251, merge=0/9, ticks=0/4909700, in_queue=4916020, util=99.76%
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/73728KB/0KB /s] [0/18/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=22608: Thu Jun 16 20:16:04 2016
  write: io=5120.0MB, bw=113798KB/s, iops=27, runt= 46072msec
    slat (usec): min=622, max=536238, avg=3244.46, stdev=24206.04
    clat (msec): min=119, max=2440, avg=572.01, stdev=462.08
     lat (msec): min=120, max=2441, avg=575.25, stdev=461.55
    clat percentiles (msec):
     |  1.00th=[  141],  5.00th=[  167], 10.00th=[  192], 20.00th=[  223],
     | 30.00th=[  249], 40.00th=[  297], 50.00th=[  383], 60.00th=[  482],
     | 70.00th=[  635], 80.00th=[  922], 90.00th=[ 1287], 95.00th=[ 1598],
     | 99.00th=[ 1991], 99.50th=[ 2180], 99.90th=[ 2376], 99.95th=[ 2442],
     | 99.99th=[ 2442]
    bw (KB  /s): min=22021, max=192000, per=99.42%, avg=113136.36, stdev=22068.57
    lat (msec) : 250=30.55%, 500=30.94%, 750=13.67%, 1000=6.80%, 2000=17.19%
    lat (msec) : >=2000=0.86%
  cpu          : usr=1.26%, sys=2.02%, ctx=2168, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1280/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=5120.0MB, aggrb=113797KB/s, minb=113797KB/s, maxb=113797KB/s, mint=46072msec, maxt=46072msec

Disk stats (read/write):
  rbd1: ios=0/10228, merge=0/9, ticks=0/4889164, in_queue=4924524, util=99.75%
```

# Throughput Read
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [R(1)] [100.0% done] [112.0MB/0KB/0KB /s] [28/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=27232: Thu Jun 16 20:18:42 2016
  read : io=5120.0MB, bw=114797KB/s, iops=28, runt= 45671msec
    slat (usec): min=400, max=5130, avg=765.89, stdev=359.97
    clat (msec): min=61, max=2430, avg=569.46, stdev=490.83
     lat (msec): min=63, max=2431, avg=570.23, stdev=490.83
    clat percentiles (msec):
     |  1.00th=[  103],  5.00th=[  135], 10.00th=[  153], 20.00th=[  190],
     | 30.00th=[  225], 40.00th=[  281], 50.00th=[  355], 60.00th=[  474],
     | 70.00th=[  635], 80.00th=[ 1004], 90.00th=[ 1401], 95.00th=[ 1631],
     | 99.00th=[ 1942], 99.50th=[ 2040], 99.90th=[ 2245], 99.95th=[ 2442],
     | 99.99th=[ 2442]
    bw (KB  /s): min=22180, max=129427, per=99.09%, avg=113754.07, stdev=12529.70
    lat (msec) : 100=0.86%, 250=34.22%, 500=26.48%, 750=12.89%, 1000=5.47%
    lat (msec) : 2000=19.30%, >=2000=0.78%
  cpu          : usr=0.04%, sys=1.97%, ctx=8668, majf=0, minf=574
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=114796KB/s, minb=114796KB/s, maxb=114796KB/s, mint=45671msec, maxt=45671msec

Disk stats (read/write):
  rbd1: ios=10201/4, merge=0/1, ticks=4941540/1980, in_queue=4966768, util=99.86%
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [108.0MB/0KB/0KB /s] [27/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=1938: Thu Jun 16 20:22:41 2016
  read : io=5120.0MB, bw=114799KB/s, iops=28, runt= 45670msec
    slat (usec): min=418, max=3682, avg=751.73, stdev=257.15
    clat (msec): min=46, max=2634, avg=569.49, stdev=513.37
     lat (msec): min=49, max=2635, avg=570.25, stdev=513.36
    clat percentiles (msec):
     |  1.00th=[   94],  5.00th=[  126], 10.00th=[  147], 20.00th=[  184],
     | 30.00th=[  217], 40.00th=[  265], 50.00th=[  330], 60.00th=[  437],
     | 70.00th=[  652], 80.00th=[ 1037], 90.00th=[ 1418], 95.00th=[ 1663],
     | 99.00th=[ 2040], 99.50th=[ 2245], 99.90th=[ 2507], 99.95th=[ 2638],
     | 99.99th=[ 2638]
    bw (KB  /s): min=43245, max=139636, per=99.23%, avg=113913.88, stdev=12140.35
    lat (msec) : 50=0.08%, 100=1.41%, 250=36.25%, 500=25.70%, 750=10.08%
    lat (msec) : 1000=5.55%, 2000=19.84%, >=2000=1.09%
  cpu          : usr=0.12%, sys=1.90%, ctx=7996, majf=0, minf=575
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=114799KB/s, minb=114799KB/s, maxb=114799KB/s, mint=45670msec, maxt=45670msec

Disk stats (read/write):
  rbd1: ios=10188/0, merge=0/0, ticks=4932680/0, in_queue=4974048, util=99.87%
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [108.0MB/0KB/0KB /s] [27/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=3799: Thu Jun 16 20:23:46 2016
  read : io=5120.0MB, bw=114774KB/s, iops=28, runt= 45680msec
    slat (usec): min=421, max=4877, avg=777.57, stdev=314.92
    clat (msec): min=67, max=2453, avg=569.61, stdev=493.70
     lat (msec): min=67, max=2454, avg=570.39, stdev=493.70
    clat percentiles (msec):
     |  1.00th=[   95],  5.00th=[  133], 10.00th=[  153], 20.00th=[  184],
     | 30.00th=[  221], 40.00th=[  265], 50.00th=[  351], 60.00th=[  486],
     | 70.00th=[  660], 80.00th=[  996], 90.00th=[ 1418], 95.00th=[ 1598],
     | 99.00th=[ 2024], 99.50th=[ 2147], 99.90th=[ 2343], 99.95th=[ 2442],
     | 99.99th=[ 2442]
    bw (KB  /s): min=59963, max=138158, per=99.45%, avg=114148.44, stdev=11000.62
    lat (msec) : 100=1.09%, 250=35.62%, 500=24.38%, 750=12.97%, 1000=6.09%
    lat (msec) : 2000=18.75%, >=2000=1.09%
  cpu          : usr=0.05%, sys=2.00%, ctx=8755, majf=0, minf=575
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=114774KB/s, minb=114774KB/s, maxb=114774KB/s, mint=45680msec, maxt=45680msec

Disk stats (read/write):
  rbd1: ios=10185/0, merge=0/0, ticks=4941892/0, in_queue=4979440, util=99.86%
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [104.0MB/0KB/0KB /s] [26/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=5800: Thu Jun 16 20:24:54 2016
  read : io=5120.0MB, bw=114787KB/s, iops=28, runt= 45675msec
    slat (usec): min=434, max=2921, avg=725.69, stdev=216.87
    clat (msec): min=66, max=2322, avg=569.60, stdev=487.19
     lat (msec): min=66, max=2323, avg=570.32, stdev=487.18
    clat percentiles (msec):
     |  1.00th=[   99],  5.00th=[  137], 10.00th=[  157], 20.00th=[  186],
     | 30.00th=[  225], 40.00th=[  273], 50.00th=[  351], 60.00th=[  478],
     | 70.00th=[  660], 80.00th=[  979], 90.00th=[ 1401], 95.00th=[ 1598],
     | 99.00th=[ 1942], 99.50th=[ 2057], 99.90th=[ 2147], 99.95th=[ 2311],
     | 99.99th=[ 2311]
    bw (KB  /s): min=38520, max=145996, per=99.41%, avg=114112.53, stdev=13555.27
    lat (msec) : 100=1.02%, 250=34.77%, 500=25.47%, 750=12.27%, 1000=7.03%
    lat (msec) : 2000=18.75%, >=2000=0.70%
  cpu          : usr=0.09%, sys=1.87%, ctx=8121, majf=0, minf=575
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=114786KB/s, minb=114786KB/s, maxb=114786KB/s, mint=45675msec, maxt=45675msec

Disk stats (read/write):
  rbd1: ios=10186/0, merge=0/0, ticks=4939096/0, in_queue=4970240, util=99.87%
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [104.0MB/0KB/0KB /s] [26/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=9497: Thu Jun 16 20:27:00 2016
  read : io=5120.0MB, bw=114804KB/s, iops=28, runt= 45668msec
    slat (usec): min=419, max=6664, avg=743.37, stdev=299.41
    clat (msec): min=91, max=2461, avg=569.49, stdev=406.94
     lat (msec): min=93, max=2461, avg=570.23, stdev=406.94
    clat percentiles (msec):
     |  1.00th=[  128],  5.00th=[  161], 10.00th=[  192], 20.00th=[  229],
     | 30.00th=[  277], 40.00th=[  351], 50.00th=[  441], 60.00th=[  545],
     | 70.00th=[  701], 80.00th=[  857], 90.00th=[ 1156], 95.00th=[ 1385],
     | 99.00th=[ 1926], 99.50th=[ 2114], 99.90th=[ 2343], 99.95th=[ 2474],
     | 99.99th=[ 2474]
    bw (KB  /s): min=62217, max=138986, per=99.32%, avg=114017.88, stdev=10496.12
    lat (msec) : 100=0.23%, 250=24.92%, 500=30.55%, 750=18.28%, 1000=11.25%
    lat (msec) : 2000=13.98%, >=2000=0.78%
  cpu          : usr=0.03%, sys=1.95%, ctx=8135, majf=0, minf=575
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=114804KB/s, minb=114804KB/s, maxb=114804KB/s, mint=45668msec, maxt=45668msec

Disk stats (read/write):
  rbd1: ios=10187/0, merge=0/0, ticks=4869512/0, in_queue=4899396, util=99.86%
```
