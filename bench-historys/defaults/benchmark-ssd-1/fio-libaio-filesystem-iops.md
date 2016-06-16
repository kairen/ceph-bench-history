# rados file system using fio-libaio

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

### WRITE
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/364KB/0KB /s] [0/91/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=30521: Thu Jun 16 19:09:00 2016
  write: io=10436KB, bw=534109B/s, iops=130, runt= 20008msec
    slat (msec): min=3, max=334, avg= 7.66, stdev= 8.72
    clat (usec): min=4, max=429144, avg=113602.62, stdev=43132.68
     lat (msec): min=10, max=436, avg=121.27, stdev=45.40
    clat percentiles (msec):
     |  1.00th=[   90],  5.00th=[   91], 10.00th=[   92], 20.00th=[   93],
     | 30.00th=[   93], 40.00th=[   94], 50.00th=[   95], 60.00th=[   95],
     | 70.00th=[   97], 80.00th=[  163], 90.00th=[  165], 95.00th=[  172],
     | 99.00th=[  302], 99.50th=[  424], 99.90th=[  429], 99.95th=[  429],
     | 99.99th=[  429]
    bw (KB  /s): min=  216, max=  652, per=100.00%, avg=521.33, stdev=149.05
    lat (usec) : 10=0.04%
    lat (msec) : 20=0.04%, 50=0.11%, 100=73.32%, 250=25.34%, 500=1.15%
  cpu          : usr=0.10%, sys=0.27%, ctx=2611, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.3%, 16=99.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2609/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=10436KB, aggrb=521KB/s, minb=521KB/s, maxb=521KB/s, mint=20008msec, maxt=20008msec
```
------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/360KB/0KB /s] [0/90/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=483: Thu Jun 16 19:10:20 2016
  write: io=10488KB, bw=536717B/s, iops=131, runt= 20010msec
    slat (msec): min=3, max=330, avg= 7.63, stdev= 8.75
    clat (usec): min=5, max=424725, avg=113044.52, stdev=43537.91
     lat (msec): min=12, max=432, avg=120.67, stdev=45.84
    clat percentiles (msec):
     |  1.00th=[   89],  5.00th=[   90], 10.00th=[   91], 20.00th=[   92],
     | 30.00th=[   92], 40.00th=[   93], 50.00th=[   94], 60.00th=[   95],
     | 70.00th=[   96], 80.00th=[  163], 90.00th=[  165], 95.00th=[  186],
     | 99.00th=[  310], 99.50th=[  416], 99.90th=[  424], 99.95th=[  424],
     | 99.99th=[  424]
    bw (KB  /s): min=  230, max=  658, per=100.00%, avg=524.44, stdev=153.94
    lat (usec) : 10=0.04%
    lat (msec) : 20=0.04%, 50=0.11%, 100=73.23%, 250=25.44%, 500=1.14%
  cpu          : usr=0.12%, sys=0.26%, ctx=2623, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.3%, 16=99.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2622/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=10488KB, aggrb=524KB/s, minb=524KB/s, maxb=524KB/s, mint=20010msec, maxt=20010msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/364KB/0KB /s] [0/91/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=1295: Thu Jun 16 19:10:45 2016
  write: io=10156KB, bw=519857B/s, iops=126, runt= 20005msec
    slat (msec): min=3, max=834, avg= 7.87, stdev=18.64
    clat (usec): min=5, max=924893, avg=116648.91, stdev=75331.28
     lat (msec): min=10, max=932, avg=124.52, stdev=78.18
    clat percentiles (msec):
     |  1.00th=[   89],  5.00th=[   90], 10.00th=[   91], 20.00th=[   92],
     | 30.00th=[   93], 40.00th=[   93], 50.00th=[   94], 60.00th=[   95],
     | 70.00th=[   96], 80.00th=[  163], 90.00th=[  165], 95.00th=[  190],
     | 99.00th=[  416], 99.50th=[  922], 99.90th=[  922], 99.95th=[  922],
     | 99.99th=[  922]
    bw (KB  /s): min=  229, max=  654, per=100.00%, avg=517.21, stdev=154.61
    lat (usec) : 10=0.04%
    lat (msec) : 20=0.04%, 50=0.12%, 100=75.07%, 250=22.96%, 500=1.18%
    lat (msec) : 1000=0.59%
  cpu          : usr=0.09%, sys=0.28%, ctx=2540, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.3%, 16=99.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2539/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=10156KB, aggrb=507KB/s, minb=507KB/s, maxb=507KB/s, mint=20005msec, maxt=20005msec
```
------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/348KB/0KB /s] [0/87/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=2226: Thu Jun 16 19:11:15 2016
  write: io=10188KB, bw=521547B/s, iops=127, runt= 20003msec
    slat (msec): min=3, max=851, avg= 7.85, stdev=19.13
    clat (usec): min=4, max=943693, avg=116266.48, stdev=77742.05
     lat (msec): min=10, max=950, avg=124.11, stdev=80.71
    clat percentiles (msec):
     |  1.00th=[   88],  5.00th=[   89], 10.00th=[   90], 20.00th=[   91],
     | 30.00th=[   92], 40.00th=[   92], 50.00th=[   93], 60.00th=[   94],
     | 70.00th=[   95], 80.00th=[  163], 90.00th=[  172], 95.00th=[  182],
     | 99.00th=[  441], 99.50th=[  938], 99.90th=[  947], 99.95th=[  947],
     | 99.99th=[  947]
    bw (KB  /s): min=   71, max=  669, per=100.00%, avg=519.39, stdev=171.24
    lat (usec) : 10=0.04%
    lat (msec) : 20=0.04%, 50=0.12%, 100=75.42%, 250=22.61%, 500=1.18%
    lat (msec) : 1000=0.59%
  cpu          : usr=0.06%, sys=0.31%, ctx=2548, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.3%, 16=99.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2547/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=10188KB, aggrb=509KB/s, minb=509KB/s, maxb=509KB/s, mint=20003msec, maxt=20003msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/364KB/0KB /s] [0/91/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=3235: Thu Jun 16 19:11:48 2016
  write: io=9992.0KB, bw=511436B/s, iops=124, runt= 20006msec
    slat (msec): min=3, max=885, avg= 8.00, stdev=20.68
    clat (usec): min=5, max=981845, avg=116083.87, stdev=69062.03
     lat (msec): min=10, max=1198, avg=124.09, stdev=73.74
    clat percentiles (msec):
     |  1.00th=[   89],  5.00th=[   91], 10.00th=[   91], 20.00th=[   93],
     | 30.00th=[   93], 40.00th=[   94], 50.00th=[   95], 60.00th=[   96],
     | 70.00th=[   97], 80.00th=[  121], 90.00th=[  165], 95.00th=[  194],
     | 99.00th=[  420], 99.50th=[  441], 99.90th=[  979], 99.95th=[  979],
     | 99.99th=[  979]
    bw (KB  /s): min=    3, max=  660, per=100.00%, avg=519.86, stdev=168.38
    lat (usec) : 10=0.04%
    lat (msec) : 20=0.04%, 50=0.12%, 100=75.34%, 250=22.34%, 500=1.80%
    lat (msec) : 1000=0.32%
  cpu          : usr=0.14%, sys=0.22%, ctx=2500, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.3%, 16=99.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2498/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=9992KB, aggrb=499KB/s, minb=499KB/s, maxb=499KB/s, mint=20006msec, maxt=20006msec
```

### READ
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [R(1)] [100.0% done] [7676KB/0KB/0KB /s] [1919/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=6302: Thu Jun 16 19:13:32 2016
  read : io=147636KB, bw=7381.5KB/s, iops=1845, runt= 20001msec
    slat (usec): min=369, max=8957, avg=536.93, stdev=141.33
    clat (usec): min=3, max=17418, avg=8127.25, stdev=1139.02
     lat (usec): min=455, max=17968, avg=8665.32, stdev=1204.83
    clat percentiles (usec):
     |  1.00th=[ 6752],  5.00th=[ 6880], 10.00th=[ 7008], 20.00th=[ 7072],
     | 30.00th=[ 7200], 40.00th=[ 7392], 50.00th=[ 8032], 60.00th=[ 8512],
     | 70.00th=[ 8768], 80.00th=[ 9024], 90.00th=[ 9408], 95.00th=[ 9792],
     | 99.00th=[11456], 99.50th=[12864], 99.90th=[15680], 99.95th=[16512],
     | 99.99th=[17280]
    bw (KB  /s): min= 5976, max= 8568, per=100.00%, avg=7399.36, stdev=730.30
    lat (usec) : 4=0.01%, 500=0.01%, 1000=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=95.71%, 20=4.27%
  cpu          : usr=1.05%, sys=2.81%, ctx=66679, majf=0, minf=44
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=36909/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=147636KB, aggrb=7381KB/s, minb=7381KB/s, maxb=7381KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [6740KB/0KB/0KB /s] [1685/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=9791: Thu Jun 16 19:15:23 2016
  read : io=146412KB, bw=7320.3KB/s, iops=1830, runt= 20001msec
    slat (usec): min=419, max=8987, avg=541.51, stdev=129.35
    clat (usec): min=4, max=18074, avg=8194.55, stdev=1135.46
     lat (usec): min=577, max=18644, avg=8737.18, stdev=1203.31
    clat percentiles (usec):
     |  1.00th=[ 6880],  5.00th=[ 7008], 10.00th=[ 7072], 20.00th=[ 7264],
     | 30.00th=[ 7328], 40.00th=[ 7392], 50.00th=[ 7904], 60.00th=[ 8384],
     | 70.00th=[ 8896], 80.00th=[ 9024], 90.00th=[ 9536], 95.00th=[10304],
     | 99.00th=[11328], 99.50th=[11712], 99.90th=[15424], 99.95th=[17792],
     | 99.99th=[18048]
    bw (KB  /s): min= 5640, max= 8424, per=100.00%, avg=7338.26, stdev=760.74
    lat (usec) : 10=0.01%, 750=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=92.96%, 20=7.02%
  cpu          : usr=0.74%, sys=3.02%, ctx=65347, majf=0, minf=45
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=36603/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=146412KB, aggrb=7320KB/s, minb=7320KB/s, maxb=7320KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [7036KB/0KB/0KB /s] [1759/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=11163: Thu Jun 16 19:16:08 2016
  read : io=149788KB, bw=7489.3KB/s, iops=1872, runt= 20001msec
    slat (usec): min=406, max=7149, avg=529.22, stdev=125.81
    clat (usec): min=4, max=16841, avg=8010.37, stdev=1016.70
     lat (usec): min=479, max=17466, avg=8540.69, stdev=1075.65
    clat percentiles (usec):
     |  1.00th=[ 6880],  5.00th=[ 7008], 10.00th=[ 7072], 20.00th=[ 7200],
     | 30.00th=[ 7264], 40.00th=[ 7328], 50.00th=[ 7392], 60.00th=[ 8384],
     | 70.00th=[ 8768], 80.00th=[ 9024], 90.00th=[ 9152], 95.00th=[ 9536],
     | 99.00th=[10432], 99.50th=[11456], 99.90th=[14528], 99.95th=[15040],
     | 99.99th=[16768]
    bw (KB  /s): min= 6304, max= 8328, per=99.98%, avg=7487.79, stdev=666.73
    lat (usec) : 10=0.01%, 500=0.01%, 1000=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=98.29%, 20=1.69%
  cpu          : usr=1.12%, sys=2.73%, ctx=66861, majf=0, minf=46
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=37447/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=149788KB, aggrb=7489KB/s, minb=7489KB/s, maxb=7489KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [7220KB/0KB/0KB /s] [1805/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=12363: Thu Jun 16 19:16:47 2016
  read : io=151440KB, bw=7571.7KB/s, iops=1892, runt= 20001msec
    slat (usec): min=356, max=7985, avg=523.37, stdev=118.17
    clat (usec): min=4, max=15455, avg=7923.04, stdev=991.09
     lat (usec): min=497, max=15919, avg=8447.52, stdev=1049.78
    clat percentiles (usec):
     |  1.00th=[ 6816],  5.00th=[ 6944], 10.00th=[ 7008], 20.00th=[ 7072],
     | 30.00th=[ 7136], 40.00th=[ 7264], 50.00th=[ 7328], 60.00th=[ 8256],
     | 70.00th=[ 8768], 80.00th=[ 9024], 90.00th=[ 9152], 95.00th=[ 9280],
     | 99.00th=[10176], 99.50th=[11200], 99.90th=[14400], 99.95th=[15040],
     | 99.99th=[15424]
    bw (KB  /s): min= 6584, max= 8448, per=99.82%, avg=7557.54, stdev=701.23
    lat (usec) : 10=0.01%, 750=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=98.78%, 20=1.19%
  cpu          : usr=0.80%, sys=3.10%, ctx=67442, majf=0, minf=45
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=37860/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=151440KB, aggrb=7571KB/s, minb=7571KB/s, maxb=7571KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [6496KB/0KB/0KB /s] [1624/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=14305: Thu Jun 16 19:17:50 2016
  read : io=148912KB, bw=7445.3KB/s, iops=1861, runt= 20001msec
    slat (usec): min=391, max=11118, avg=532.34, stdev=127.48
    clat (usec): min=5, max=18746, avg=8057.15, stdev=1074.79
     lat (usec): min=480, max=19237, avg=8590.58, stdev=1138.34
    clat percentiles (usec):
     |  1.00th=[ 6880],  5.00th=[ 7008], 10.00th=[ 7072], 20.00th=[ 7136],
     | 30.00th=[ 7200], 40.00th=[ 7264], 50.00th=[ 7392], 60.00th=[ 8512],
     | 70.00th=[ 8896], 80.00th=[ 9024], 90.00th=[ 9280], 95.00th=[ 9792],
     | 99.00th=[10432], 99.50th=[11456], 99.90th=[14912], 99.95th=[15168],
     | 99.99th=[18816]
    bw (KB  /s): min= 6408, max= 8432, per=100.00%, avg=7460.56, stdev=709.17
    lat (usec) : 10=0.01%, 500=0.01%, 1000=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=97.88%, 20=2.10%
  cpu          : usr=0.80%, sys=3.02%, ctx=67011, majf=0, minf=45
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=37228/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=148912KB, aggrb=7445KB/s, minb=7445KB/s, maxb=7445KB/s, mint=20001msec, maxt=20001msec
```

### READ-WRITE
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [M(1)] [100.0% done] [296KB/348KB/0KB /s] [74/87/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=17509: Thu Jun 16 19:19:39 2016
  read : io=6776.0KB, bw=346896B/s, iops=84, runt= 20002msec
    slat (usec): min=448, max=20020, avg=626.86, stdev=767.64
    clat (msec): min=12, max=284, avg=87.92, stdev=24.82
     lat (msec): min=13, max=285, avg=88.55, stdev=24.89
    clat percentiles (msec):
     |  1.00th=[   45],  5.00th=[   55], 10.00th=[   60], 20.00th=[   70],
     | 30.00th=[   76], 40.00th=[   82], 50.00th=[   86], 60.00th=[   92],
     | 70.00th=[   96], 80.00th=[  104], 90.00th=[  115], 95.00th=[  126],
     | 99.00th=[  163], 99.50th=[  186], 99.90th=[  281], 99.95th=[  285],
     | 99.99th=[  285]
    bw (KB  /s): min=  205, max=  502, per=99.76%, avg=337.18, stdev=66.96
  write: io=6804.0KB, bw=348329B/s, iops=85, runt= 20002msec
    slat (msec): min=8, max=190, avg=11.12, stdev= 4.66
    clat (usec): min=5, max=285608, avg=88088.41, stdev=25973.59
     lat (msec): min=12, max=295, avg=99.21, stdev=26.46
    clat percentiles (msec):
     |  1.00th=[   43],  5.00th=[   53], 10.00th=[   59], 20.00th=[   69],
     | 30.00th=[   76], 40.00th=[   82], 50.00th=[   86], 60.00th=[   92],
     | 70.00th=[   96], 80.00th=[  105], 90.00th=[  117], 95.00th=[  127],
     | 99.00th=[  163], 99.50th=[  190], 99.90th=[  277], 99.95th=[  285],
     | 99.99th=[  285]
    bw (KB  /s): min=  239, max=  401, per=99.54%, avg=338.44, stdev=39.80
    lat (usec) : 10=0.03%
    lat (msec) : 20=0.09%, 50=3.51%, 100=70.60%, 250=25.33%, 500=0.44%
  cpu          : usr=0.08%, sys=0.36%, ctx=3402, majf=0, minf=29
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1694/w=1701/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=6776KB, aggrb=338KB/s, minb=338KB/s, maxb=338KB/s, mint=20002msec, maxt=20002msec
  WRITE: io=6804KB, aggrb=340KB/s, minb=340KB/s, maxb=340KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [320KB/356KB/0KB /s] [80/89/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=18886: Thu Jun 16 19:20:24 2016
  read : io=6812.0KB, bw=348582B/s, iops=85, runt= 20011msec
    slat (usec): min=439, max=25756, avg=628.51, stdev=920.03
    clat (msec): min=11, max=297, avg=86.76, stdev=25.99
     lat (msec): min=11, max=298, avg=87.39, stdev=26.10
    clat percentiles (msec):
     |  1.00th=[   45],  5.00th=[   55], 10.00th=[   58], 20.00th=[   68],
     | 30.00th=[   76], 40.00th=[   81], 50.00th=[   86], 60.00th=[   90],
     | 70.00th=[   96], 80.00th=[  104], 90.00th=[  115], 95.00th=[  124],
     | 99.00th=[  161], 99.50th=[  198], 99.90th=[  297], 99.95th=[  297],
     | 99.99th=[  297]
    bw (KB  /s): min=  111, max=  474, per=99.37%, avg=337.87, stdev=77.56
  write: io=6832.0KB, bw=349606B/s, iops=85, runt= 20011msec
    slat (msec): min=8, max=192, avg=11.08, stdev= 6.35
    clat (usec): min=4, max=297968, avg=87218.84, stdev=26392.80
     lat (msec): min=11, max=308, avg=98.30, stdev=27.34
    clat percentiles (msec):
     |  1.00th=[   44],  5.00th=[   50], 10.00th=[   58], 20.00th=[   68],
     | 30.00th=[   76], 40.00th=[   81], 50.00th=[   86], 60.00th=[   91],
     | 70.00th=[   96], 80.00th=[  105], 90.00th=[  118], 95.00th=[  128],
     | 99.00th=[  163], 99.50th=[  186], 99.90th=[  289], 99.95th=[  297],
     | 99.99th=[  297]
    bw (KB  /s): min=  174, max=  408, per=99.69%, avg=339.95, stdev=43.60
    lat (usec) : 10=0.03%
    lat (msec) : 20=0.18%, 50=4.28%, 100=71.86%, 250=23.19%, 500=0.47%
  cpu          : usr=0.12%, sys=0.32%, ctx=3414, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1703/w=1708/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=6812KB, aggrb=340KB/s, minb=340KB/s, maxb=340KB/s, mint=20011msec, maxt=20011msec
  WRITE: io=6832KB, aggrb=341KB/s, minb=341KB/s, maxb=341KB/s, mint=20011msec, maxt=20011msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [320KB/328KB/0KB /s] [80/82/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=20191: Thu Jun 16 19:21:06 2016
  read : io=6824.0KB, bw=349336B/s, iops=85, runt= 20003msec
    slat (usec): min=450, max=18830, avg=605.77, stdev=599.23
    clat (msec): min=9, max=297, avg=86.60, stdev=25.49
     lat (msec): min=10, max=298, avg=87.21, stdev=25.54
    clat percentiles (msec):
     |  1.00th=[   42],  5.00th=[   53], 10.00th=[   59], 20.00th=[   68],
     | 30.00th=[   75], 40.00th=[   81], 50.00th=[   86], 60.00th=[   91],
     | 70.00th=[   96], 80.00th=[  103], 90.00th=[  115], 95.00th=[  123],
     | 99.00th=[  157], 99.50th=[  178], 99.90th=[  289], 99.95th=[  297],
     | 99.99th=[  297]
    bw (KB  /s): min=  112, max=  479, per=99.19%, avg=338.23, stdev=75.43
  write: io=6836.0KB, bw=349950B/s, iops=85, runt= 20003msec
    slat (msec): min=7, max=193, avg=11.09, stdev= 6.42
    clat (usec): min=10, max=289499, avg=87101.25, stdev=25550.47
     lat (msec): min=9, max=299, avg=98.19, stdev=26.43
    clat percentiles (msec):
     |  1.00th=[   42],  5.00th=[   51], 10.00th=[   58], 20.00th=[   68],
     | 30.00th=[   76], 40.00th=[   81], 50.00th=[   86], 60.00th=[   92],
     | 70.00th=[   96], 80.00th=[  105], 90.00th=[  116], 95.00th=[  125],
     | 99.00th=[  151], 99.50th=[  176], 99.90th=[  281], 99.95th=[  289],
     | 99.99th=[  289]
    bw (KB  /s): min=  184, max=  411, per=99.74%, avg=340.10, stdev=42.94
    lat (usec) : 20=0.03%
    lat (msec) : 10=0.03%, 20=0.09%, 50=4.13%, 100=70.22%, 250=25.04%
    lat (msec) : 500=0.47%
  cpu          : usr=0.08%, sys=0.36%, ctx=3416, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1706/w=1709/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=6824KB, aggrb=341KB/s, minb=341KB/s, maxb=341KB/s, mint=20003msec, maxt=20003msec
  WRITE: io=6836KB, aggrb=341KB/s, minb=341KB/s, maxb=341KB/s, mint=20003msec, maxt=20003msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [324KB/332KB/0KB /s] [81/83/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=21613: Thu Jun 16 19:21:53 2016
  read : io=6860.0KB, bw=351179B/s, iops=85, runt= 20003msec
    slat (usec): min=454, max=22223, avg=611.67, stdev=740.49
    clat (msec): min=33, max=288, avg=86.74, stdev=25.69
     lat (msec): min=34, max=289, avg=87.36, stdev=25.71
    clat percentiles (msec):
     |  1.00th=[   44],  5.00th=[   52], 10.00th=[   59], 20.00th=[   68],
     | 30.00th=[   75], 40.00th=[   81], 50.00th=[   86], 60.00th=[   91],
     | 70.00th=[   96], 80.00th=[  103], 90.00th=[  115], 95.00th=[  127],
     | 99.00th=[  165], 99.50th=[  186], 99.90th=[  281], 99.95th=[  289],
     | 99.99th=[  289]
    bw (KB  /s): min=  226, max=  520, per=99.31%, avg=339.64, stdev=70.97
  write: io=6856.0KB, bw=350974B/s, iops=85, runt= 20003msec
    slat (msec): min=8, max=192, avg=11.05, stdev= 4.77
    clat (usec): min=4, max=290673, avg=87667.24, stdev=26861.78
     lat (msec): min=12, max=300, avg=98.72, stdev=27.48
    clat percentiles (msec):
     |  1.00th=[   41],  5.00th=[   50], 10.00th=[   58], 20.00th=[   68],
     | 30.00th=[   76], 40.00th=[   81], 50.00th=[   86], 60.00th=[   91],
     | 70.00th=[   96], 80.00th=[  105], 90.00th=[  120], 95.00th=[  133],
     | 99.00th=[  163], 99.50th=[  186], 99.90th=[  281], 99.95th=[  289],
     | 99.99th=[  289]
    bw (KB  /s): min=  248, max=  386, per=99.84%, avg=341.46, stdev=30.84
    lat (usec) : 10=0.03%
    lat (msec) : 20=0.03%, 50=4.58%, 100=70.72%, 250=24.21%, 500=0.44%
  cpu          : usr=0.16%, sys=0.29%, ctx=3431, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1715/w=1714/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=6860KB, aggrb=342KB/s, minb=342KB/s, maxb=342KB/s, mint=20003msec, maxt=20003msec
  WRITE: io=6856KB, aggrb=342KB/s, minb=342KB/s, maxb=342KB/s, mint=20003msec, maxt=20003msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [316KB/364KB/0KB /s] [79/91/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=22690: Thu Jun 16 19:22:27 2016
  read : io=6800.0KB, bw=348142B/s, iops=84, runt= 20001msec
    slat (usec): min=444, max=19736, avg=631.53, stdev=887.44
    clat (usec): min=4, max=297680, avg=87019.20, stdev=22575.35
     lat (usec): min=679, max=298557, avg=87651.39, stdev=22661.39
    clat percentiles (msec):
     |  1.00th=[   45],  5.00th=[   55], 10.00th=[   59], 20.00th=[   68],
     | 30.00th=[   76], 40.00th=[   81], 50.00th=[   86], 60.00th=[   92],
     | 70.00th=[   97], 80.00th=[  105], 90.00th=[  116], 95.00th=[  126],
     | 99.00th=[  145], 99.50th=[  155], 99.90th=[  167], 99.95th=[  297],
     | 99.99th=[  297]
    bw (KB  /s): min=  112, max=  479, per=99.69%, avg=337.95, stdev=70.88
  write: io=6828.0KB, bw=349576B/s, iops=85, runt= 20001msec
    slat (msec): min=8, max=191, avg=11.08, stdev= 4.65
    clat (msec): min=1, max=157, avg=87.08, stdev=22.43
     lat (msec): min=12, max=298, avg=98.15, stdev=23.20
    clat percentiles (msec):
     |  1.00th=[   44],  5.00th=[   52], 10.00th=[   59], 20.00th=[   69],
     | 30.00th=[   76], 40.00th=[   81], 50.00th=[   86], 60.00th=[   92],
     | 70.00th=[   97], 80.00th=[  106], 90.00th=[  118], 95.00th=[  125],
     | 99.00th=[  143], 99.50th=[  147], 99.90th=[  159], 99.95th=[  159],
     | 99.99th=[  159]
    bw (KB  /s): min=  176, max=  393, per=99.63%, avg=339.74, stdev=40.03
    lat (usec) : 10=0.03%, 750=0.03%
    lat (msec) : 2=0.03%, 20=0.03%, 50=3.85%, 100=68.68%, 250=27.33%
    lat (msec) : 500=0.03%
  cpu          : usr=0.07%, sys=0.38%, ctx=3408, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1700/w=1707/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=6800KB, aggrb=339KB/s, minb=339KB/s, maxb=339KB/s, mint=20001msec, maxt=20001msec
  WRITE: io=6828KB, aggrb=341KB/s, minb=341KB/s, maxb=341KB/s, mint=20001msec, maxt=20001msec
```

### RAND-WRITE
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/468KB/0KB /s] [0/117/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=27468: Thu Jun 16 19:25:03 2016
  write: io=8856.0KB, bw=453313B/s, iops=110, runt= 20005msec
    slat (msec): min=3, max=26, avg= 9.03, stdev= 2.91
    clat (usec): min=4, max=187229, avg=134985.90, stdev=13554.50
     lat (msec): min=5, max=197, avg=144.02, stdev=13.93
    clat percentiles (msec):
     |  1.00th=[  105],  5.00th=[  118], 10.00th=[  122], 20.00th=[  126],
     | 30.00th=[  130], 40.00th=[  133], 50.00th=[  137], 60.00th=[  139],
     | 70.00th=[  141], 80.00th=[  145], 90.00th=[  149], 95.00th=[  153],
     | 99.00th=[  172], 99.50th=[  178], 99.90th=[  186], 99.95th=[  186],
     | 99.99th=[  188]
    bw (KB  /s): min=  310, max=  484, per=99.32%, avg=438.97, stdev=30.25
    lat (usec) : 10=0.05%
    lat (msec) : 10=0.05%, 20=0.05%, 50=0.18%, 100=0.36%, 250=99.32%
  cpu          : usr=0.04%, sys=0.30%, ctx=2216, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2214/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=8856KB, aggrb=442KB/s, minb=442KB/s, maxb=442KB/s, mint=20005msec, maxt=20005msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/448KB/0KB /s] [0/112/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=28896: Thu Jun 16 19:25:49 2016
  write: io=8308.0KB, bw=425327B/s, iops=103, runt= 20002msec
    slat (msec): min=4, max=213, avg= 9.62, stdev=11.55
    clat (usec): min=4, max=1128.4K, avg=137569.86, stdev=42275.41
     lat (msec): min=10, max=1319, avg=147.19, stdev=49.76
    clat percentiles (msec):
     |  1.00th=[  106],  5.00th=[  118], 10.00th=[  121], 20.00th=[  126],
     | 30.00th=[  129], 40.00th=[  133], 50.00th=[  135], 60.00th=[  137],
     | 70.00th=[  139], 80.00th=[  143], 90.00th=[  149], 95.00th=[  159],
     | 99.00th=[  326], 99.50th=[  343], 99.90th=[  750], 99.95th=[  947],
     | 99.99th=[ 1123]
    bw (KB  /s): min=    3, max=  478, per=100.00%, avg=429.11, stdev=80.69
    lat (usec) : 10=0.05%
    lat (msec) : 20=0.05%, 50=0.14%, 100=0.24%, 250=98.36%, 500=0.91%
    lat (msec) : 750=0.10%, 1000=0.10%, 2000=0.05%
  cpu          : usr=0.10%, sys=0.21%, ctx=2078, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2077/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=8308KB, aggrb=415KB/s, minb=415KB/s, maxb=415KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/444KB/0KB /s] [0/111/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=31241: Thu Jun 16 19:27:06 2016
  write: io=8284.0KB, bw=424119B/s, iops=103, runt= 20001msec
    slat (msec): min=4, max=382, avg= 9.65, stdev=13.01
    clat (usec): min=4, max=931038, avg=137572.91, stdev=36403.35
     lat (msec): min=10, max=1313, avg=147.22, stdev=44.88
    clat percentiles (msec):
     |  1.00th=[  104],  5.00th=[  117], 10.00th=[  121], 20.00th=[  126],
     | 30.00th=[  128], 40.00th=[  131], 50.00th=[  135], 60.00th=[  137],
     | 70.00th=[  141], 80.00th=[  145], 90.00th=[  151], 95.00th=[  161],
     | 99.00th=[  334], 99.50th=[  338], 99.90th=[  553], 99.95th=[  750],
     | 99.99th=[  930]
    bw (KB  /s): min=    3, max=  472, per=100.00%, avg=426.95, stdev=79.05
    lat (usec) : 10=0.05%
    lat (msec) : 20=0.10%, 50=0.14%, 100=0.29%, 250=98.26%, 500=0.92%
    lat (msec) : 750=0.19%, 1000=0.05%
  cpu          : usr=0.12%, sys=0.20%, ctx=2074, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2071/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=8284KB, aggrb=414KB/s, minb=414KB/s, maxb=414KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/436KB/0KB /s] [0/109/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=32167: Thu Jun 16 19:27:35 2016
  write: io=8108.0KB, bw=414963B/s, iops=101, runt= 20008msec
    slat (msec): min=4, max=225, avg= 9.86, stdev=12.54
    clat (usec): min=5, max=1313.1K, avg=140790.72, stdev=52756.65
     lat (msec): min=11, max=1506, avg=150.65, stdev=61.00
    clat percentiles (msec):
     |  1.00th=[  106],  5.00th=[  118], 10.00th=[  123], 20.00th=[  128],
     | 30.00th=[  131], 40.00th=[  135], 50.00th=[  137], 60.00th=[  139],
     | 70.00th=[  143], 80.00th=[  147], 90.00th=[  153], 95.00th=[  159],
     | 99.00th=[  334], 99.50th=[  343], 99.90th=[  914], 99.95th=[ 1139],
     | 99.99th=[ 1319]
    bw (KB  /s): min=    2, max=  485, per=100.00%, avg=422.57, stdev=79.38
    lat (usec) : 10=0.05%
    lat (msec) : 20=0.10%, 50=0.15%, 100=0.39%, 250=97.88%, 500=0.99%
    lat (msec) : 750=0.25%, 1000=0.10%, 2000=0.10%
  cpu          : usr=0.07%, sys=0.24%, ctx=2029, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2027/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=8108KB, aggrb=405KB/s, minb=405KB/s, maxb=405KB/s, mint=20008msec, maxt=20008msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/452KB/0KB /s] [0/113/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=636: Thu Jun 16 19:28:06 2016
  write: io=8220.0KB, bw=420653B/s, iops=102, runt= 20010msec
    slat (msec): min=3, max=216, avg= 9.73, stdev=12.46
    clat (usec): min=4, max=1311.8K, avg=138918.57, stdev=52781.78
     lat (msec): min=22, max=1505, avg=148.65, stdev=60.95
    clat percentiles (msec):
     |  1.00th=[  111],  5.00th=[  118], 10.00th=[  122], 20.00th=[  126],
     | 30.00th=[  129], 40.00th=[  133], 50.00th=[  135], 60.00th=[  137],
     | 70.00th=[  139], 80.00th=[  143], 90.00th=[  151], 95.00th=[  157],
     | 99.00th=[  338], 99.50th=[  347], 99.90th=[  938], 99.95th=[ 1123],
     | 99.99th=[ 1319]
    bw (KB  /s): min=    2, max=  473, per=100.00%, avg=428.46, stdev=80.61
    lat (usec) : 10=0.05%
    lat (msec) : 50=0.24%, 100=0.34%, 250=97.96%, 500=0.97%, 750=0.24%
    lat (msec) : 1000=0.10%, 2000=0.10%
  cpu          : usr=0.09%, sys=0.22%, ctx=2056, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2055/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=8220KB, aggrb=410KB/s, minb=410KB/s, maxb=410KB/s, mint=20010msec, maxt=20010msec
```

### RAND-READ
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [r(1)] [100.0% done] [6044KB/0KB/0KB /s] [1511/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=4050: Thu Jun 16 19:30:00 2016
  read : io=120680KB, bw=6033.8KB/s, iops=1508, runt= 20001msec
    slat (usec): min=375, max=38853, avg=657.46, stdev=272.13
    clat (usec): min=5, max=58763, avg=9941.83, stdev=1236.68
     lat (usec): min=693, max=59524, avg=10600.38, stdev=1281.45
    clat percentiles (usec):
     |  1.00th=[ 8896],  5.00th=[ 9152], 10.00th=[ 9280], 20.00th=[ 9536],
     | 30.00th=[ 9664], 40.00th=[ 9792], 50.00th=[ 9920], 60.00th=[ 9920],
     | 70.00th=[10048], 80.00th=[10176], 90.00th=[10432], 95.00th=[10688],
     | 99.00th=[11968], 99.50th=[14272], 99.90th=[19584], 99.95th=[20608],
     | 99.99th=[58624]
    bw (KB  /s): min= 5384, max= 6224, per=99.97%, avg=6030.97, stdev=162.36
    lat (usec) : 10=0.01%, 750=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=62.85%, 20=37.05%, 50=0.04%
    lat (msec) : 100=0.04%
  cpu          : usr=1.11%, sys=2.15%, ctx=53229, majf=0, minf=46
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=30170/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=120680KB, aggrb=6033KB/s, minb=6033KB/s, maxb=6033KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [6068KB/0KB/0KB /s] [1517/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=4890: Thu Jun 16 19:30:28 2016
  read : io=122740KB, bw=6136.8KB/s, iops=1534, runt= 20001msec
    slat (usec): min=425, max=8649, avg=646.34, stdev=135.97
    clat (usec): min=4, max=18972, avg=9775.16, stdev=610.90
     lat (usec): min=756, max=19589, avg=10422.61, stdev=631.48
    clat percentiles (usec):
     |  1.00th=[ 8896],  5.00th=[ 9152], 10.00th=[ 9280], 20.00th=[ 9408],
     | 30.00th=[ 9536], 40.00th=[ 9664], 50.00th=[ 9792], 60.00th=[ 9792],
     | 70.00th=[ 9920], 80.00th=[10048], 90.00th=[10304], 95.00th=[10432],
     | 99.00th=[11584], 99.50th=[12480], 99.90th=[16768], 99.95th=[17280],
     | 99.99th=[18816]
    bw (KB  /s): min= 5840, max= 6288, per=100.00%, avg=6138.87, stdev=79.31
    lat (usec) : 10=0.01%, 1000=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=74.66%, 20=25.32%
  cpu          : usr=0.92%, sys=2.40%, ctx=53833, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=30685/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=122740KB, aggrb=6136KB/s, minb=6136KB/s, maxb=6136KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [6196KB/0KB/0KB /s] [1549/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=5781: Thu Jun 16 19:30:57 2016
  read : io=123548KB, bw=6177.1KB/s, iops=1544, runt= 20001msec
    slat (usec): min=449, max=9377, avg=642.08, stdev=131.87
    clat (usec): min=3, max=19088, avg=9711.13, stdev=593.42
     lat (usec): min=601, max=19752, avg=10354.29, stdev=612.99
    clat percentiles (usec):
     |  1.00th=[ 8768],  5.00th=[ 9024], 10.00th=[ 9152], 20.00th=[ 9408],
     | 30.00th=[ 9536], 40.00th=[ 9536], 50.00th=[ 9664], 60.00th=[ 9792],
     | 70.00th=[ 9920], 80.00th=[10048], 90.00th=[10176], 95.00th=[10304],
     | 99.00th=[11456], 99.50th=[12608], 99.90th=[15936], 99.95th=[18816],
     | 99.99th=[19072]
    bw (KB  /s): min= 6040, max= 6352, per=100.00%, avg=6179.56, stdev=66.73
    lat (usec) : 4=0.01%, 750=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=81.15%, 20=18.82%
  cpu          : usr=0.89%, sys=2.42%, ctx=54883, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=30887/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=123548KB, aggrb=6177KB/s, minb=6177KB/s, maxb=6177KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [6264KB/0KB/0KB /s] [1566/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=6684: Thu Jun 16 19:31:27 2016
  read : io=123596KB, bw=6179.6KB/s, iops=1544, runt= 20001msec
    slat (usec): min=448, max=12350, avg=641.84, stdev=142.80
    clat (usec): min=4, max=23075, avg=9707.58, stdev=637.89
     lat (usec): min=727, max=23742, avg=10350.52, stdev=659.01
    clat percentiles (usec):
     |  1.00th=[ 8768],  5.00th=[ 9024], 10.00th=[ 9152], 20.00th=[ 9408],
     | 30.00th=[ 9408], 40.00th=[ 9536], 50.00th=[ 9664], 60.00th=[ 9792],
     | 70.00th=[ 9792], 80.00th=[ 9920], 90.00th=[10176], 95.00th=[10304],
     | 99.00th=[11840], 99.50th=[13248], 99.90th=[16064], 99.95th=[16320],
     | 99.99th=[22912]
    bw (KB  /s): min= 5960, max= 6328, per=99.98%, avg=6177.64, stdev=78.41
    lat (usec) : 10=0.01%, 750=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=81.48%, 20=18.46%, 50=0.05%
  cpu          : usr=0.74%, sys=2.60%, ctx=54653, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=30899/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=123596KB, aggrb=6179KB/s, minb=6179KB/s, maxb=6179KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [6132KB/0KB/0KB /s] [1533/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=7537: Thu Jun 16 19:31:54 2016
  read : io=122480KB, bw=6123.8KB/s, iops=1530, runt= 20001msec
    slat (usec): min=446, max=9016, avg=647.72, stdev=145.64
    clat (usec): min=4, max=20112, avg=9795.75, stdev=656.06
     lat (usec): min=717, max=20791, avg=10444.54, stdev=679.31
    clat percentiles (usec):
     |  1.00th=[ 8896],  5.00th=[ 9152], 10.00th=[ 9280], 20.00th=[ 9408],
     | 30.00th=[ 9536], 40.00th=[ 9664], 50.00th=[ 9792], 60.00th=[ 9792],
     | 70.00th=[ 9920], 80.00th=[10048], 90.00th=[10304], 95.00th=[10432],
     | 99.00th=[11840], 99.50th=[13632], 99.90th=[18304], 99.95th=[18560],
     | 99.99th=[19840]
    bw (KB  /s): min= 5936, max= 6264, per=100.00%, avg=6125.13, stdev=68.68
    lat (usec) : 10=0.01%, 750=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=74.34%, 20=25.64%, 50=0.01%
  cpu          : usr=0.95%, sys=2.34%, ctx=54667, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=30620/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=122480KB, aggrb=6123KB/s, minb=6123KB/s, maxb=6123KB/s, mint=20001msec, maxt=20001msec
```

### RAND-READ-WRITE
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [m(1)] [100.0% done] [436KB/384KB/0KB /s] [109/96/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=10041: Thu Jun 16 19:33:18 2016
  read : io=8260.0KB, bw=422827B/s, iops=103, runt= 20004msec
    slat (usec): min=463, max=2012, avg=712.26, stdev=107.13
    clat (msec): min=7, max=392, avg=71.77, stdev=27.05
     lat (msec): min=7, max=393, avg=72.48, stdev=27.05
    clat percentiles (msec):
     |  1.00th=[   33],  5.00th=[   43], 10.00th=[   48], 20.00th=[   56],
     | 30.00th=[   61], 40.00th=[   66], 50.00th=[   71], 60.00th=[   75],
     | 70.00th=[   80], 80.00th=[   86], 90.00th=[   94], 95.00th=[  102],
     | 99.00th=[  125], 99.50th=[  135], 99.90th=[  392], 99.95th=[  392],
     | 99.99th=[  392]
    bw (KB  /s): min=   56, max=  592, per=100.00%, avg=412.59, stdev=98.23
  write: io=8184.0KB, bw=418937B/s, iops=102, runt= 20004msec
    slat (msec): min=4, max=335, avg= 9.05, stdev= 9.17
    clat (usec): min=4, max=399369, avg=73123.01, stdev=32355.36
     lat (msec): min=7, max=406, avg=82.17, stdev=33.74
    clat percentiles (msec):
     |  1.00th=[   32],  5.00th=[   42], 10.00th=[   48], 20.00th=[   56],
     | 30.00th=[   62], 40.00th=[   67], 50.00th=[   71], 60.00th=[   75],
     | 70.00th=[   80], 80.00th=[   87], 90.00th=[   95], 95.00th=[  103],
     | 99.00th=[  129], 99.50th=[  351], 99.90th=[  396], 99.95th=[  396],
     | 99.99th=[  400]
    bw (KB  /s): min=   96, max=  490, per=99.60%, avg=407.36, stdev=69.81
    lat (usec) : 10=0.02%
    lat (msec) : 10=0.10%, 50=11.63%, 100=82.34%, 250=5.28%, 500=0.63%
  cpu          : usr=0.07%, sys=0.47%, ctx=4166, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=2065/w=2046/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=8260KB, aggrb=412KB/s, minb=412KB/s, maxb=412KB/s, mint=20004msec, maxt=20004msec
  WRITE: io=8184KB, aggrb=409KB/s, minb=409KB/s, maxb=409KB/s, mint=20004msec, maxt=20004msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [524KB/400KB/0KB /s] [131/100/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=11161: Thu Jun 16 19:33:55 2016
  read : io=8156.0KB, bw=417566B/s, iops=101, runt= 20001msec
    slat (usec): min=469, max=1486, avg=706.10, stdev=102.31
    clat (msec): min=15, max=883, avg=71.30, stdev=32.18
     lat (msec): min=16, max=884, avg=72.01, stdev=32.19
    clat percentiles (msec):
     |  1.00th=[   33],  5.00th=[   43], 10.00th=[   48], 20.00th=[   55],
     | 30.00th=[   61], 40.00th=[   65], 50.00th=[   69], 60.00th=[   74],
     | 70.00th=[   80], 80.00th=[   86], 90.00th=[   94], 95.00th=[  103],
     | 99.00th=[  120], 99.50th=[  127], 99.90th=[  486], 99.95th=[  668],
     | 99.99th=[  881]
    bw (KB  /s): min=    4, max=  549, per=100.00%, avg=410.55, stdev=98.55
  write: io=8064.0KB, bw=412856B/s, iops=100, runt= 20001msec
    slat (msec): min=4, max=212, avg= 9.19, stdev= 9.96
    clat (usec): min=4, max=681727, avg=73276.55, stdev=39056.02
     lat (msec): min=10, max=883, avg=82.47, stdev=43.34
    clat percentiles (msec):
     |  1.00th=[   33],  5.00th=[   42], 10.00th=[   48], 20.00th=[   56],
     | 30.00th=[   61], 40.00th=[   65], 50.00th=[   70], 60.00th=[   75],
     | 70.00th=[   80], 80.00th=[   87], 90.00th=[   96], 95.00th=[  105],
     | 99.00th=[  127], 99.50th=[  306], 99.90th=[  660], 99.95th=[  660],
     | 99.99th=[  685]
    bw (KB  /s): min=  255, max=  512, per=100.00%, avg=420.08, stdev=41.91
    lat (usec) : 10=0.02%
    lat (msec) : 20=0.12%, 50=12.97%, 100=80.44%, 250=5.77%, 500=0.54%
    lat (msec) : 750=0.10%, 1000=0.02%
  cpu          : usr=0.14%, sys=0.39%, ctx=4107, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=2039/w=2016/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=8156KB, aggrb=407KB/s, minb=407KB/s, maxb=407KB/s, mint=20001msec, maxt=20001msec
  WRITE: io=8064KB, aggrb=403KB/s, minb=403KB/s, maxb=403KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [408KB/408KB/0KB /s] [102/102/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=12394: Thu Jun 16 19:34:35 2016
  read : io=7892.0KB, bw=403949B/s, iops=98, runt= 20006msec
    slat (usec): min=462, max=1726, avg=706.19, stdev=101.88
    clat (msec): min=11, max=1088, avg=72.94, stdev=39.62
     lat (msec): min=12, max=1088, avg=73.65, stdev=39.63
    clat percentiles (msec):
     |  1.00th=[   35],  5.00th=[   44], 10.00th=[   48], 20.00th=[   56],
     | 30.00th=[   60], 40.00th=[   65], 50.00th=[   70], 60.00th=[   75],
     | 70.00th=[   81], 80.00th=[   87], 90.00th=[   95], 95.00th=[  105],
     | 99.00th=[  125], 99.50th=[  265], 99.90th=[  865], 99.95th=[ 1090],
     | 99.99th=[ 1090]
    bw (KB  /s): min=    3, max=  600, per=100.00%, avg=405.37, stdev=116.52
  write: io=7860.0KB, bw=402311B/s, iops=98, runt= 20006msec
    slat (msec): min=4, max=213, avg= 9.46, stdev=11.86
    clat (usec): min=4, max=882646, avg=74805.74, stdev=46738.91
     lat (msec): min=11, max=1088, avg=84.27, stdev=53.27
    clat percentiles (msec):
     |  1.00th=[   32],  5.00th=[   43], 10.00th=[   48], 20.00th=[   55],
     | 30.00th=[   61], 40.00th=[   66], 50.00th=[   71], 60.00th=[   76],
     | 70.00th=[   81], 80.00th=[   87], 90.00th=[   98], 95.00th=[  106],
     | 99.00th=[  265], 99.50th=[  289], 99.90th=[  865], 99.95th=[  881],
     | 99.99th=[  881]
    bw (KB  /s): min=  118, max=  486, per=100.00%, avg=414.00, stdev=55.09
    lat (usec) : 10=0.03%
    lat (msec) : 20=0.05%, 50=12.16%, 100=80.35%, 250=6.55%, 500=0.63%
    lat (msec) : 750=0.13%, 1000=0.08%, 2000=0.03%
  cpu          : usr=0.09%, sys=0.43%, ctx=3994, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1973/w=1965/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=7892KB, aggrb=394KB/s, minb=394KB/s, maxb=394KB/s, mint=20006msec, maxt=20006msec
  WRITE: io=7860KB, aggrb=392KB/s, minb=392KB/s, maxb=392KB/s, mint=20006msec, maxt=20006msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [400KB/400KB/0KB /s] [100/100/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=13666: Thu Jun 16 19:35:16 2016
  read : io=7888.0KB, bw=403805B/s, iops=98, runt= 20003msec
    slat (usec): min=395, max=2575, avg=701.90, stdev=107.36
    clat (msec): min=23, max=1099, avg=72.90, stdev=40.41
     lat (msec): min=23, max=1100, avg=73.61, stdev=40.42
    clat percentiles (msec):
     |  1.00th=[   35],  5.00th=[   44], 10.00th=[   49], 20.00th=[   55],
     | 30.00th=[   61], 40.00th=[   65], 50.00th=[   70], 60.00th=[   75],
     | 70.00th=[   80], 80.00th=[   87], 90.00th=[   95], 95.00th=[  104],
     | 99.00th=[  124], 99.50th=[  281], 99.90th=[  881], 99.95th=[ 1106],
     | 99.99th=[ 1106]
    bw (KB  /s): min=    3, max=  621, per=100.00%, avg=405.68, stdev=115.68
  write: io=7856.0KB, bw=402166B/s, iops=98, runt= 20003msec
    slat (msec): min=4, max=213, avg= 9.47, stdev=12.05
    clat (usec): min=4, max=898043, avg=74895.39, stdev=48128.03
     lat (msec): min=11, max=1100, avg=84.36, stdev=54.78
    clat percentiles (msec):
     |  1.00th=[   34],  5.00th=[   42], 10.00th=[   49], 20.00th=[   56],
     | 30.00th=[   61], 40.00th=[   65], 50.00th=[   71], 60.00th=[   76],
     | 70.00th=[   81], 80.00th=[   88], 90.00th=[   97], 95.00th=[  106],
     | 99.00th=[  269], 99.50th=[  293], 99.90th=[  881], 99.95th=[  898],
     | 99.99th=[  898]
    bw (KB  /s): min=  108, max=  489, per=100.00%, avg=414.49, stdev=60.17
    lat (usec) : 10=0.03%
    lat (msec) : 20=0.05%, 50=12.12%, 100=80.49%, 250=6.38%, 500=0.71%
    lat (msec) : 750=0.13%, 1000=0.08%, 2000=0.03%
  cpu          : usr=0.04%, sys=0.48%, ctx=3976, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1972/w=1964/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=7888KB, aggrb=394KB/s, minb=394KB/s, maxb=394KB/s, mint=20003msec, maxt=20003msec
  WRITE: io=7856KB, aggrb=392KB/s, minb=392KB/s, maxb=392KB/s, mint=20003msec, maxt=20003msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [476KB/380KB/0KB /s] [119/95/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=14753: Thu Jun 16 19:35:51 2016
  read : io=8164.0KB, bw=417975B/s, iops=102, runt= 20001msec
    slat (usec): min=478, max=1475, avg=703.94, stdev=97.59
    clat (usec): min=4, max=894670, avg=71144.20, stdev=33726.53
     lat (usec): min=828, max=895491, avg=71848.80, stdev=33733.64
    clat percentiles (msec):
     |  1.00th=[   32],  5.00th=[   43], 10.00th=[   48], 20.00th=[   55],
     | 30.00th=[   60], 40.00th=[   64], 50.00th=[   69], 60.00th=[   74],
     | 70.00th=[   79], 80.00th=[   85], 90.00th=[   94], 95.00th=[  101],
     | 99.00th=[  119], 99.50th=[  269], 99.90th=[  478], 99.95th=[  693],
     | 99.99th=[  898]
    bw (KB  /s): min=    4, max=  606, per=100.00%, avg=411.63, stdev=111.59
  write: io=8068.0KB, bw=413060B/s, iops=100, runt= 20001msec
    slat (msec): min=4, max=213, avg= 9.19, stdev=10.97
    clat (msec): min=1, max=693, avg=72.56, stdev=36.96
     lat (msec): min=22, max=895, avg=81.75, stdev=42.49
    clat percentiles (msec):
     |  1.00th=[   31],  5.00th=[   42], 10.00th=[   47], 20.00th=[   55],
     | 30.00th=[   60], 40.00th=[   65], 50.00th=[   70], 60.00th=[   75],
     | 70.00th=[   79], 80.00th=[   86], 90.00th=[   95], 95.00th=[  102],
     | 99.00th=[  258], 99.50th=[  289], 99.90th=[  478], 99.95th=[  685],
     | 99.99th=[  693]
    bw (KB  /s): min=  112, max=  488, per=100.00%, avg=421.78, stdev=59.57
    lat (usec) : 10=0.02%, 1000=0.02%
    lat (msec) : 2=0.02%, 50=13.21%, 100=81.07%, 250=4.81%, 500=0.74%
    lat (msec) : 750=0.07%, 1000=0.02%
  cpu          : usr=0.09%, sys=0.45%, ctx=4080, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=2041/w=2017/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=8164KB, aggrb=408KB/s, minb=408KB/s, maxb=408KB/s, mint=20001msec, maxt=20001msec
  WRITE: io=8068KB, aggrb=403KB/s, minb=403KB/s, maxb=403KB/s, mint=20001msec, maxt=20001msec
```

# Throughput Write
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/45056KB/0KB /s] [0/11/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=25113: Thu Jun 16 19:42:08 2016
  write: io=2820.0MB, bw=48070KB/s, iops=11, runt= 60073msec
    slat (msec): min=61, max=413, avg=85.19, stdev=40.40
    clat (usec): min=11, max=1973.2K, avg=1253703.68, stdev=194923.27
     lat (msec): min=165, max=2238, avg=1338.90, stdev=202.06
    clat percentiles (msec):
     |  1.00th=[  701],  5.00th=[ 1090], 10.00th=[ 1106], 20.00th=[ 1139],
     | 30.00th=[ 1156], 40.00th=[ 1188], 50.00th=[ 1205], 60.00th=[ 1270],
     | 70.00th=[ 1303], 80.00th=[ 1352], 90.00th=[ 1434], 95.00th=[ 1614],
     | 99.00th=[ 1942], 99.50th=[ 1958], 99.90th=[ 1975], 99.95th=[ 1975],
     | 99.99th=[ 1975]
    bw (KB  /s): min= 1854, max=58618, per=100.00%, avg=48769.25, stdev=9115.81
    lat (usec) : 20=0.14%
    lat (msec) : 250=0.14%, 500=0.43%, 750=0.43%, 1000=0.57%, 2000=98.30%
  cpu          : usr=0.48%, sys=0.43%, ctx=708, majf=0, minf=29
  IO depths    : 1=0.1%, 2=0.3%, 4=0.6%, 8=1.1%, 16=97.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=705/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=2820.0MB, aggrb=48069KB/s, minb=48069KB/s, maxb=48069KB/s, mint=60073msec, maxt=60073msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/53248KB/0KB /s] [0/13/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=30642: Thu Jun 16 19:45:09 2016
  write: io=2852.0MB, bw=48654KB/s, iops=11, runt= 60025msec
    slat (msec): min=61, max=413, avg=84.17, stdev=40.10
    clat (usec): min=11, max=2322.2K, avg=1232817.97, stdev=194502.73
     lat (msec): min=84, max=2588, avg=1316.99, stdev=204.46
    clat percentiles (msec):
     |  1.00th=[  545],  5.00th=[ 1090], 10.00th=[ 1106], 20.00th=[ 1123],
     | 30.00th=[ 1139], 40.00th=[ 1172], 50.00th=[ 1188], 60.00th=[ 1221],
     | 70.00th=[ 1303], 80.00th=[ 1336], 90.00th=[ 1385], 95.00th=[ 1532],
     | 99.00th=[ 1893], 99.50th=[ 2114], 99.90th=[ 2311], 99.95th=[ 2311],
     | 99.99th=[ 2311]
    bw (KB  /s): min= 1582, max=58829, per=100.00%, avg=49582.42, stdev=9188.39
    lat (usec) : 20=0.14%
    lat (msec) : 100=0.14%, 250=0.28%, 500=0.42%, 750=0.42%, 1000=0.42%
    lat (msec) : 2000=97.62%, >=2000=0.56%
  cpu          : usr=0.53%, sys=0.38%, ctx=716, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.3%, 4=0.6%, 8=1.1%, 16=97.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=713/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=2852.0MB, aggrb=48653KB/s, minb=48653KB/s, maxb=48653KB/s, mint=60025msec, maxt=60025msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/53248KB/0KB /s] [0/13/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=1374: Thu Jun 16 19:46:53 2016
  write: io=2840.0MB, bw=48461KB/s, iops=11, runt= 60010msec
    slat (msec): min=61, max=428, avg=84.50, stdev=39.33
    clat (usec): min=11, max=2282.7K, avg=1238192.77, stdev=188019.99
     lat (msec): min=72, max=2547, avg=1322.70, stdev=197.63
    clat percentiles (msec):
     |  1.00th=[  529],  5.00th=[ 1090], 10.00th=[ 1106], 20.00th=[ 1123],
     | 30.00th=[ 1139], 40.00th=[ 1172], 50.00th=[ 1205], 60.00th=[ 1254],
     | 70.00th=[ 1303], 80.00th=[ 1352], 90.00th=[ 1483], 95.00th=[ 1532],
     | 99.00th=[ 1696], 99.50th=[ 1909], 99.90th=[ 2278], 99.95th=[ 2278],
     | 99.99th=[ 2278]
    bw (KB  /s): min= 1607, max=58724, per=100.00%, avg=49395.18, stdev=8800.53
    lat (usec) : 20=0.14%
    lat (msec) : 100=0.14%, 250=0.28%, 500=0.42%, 750=0.42%, 1000=0.56%
    lat (msec) : 2000=97.75%, >=2000=0.28%
  cpu          : usr=0.52%, sys=0.39%, ctx=713, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.3%, 4=0.6%, 8=1.1%, 16=97.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=710/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=2840.0MB, aggrb=48461KB/s, minb=48461KB/s, maxb=48461KB/s, mint=60010msec, maxt=60010msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/40960KB/0KB /s] [0/10/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=3539: Thu Jun 16 19:48:03 2016
  write: io=2820.0MB, bw=48098KB/s, iops=11, runt= 60037msec
    slat (msec): min=60, max=291, avg=85.14, stdev=40.07
    clat (usec): min=11, max=2242.3K, avg=1249487.61, stdev=212644.85
     lat (msec): min=69, max=2389, avg=1334.63, stdev=222.08
    clat percentiles (msec):
     |  1.00th=[  545],  5.00th=[ 1090], 10.00th=[ 1090], 20.00th=[ 1123],
     | 30.00th=[ 1156], 40.00th=[ 1188], 50.00th=[ 1221], 60.00th=[ 1254],
     | 70.00th=[ 1303], 80.00th=[ 1352], 90.00th=[ 1450], 95.00th=[ 1598],
     | 99.00th=[ 1926], 99.50th=[ 2057], 99.90th=[ 2245], 99.95th=[ 2245],
     | 99.99th=[ 2245]
    bw (KB  /s): min= 1714, max=60569, per=100.00%, avg=48760.77, stdev=9515.19
    lat (usec) : 20=0.14%
    lat (msec) : 100=0.14%, 250=0.28%, 500=0.43%, 750=0.43%, 1000=0.57%
    lat (msec) : 2000=97.02%, >=2000=0.99%
  cpu          : usr=0.52%, sys=0.39%, ctx=711, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.3%, 4=0.6%, 8=1.1%, 16=97.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=705/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=2820.0MB, aggrb=48098KB/s, minb=48098KB/s, maxb=48098KB/s, mint=60037msec, maxt=60037msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/53248KB/0KB /s] [0/13/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=6539: Thu Jun 16 19:49:43 2016
  write: io=2856.0MB, bw=48703KB/s, iops=11, runt= 60049msec
    slat (msec): min=61, max=470, avg=84.08, stdev=40.29
    clat (usec): min=12, max=2258.1K, avg=1232283.17, stdev=202733.32
     lat (msec): min=107, max=2531, avg=1316.37, stdev=212.98
    clat percentiles (msec):
     |  1.00th=[  553],  5.00th=[ 1074], 10.00th=[ 1106], 20.00th=[ 1123],
     | 30.00th=[ 1139], 40.00th=[ 1156], 50.00th=[ 1172], 60.00th=[ 1221],
     | 70.00th=[ 1287], 80.00th=[ 1336], 90.00th=[ 1483], 95.00th=[ 1565],
     | 99.00th=[ 1909], 99.50th=[ 2057], 99.90th=[ 2245], 99.95th=[ 2245],
     | 99.99th=[ 2245]
    bw (KB  /s): min= 1618, max=60235, per=100.00%, avg=49541.28, stdev=9367.00
    lat (usec) : 20=0.14%
    lat (msec) : 250=0.28%, 500=0.56%, 750=0.42%, 1000=0.42%, 2000=97.62%
    lat (msec) : >=2000=0.56%
  cpu          : usr=0.45%, sys=0.45%, ctx=717, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.3%, 4=0.6%, 8=1.1%, 16=97.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=714/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=2856.0MB, aggrb=48702KB/s, minb=48702KB/s, maxb=48702KB/s, mint=60049msec, maxt=60049msec
```

# Throughput Read
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [R(1)] [98.2% done] [94208KB/0KB/0KB /s] [23/0/0 iops] [eta 00m:01s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=10622: Thu Jun 16 19:51:53 2016
  read : io=5120.0MB, bw=96099KB/s, iops=23, runt= 54557msec
    slat (msec): min=39, max=52, avg=42.61, stdev= 2.86
    clat (usec): min=12, max=671934, avg=635197.67, stdev=43555.30
     lat (msec): min=40, max=714, avg=677.81, stdev=43.68
    clat percentiles (msec):
     |  1.00th=[  510],  5.00th=[  619], 10.00th=[  627], 20.00th=[  627],
     | 30.00th=[  635], 40.00th=[  635], 50.00th=[  644], 60.00th=[  644],
     | 70.00th=[  644], 80.00th=[  652], 90.00th=[  652], 95.00th=[  660],
     | 99.00th=[  668], 99.50th=[  668], 99.90th=[  668], 99.95th=[  676],
     | 99.99th=[  676]
    bw (KB  /s): min= 5736, max=100848, per=99.26%, avg=95390.36, stdev=9025.61
    lat (usec) : 20=0.08%
    lat (msec) : 50=0.08%, 100=0.08%, 250=0.23%, 500=0.47%, 750=99.06%
  cpu          : usr=0.04%, sys=1.03%, ctx=2234, majf=0, minf=572
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=96099KB/s, minb=96099KB/s, maxb=96099KB/s, mint=54557msec, maxt=54557msec
```


------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [98.2% done] [94208KB/0KB/0KB /s] [23/0/0 iops] [eta 00m:01s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=12537: Thu Jun 16 19:52:57 2016
  read : io=5120.0MB, bw=96357KB/s, iops=23, runt= 54411msec
    slat (msec): min=39, max=53, avg=42.49, stdev= 2.88
    clat (usec): min=10, max=670289, avg=633508.92, stdev=43505.06
     lat (msec): min=40, max=712, avg=676.00, stdev=43.65
    clat percentiles (msec):
     |  1.00th=[  506],  5.00th=[  619], 10.00th=[  619], 20.00th=[  627],
     | 30.00th=[  635], 40.00th=[  635], 50.00th=[  635], 60.00th=[  644],
     | 70.00th=[  644], 80.00th=[  644], 90.00th=[  652], 95.00th=[  660],
     | 99.00th=[  660], 99.50th=[  668], 99.90th=[  668], 99.95th=[  668],
     | 99.99th=[  668]
    bw (KB  /s): min= 5760, max=100278, per=99.23%, avg=95610.25, stdev=9087.54
    lat (usec) : 20=0.08%
    lat (msec) : 50=0.08%, 100=0.08%, 250=0.23%, 500=0.47%, 750=99.06%
  cpu          : usr=0.01%, sys=1.07%, ctx=2205, majf=0, minf=573
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=96356KB/s, minb=96356KB/s, maxb=96356KB/s, mint=54411msec, maxt=54411msec
```


------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [98.2% done] [94208KB/0KB/0KB /s] [23/0/0 iops] [eta 00m:01s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=14866: Thu Jun 16 19:54:14 2016
  read : io=5120.0MB, bw=96600KB/s, iops=23, runt= 54274msec
    slat (msec): min=39, max=50, avg=42.38, stdev= 2.92
    clat (usec): min=10, max=677957, avg=631878.43, stdev=43391.45
     lat (msec): min=40, max=719, avg=674.27, stdev=43.52
    clat percentiles (msec):
     |  1.00th=[  506],  5.00th=[  619], 10.00th=[  619], 20.00th=[  627],
     | 30.00th=[  627], 40.00th=[  635], 50.00th=[  635], 60.00th=[  635],
     | 70.00th=[  644], 80.00th=[  644], 90.00th=[  652], 95.00th=[  652],
     | 99.00th=[  660], 99.50th=[  668], 99.90th=[  676], 99.95th=[  676],
     | 99.99th=[  676]
    bw (KB  /s): min= 5696, max=100657, per=99.24%, avg=95866.90, stdev=9115.62
    lat (usec) : 20=0.08%
    lat (msec) : 50=0.08%, 100=0.08%, 250=0.23%, 500=0.47%, 750=99.06%
  cpu          : usr=0.04%, sys=1.03%, ctx=2223, majf=0, minf=573
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=96600KB/s, minb=96600KB/s, maxb=96600KB/s, mint=54274msec, maxt=54274msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [98.2% done] [94208KB/0KB/0KB /s] [23/0/0 iops] [eta 00m:01s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=17415: Thu Jun 16 19:55:39 2016
  read : io=5120.0MB, bw=96534KB/s, iops=23, runt= 54311msec
    slat (msec): min=39, max=52, avg=42.41, stdev= 2.95
    clat (usec): min=12, max=671703, avg=632325.09, stdev=43307.73
     lat (msec): min=43, max=713, avg=674.74, stdev=43.43
    clat percentiles (msec):
     |  1.00th=[  506],  5.00th=[  619], 10.00th=[  619], 20.00th=[  627],
     | 30.00th=[  627], 40.00th=[  635], 50.00th=[  635], 60.00th=[  644],
     | 70.00th=[  644], 80.00th=[  644], 90.00th=[  652], 95.00th=[  652],
     | 99.00th=[  668], 99.50th=[  668], 99.90th=[  668], 99.95th=[  668],
     | 99.99th=[  668]
    bw (KB  /s): min= 5744, max=100657, per=99.23%, avg=95793.68, stdev=9122.05
    lat (usec) : 20=0.08%
    lat (msec) : 50=0.08%, 100=0.08%, 250=0.23%, 500=0.47%, 750=99.06%
  cpu          : usr=0.05%, sys=1.02%, ctx=2257, majf=0, minf=574
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=96534KB/s, minb=96534KB/s, maxb=96534KB/s, mint=54311msec, maxt=54311msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [98304KB/0KB/0KB /s] [24/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=20034: Thu Jun 16 19:57:05 2016
  read : io=5120.0MB, bw=96671KB/s, iops=23, runt= 54234msec
    slat (msec): min=39, max=51, avg=42.35, stdev= 2.94
    clat (usec): min=11, max=673734, avg=631437.25, stdev=43384.36
     lat (msec): min=40, max=716, avg=673.79, stdev=43.52
    clat percentiles (msec):
     |  1.00th=[  506],  5.00th=[  619], 10.00th=[  619], 20.00th=[  627],
     | 30.00th=[  627], 40.00th=[  635], 50.00th=[  635], 60.00th=[  635],
     | 70.00th=[  644], 80.00th=[  644], 90.00th=[  652], 95.00th=[  652],
     | 99.00th=[  660], 99.50th=[  668], 99.90th=[  676], 99.95th=[  676],
     | 99.99th=[  676]
    bw (KB  /s): min= 5736, max=100467, per=99.23%, avg=95927.63, stdev=9110.72
    lat (usec) : 20=0.08%
    lat (msec) : 50=0.08%, 100=0.08%, 250=0.23%, 500=0.47%, 750=99.06%
  cpu          : usr=0.05%, sys=1.02%, ctx=2209, majf=0, minf=573
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=96671KB/s, minb=96671KB/s, maxb=96671KB/s, mint=54234msec, maxt=54234msec
```
