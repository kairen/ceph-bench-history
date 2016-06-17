# rados block device using fio-libaio

- [Write](#write)
- [Read](#read)
- [Read Write](#read-write)
- [Rand Write](#rand-write)
- [Rand Read](#rand-read)
- [Rand Read Write](#rand-read-write)
- [Throughput Write](#throughput-write)
- [Throughput Read](#throughput-read)

### WRITE
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2248KB/0KB /s] [0/562/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=17229: Fri Jun 17 20:51:17 2016
  write: io=50820KB, bw=2536.5KB/s, iops=634, runt= 20036msec
    slat (usec): min=12, max=8707, avg=38.65, stdev=107.91
    clat (msec): min=4, max=239, avg=25.19, stdev=18.33
     lat (msec): min=4, max=239, avg=25.23, stdev=18.32
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   18], 10.00th=[   18], 20.00th=[   18],
     | 30.00th=[   18], 40.00th=[   18], 50.00th=[   19], 60.00th=[   24],
     | 70.00th=[   26], 80.00th=[   27], 90.00th=[   31], 95.00th=[   60],
     | 99.00th=[  104], 99.50th=[  118], 99.90th=[  227], 99.95th=[  237],
     | 99.99th=[  239]
    bw (KB  /s): min= 1389, max= 3273, per=100.00%, avg=2551.03, stdev=451.15
    lat (msec) : 10=1.35%, 20=58.05%, 50=34.13%, 100=4.79%, 250=1.68%
  cpu          : usr=0.38%, sys=1.39%, ctx=12091, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12705/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=50820KB, aggrb=2536KB/s, minb=2536KB/s, maxb=2536KB/s, mint=20036msec, maxt=20036msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2364KB/0KB /s] [0/591/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=17106: Fri Jun 17 20:50:57 2016
  write: io=51776KB, bw=2567.9KB/s, iops=641, runt= 20163msec
    slat (usec): min=14, max=11967, avg=39.45, stdev=135.33
    clat (msec): min=5, max=342, avg=24.87, stdev=19.89
     lat (msec): min=5, max=343, avg=24.91, stdev=19.89
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   18], 10.00th=[   18], 20.00th=[   18],
     | 30.00th=[   18], 40.00th=[   18], 50.00th=[   19], 60.00th=[   20],
     | 70.00th=[   26], 80.00th=[   26], 90.00th=[   28], 95.00th=[   53],
     | 99.00th=[  114], 99.50th=[  161], 99.90th=[  243], 99.95th=[  243],
     | 99.99th=[  343]
    bw (KB  /s): min= 1125, max= 3504, per=100.00%, avg=2614.15, stdev=492.48
    lat (msec) : 10=1.20%, 20=59.02%, 50=34.37%, 100=3.66%, 250=1.72%
    lat (msec) : 500=0.03%
  cpu          : usr=0.31%, sys=1.47%, ctx=13071, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12944/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=51776KB, aggrb=2567KB/s, minb=2567KB/s, maxb=2567KB/s, mint=20163msec, maxt=20163msec
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-for-rbd: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/1664KB/0KB /s] [0/416/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=16962: Fri Jun 17 20:50:37 2016
  write: io=51184KB, bw=2530.5KB/s, iops=632, runt= 20227msec
    slat (usec): min=18, max=61691, avg=54.55, stdev=621.86
    clat (msec): min=6, max=459, avg=25.22, stdev=23.45
     lat (msec): min=6, max=459, avg=25.28, stdev=23.49
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   18], 10.00th=[   18], 20.00th=[   18],
     | 30.00th=[   18], 40.00th=[   18], 50.00th=[   19], 60.00th=[   20],
     | 70.00th=[   26], 80.00th=[   26], 90.00th=[   28], 95.00th=[   60],
     | 99.00th=[  116], 99.50th=[  159], 99.90th=[  383], 99.95th=[  461],
     | 99.99th=[  461]
    bw (KB  /s): min=  771, max= 3185, per=100.00%, avg=2580.08, stdev=544.70
    lat (msec) : 10=1.59%, 20=59.80%, 50=32.60%, 100=4.07%, 250=1.82%
    lat (msec) : 500=0.12%
  cpu          : usr=0.21%, sys=1.83%, ctx=15341, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12796/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=51184KB, aggrb=2530KB/s, minb=2530KB/s, maxb=2530KB/s, mint=20227msec, maxt=20227msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2188KB/0KB /s] [0/547/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=17478: Fri Jun 17 20:51:58 2016
  write: io=50544KB, bw=2515.8KB/s, iops=628, runt= 20091msec
    slat (usec): min=8, max=11308, avg=38.66, stdev=131.58
    clat (msec): min=6, max=251, avg=25.39, stdev=20.47
     lat (msec): min=6, max=251, avg=25.43, stdev=20.47
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   18], 10.00th=[   18], 20.00th=[   18],
     | 30.00th=[   18], 40.00th=[   18], 50.00th=[   19], 60.00th=[   24],
     | 70.00th=[   26], 80.00th=[   27], 90.00th=[   29], 95.00th=[   59],
     | 99.00th=[  121], 99.50th=[  135], 99.90th=[  235], 99.95th=[  235],
     | 99.99th=[  245]
    bw (KB  /s): min=  992, max= 3251, per=100.00%, avg=2525.44, stdev=495.53
    lat (msec) : 10=1.84%, 20=57.84%, 50=33.89%, 100=4.68%, 250=1.74%
    lat (msec) : 500=0.01%
  cpu          : usr=0.31%, sys=1.44%, ctx=11731, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12636/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=50544KB, aggrb=2515KB/s, minb=2515KB/s, maxb=2515KB/s, mint=20091msec, maxt=20091msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/1284KB/0KB /s] [0/321/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=17355: Fri Jun 17 20:51:38 2016
  write: io=51224KB, bw=2530.9KB/s, iops=632, runt= 20240msec
    slat (usec): min=9, max=32891, avg=41.53, stdev=327.02
    clat (msec): min=4, max=375, avg=25.23, stdev=24.10
     lat (msec): min=4, max=375, avg=25.27, stdev=24.10
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   18], 10.00th=[   18], 20.00th=[   18],
     | 30.00th=[   18], 40.00th=[   18], 50.00th=[   19], 60.00th=[   20],
     | 70.00th=[   26], 80.00th=[   27], 90.00th=[   28], 95.00th=[   51],
     | 99.00th=[  112], 99.50th=[  176], 99.90th=[  375], 99.95th=[  375],
     | 99.99th=[  375]
    bw (KB  /s): min=  480, max= 3437, per=100.00%, avg=2572.67, stdev=657.65
    lat (msec) : 10=1.44%, 20=59.48%, 50=33.97%, 100=3.34%, 250=1.54%
    lat (msec) : 500=0.23%
  cpu          : usr=0.27%, sys=1.49%, ctx=12114, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12806/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=51224KB, aggrb=2530KB/s, minb=2530KB/s, maxb=2530KB/s, mint=20240msec, maxt=20240msec
```

### READ
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-for-rbd: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [R(1)] [100.0% done] [35520KB/0KB/0KB /s] [8880/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=26902: Fri Jun 17 21:17:43 2016
  read : io=697748KB, bw=34884KB/s, iops=8720, runt= 20002msec
    slat (usec): min=7, max=1529, avg=24.64, stdev=13.22
    clat (usec): min=446, max=4658, avg=1806.73, stdev=323.28
     lat (usec): min=474, max=4682, avg=1831.97, stdev=322.67
    clat percentiles (usec):
     |  1.00th=[  988],  5.00th=[ 1352], 10.00th=[ 1480], 20.00th=[ 1592],
     | 30.00th=[ 1656], 40.00th=[ 1704], 50.00th=[ 1768], 60.00th=[ 1848],
     | 70.00th=[ 1928], 80.00th=[ 2040], 90.00th=[ 2192], 95.00th=[ 2320],
     | 99.00th=[ 2768], 99.50th=[ 3024], 99.90th=[ 3664], 99.95th=[ 3856],
     | 99.99th=[ 4256]
    bw (KB  /s): min=31880, max=38464, per=100.00%, avg=34942.97, stdev=1548.84
    lat (usec) : 500=0.01%, 750=0.32%, 1000=0.71%
    lat (msec) : 2=75.70%, 4=23.24%, 10=0.03%
  cpu          : usr=3.45%, sys=18.20%, ctx=303511, majf=0, minf=46
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=174437/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=697748KB, aggrb=34883KB/s, minb=34883KB/s, maxb=34883KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [35488KB/0KB/0KB /s] [8872/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=27028: Fri Jun 17 21:18:04 2016
  read : io=700312KB, bw=35012KB/s, iops=8753, runt= 20002msec
    slat (usec): min=7, max=1655, avg=24.67, stdev=12.81
    clat (usec): min=411, max=6767, avg=1799.98, stdev=325.29
     lat (usec): min=437, max=6791, avg=1825.25, stdev=324.63
    clat percentiles (usec):
     |  1.00th=[  980],  5.00th=[ 1320], 10.00th=[ 1448], 20.00th=[ 1576],
     | 30.00th=[ 1656], 40.00th=[ 1720], 50.00th=[ 1784], 60.00th=[ 1848],
     | 70.00th=[ 1928], 80.00th=[ 2040], 90.00th=[ 2160], 95.00th=[ 2288],
     | 99.00th=[ 2736], 99.50th=[ 3024], 99.90th=[ 3760], 99.95th=[ 3952],
     | 99.99th=[ 4384]
    bw (KB  /s): min=32488, max=38872, per=100.00%, avg=35050.26, stdev=1657.09
    lat (usec) : 500=0.01%, 750=0.40%, 1000=0.64%
    lat (msec) : 2=75.86%, 4=23.04%, 10=0.05%
  cpu          : usr=3.66%, sys=18.10%, ctx=302485, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=175078/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=700312KB, aggrb=35012KB/s, minb=35012KB/s, maxb=35012KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [35612KB/0KB/0KB /s] [8903/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=27154: Fri Jun 17 21:18:24 2016
  read : io=695252KB, bw=34759KB/s, iops=8689, runt= 20002msec
    slat (usec): min=7, max=1641, avg=24.54, stdev=13.42
    clat (usec): min=455, max=4962, avg=1813.43, stdev=318.34
     lat (usec): min=491, max=4985, avg=1838.58, stdev=317.66
    clat percentiles (usec):
     |  1.00th=[  996],  5.00th=[ 1336], 10.00th=[ 1464], 20.00th=[ 1592],
     | 30.00th=[ 1672], 40.00th=[ 1736], 50.00th=[ 1784], 60.00th=[ 1864],
     | 70.00th=[ 1944], 80.00th=[ 2040], 90.00th=[ 2192], 95.00th=[ 2320],
     | 99.00th=[ 2704], 99.50th=[ 2928], 99.90th=[ 3728], 99.95th=[ 4016],
     | 99.99th=[ 4384]
    bw (KB  /s): min=32168, max=37448, per=100.00%, avg=34814.36, stdev=1192.38
    lat (usec) : 500=0.01%, 750=0.35%, 1000=0.64%
    lat (msec) : 2=74.70%, 4=24.25%, 10=0.05%
  cpu          : usr=3.72%, sys=17.81%, ctx=303098, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=173813/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=695252KB, aggrb=34759KB/s, minb=34759KB/s, maxb=34759KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [33440KB/0KB/0KB /s] [8360/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=27277: Fri Jun 17 21:18:44 2016
  read : io=696620KB, bw=34828KB/s, iops=8706, runt= 20002msec
    slat (usec): min=7, max=1687, avg=24.80, stdev=15.73
    clat (usec): min=410, max=5013, avg=1809.53, stdev=326.36
     lat (usec): min=444, max=5038, avg=1834.94, stdev=325.64
    clat percentiles (usec):
     |  1.00th=[ 1004],  5.00th=[ 1320], 10.00th=[ 1448], 20.00th=[ 1576],
     | 30.00th=[ 1656], 40.00th=[ 1720], 50.00th=[ 1784], 60.00th=[ 1864],
     | 70.00th=[ 1944], 80.00th=[ 2064], 90.00th=[ 2192], 95.00th=[ 2320],
     | 99.00th=[ 2736], 99.50th=[ 2992], 99.90th=[ 3728], 99.95th=[ 3952],
     | 99.99th=[ 4192]
    bw (KB  /s): min=32368, max=39064, per=100.00%, avg=34854.56, stdev=1519.49
    lat (usec) : 500=0.01%, 750=0.37%, 1000=0.62%
    lat (msec) : 2=74.03%, 4=24.93%, 10=0.04%
  cpu          : usr=3.76%, sys=17.98%, ctx=302621, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=174155/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=696620KB, aggrb=34827KB/s, minb=34827KB/s, maxb=34827KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [33904KB/0KB/0KB /s] [8476/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=27400: Fri Jun 17 21:19:05 2016
  read : io=698544KB, bw=34924KB/s, iops=8730, runt= 20002msec
    slat (usec): min=8, max=1699, avg=24.58, stdev=14.55
    clat (usec): min=376, max=6175, avg=1804.72, stdev=325.97
     lat (usec): min=449, max=6199, avg=1829.89, stdev=325.32
    clat percentiles (usec):
     |  1.00th=[  996],  5.00th=[ 1304], 10.00th=[ 1448], 20.00th=[ 1576],
     | 30.00th=[ 1656], 40.00th=[ 1720], 50.00th=[ 1784], 60.00th=[ 1864],
     | 70.00th=[ 1944], 80.00th=[ 2040], 90.00th=[ 2192], 95.00th=[ 2288],
     | 99.00th=[ 2704], 99.50th=[ 2992], 99.90th=[ 3792], 99.95th=[ 3984],
     | 99.99th=[ 4320]
    bw (KB  /s): min=33248, max=38928, per=100.00%, avg=34962.87, stdev=1238.83
    lat (usec) : 500=0.01%, 750=0.34%, 1000=0.67%
    lat (msec) : 2=74.94%, 4=23.99%, 10=0.05%
  cpu          : usr=3.36%, sys=18.24%, ctx=304531, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=174636/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=698544KB, aggrb=34923KB/s, minb=34923KB/s, maxb=34923KB/s, mint=20002msec, maxt=20002msec
```

### READ-WRITE
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [664KB/652KB/0KB /s] [166/163/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=19194: Fri Jun 17 20:56:38 2016
  read : io=11812KB, bw=602725B/s, iops=147, runt= 20068msec
    slat (usec): min=12, max=24594, avg=36.73, stdev=452.10
    clat (usec): min=560, max=534965, avg=51095.97, stdev=34888.81
     lat (usec): min=588, max=534990, avg=51133.34, stdev=34892.37
    clat percentiles (msec):
     |  1.00th=[    9],  5.00th=[   26], 10.00th=[   34], 20.00th=[   35],
     | 30.00th=[   43], 40.00th=[   43], 50.00th=[   50], 60.00th=[   51],
     | 70.00th=[   52], 80.00th=[   59], 90.00th=[   61], 95.00th=[   76],
     | 99.00th=[  251], 99.50th=[  277], 99.90th=[  498], 99.95th=[  537],
     | 99.99th=[  537]
    bw (KB  /s): min=  211, max=  926, per=100.00%, avg=588.87, stdev=127.17
  write: io=11940KB, bw=609256B/s, iops=148, runt= 20068msec
    slat (usec): min=13, max=33426, avg=67.51, stdev=845.95
    clat (msec): min=6, max=551, avg=56.88, stdev=33.80
     lat (msec): min=6, max=551, avg=56.95, stdev=33.82
    clat percentiles (msec):
     |  1.00th=[   23],  5.00th=[   34], 10.00th=[   41], 20.00th=[   43],
     | 30.00th=[   50], 40.00th=[   51], 50.00th=[   51], 60.00th=[   59],
     | 70.00th=[   59], 80.00th=[   67], 90.00th=[   68], 95.00th=[   83],
     | 99.00th=[  217], 99.50th=[  273], 99.90th=[  537], 99.95th=[  545],
     | 99.99th=[  553]
    bw (KB  /s): min=  133, max=  744, per=100.00%, avg=594.26, stdev=129.09
    lat (usec) : 750=0.17%, 1000=0.13%
    lat (msec) : 2=0.12%, 4=0.02%, 10=0.27%, 20=1.30%, 50=40.75%
    lat (msec) : 100=54.38%, 250=1.92%, 500=0.84%, 750=0.10%
  cpu          : usr=0.19%, sys=0.68%, ctx=10802, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=2953/w=2985/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=11812KB, aggrb=588KB/s, minb=588KB/s, maxb=588KB/s, mint=20068msec, maxt=20068msec
  WRITE: io=11940KB, aggrb=594KB/s, minb=594KB/s, maxb=594KB/s, mint=20068msec, maxt=20068msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [584KB/588KB/0KB /s] [146/147/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=19067: Fri Jun 17 20:56:18 2016
  read : io=11908KB, bw=605962B/s, iops=147, runt= 20123msec
    slat (usec): min=13, max=16685, avg=33.91, stdev=305.33
    clat (usec): min=454, max=368939, avg=50167.77, stdev=28393.60
     lat (usec): min=487, max=368970, avg=50202.33, stdev=28390.42
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   26], 10.00th=[   34], 20.00th=[   35],
     | 30.00th=[   43], 40.00th=[   43], 50.00th=[   50], 60.00th=[   51],
     | 70.00th=[   52], 80.00th=[   59], 90.00th=[   61], 95.00th=[   70],
     | 99.00th=[  184], 99.50th=[  245], 99.90th=[  367], 99.95th=[  371],
     | 99.99th=[  371]
    bw (KB  /s): min=  291, max=  798, per=100.00%, avg=593.38, stdev=110.55
  write: io=12056KB, bw=613494B/s, iops=149, runt= 20123msec
    slat (usec): min=13, max=12123, avg=55.69, stdev=317.98
    clat (msec): min=15, max=376, avg=57.10, stdev=29.20
     lat (msec): min=15, max=376, avg=57.15, stdev=29.20
    clat percentiles (msec):
     |  1.00th=[   25],  5.00th=[   34], 10.00th=[   42], 20.00th=[   43],
     | 30.00th=[   50], 40.00th=[   51], 50.00th=[   51], 60.00th=[   59],
     | 70.00th=[   59], 80.00th=[   61], 90.00th=[   68], 95.00th=[   83],
     | 99.00th=[  208], 99.50th=[  241], 99.90th=[  351], 99.95th=[  371],
     | 99.99th=[  375]
    bw (KB  /s): min=  359, max=  792, per=100.00%, avg=599.85, stdev=108.04
    lat (usec) : 500=0.05%, 750=0.17%, 1000=0.12%
    lat (msec) : 2=0.10%, 10=0.15%, 20=0.98%, 50=41.04%, 100=54.40%
    lat (msec) : 250=2.54%, 500=0.45%
  cpu          : usr=0.09%, sys=0.79%, ctx=11057, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=2977/w=3014/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=11908KB, aggrb=591KB/s, minb=591KB/s, maxb=591KB/s, mint=20123msec, maxt=20123msec
  WRITE: io=12056KB, aggrb=599KB/s, minb=599KB/s, maxb=599KB/s, mint=20123msec, maxt=20123msec
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [580KB/572KB/0KB /s] [145/143/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=18944: Fri Jun 17 20:55:58 2016
  read : io=12140KB, bw=620172B/s, iops=151, runt= 20045msec
    slat (usec): min=13, max=28602, avg=40.48, stdev=536.99
    clat (usec): min=438, max=334644, avg=48834.82, stdev=23810.97
     lat (usec): min=469, max=334676, avg=48875.94, stdev=23803.78
    clat percentiles (msec):
     |  1.00th=[   12],  5.00th=[   26], 10.00th=[   34], 20.00th=[   35],
     | 30.00th=[   43], 40.00th=[   43], 50.00th=[   44], 60.00th=[   51],
     | 70.00th=[   51], 80.00th=[   59], 90.00th=[   60], 95.00th=[   69],
     | 99.00th=[  159], 99.50th=[  192], 99.90th=[  318], 99.95th=[  326],
     | 99.99th=[  334]
    bw (KB  /s): min=  309, max=  758, per=99.91%, avg=604.44, stdev=111.46
  write: io=12272KB, bw=626915B/s, iops=153, runt= 20045msec
    slat (usec): min=13, max=7933, avg=48.62, stdev=142.70
    clat (msec): min=4, max=341, avg=56.11, stdev=30.20
     lat (msec): min=4, max=341, avg=56.16, stdev=30.20
    clat percentiles (msec):
     |  1.00th=[   23],  5.00th=[   34], 10.00th=[   35], 20.00th=[   42],
     | 30.00th=[   44], 40.00th=[   50], 50.00th=[   51], 60.00th=[   58],
     | 70.00th=[   59], 80.00th=[   60], 90.00th=[   68], 95.00th=[   77],
     | 99.00th=[  227], 99.50th=[  269], 99.90th=[  326], 99.95th=[  343],
     | 99.99th=[  343]
    bw (KB  /s): min=  365, max=  804, per=100.00%, avg=612.38, stdev=116.97
    lat (usec) : 500=0.03%, 750=0.10%, 1000=0.16%
    lat (msec) : 2=0.13%, 10=0.13%, 20=1.07%, 50=44.11%, 100=51.50%
    lat (msec) : 250=2.31%, 500=0.46%
  cpu          : usr=0.10%, sys=0.80%, ctx=11194, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=3035/w=3068/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=12140KB, aggrb=605KB/s, minb=605KB/s, maxb=605KB/s, mint=20045msec, maxt=20045msec
  WRITE: io=12272KB, aggrb=612KB/s, minb=612KB/s, maxb=612KB/s, mint=20045msec, maxt=20045msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [488KB/524KB/0KB /s] [122/131/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=18818: Fri Jun 17 20:55:37 2016
  read : io=12056KB, bw=611125B/s, iops=149, runt= 20201msec
    slat (usec): min=13, max=30850, avg=41.80, stdev=581.53
    clat (usec): min=443, max=384706, avg=49999.04, stdev=28747.05
     lat (usec): min=500, max=384735, avg=50041.48, stdev=28737.50
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   26], 10.00th=[   34], 20.00th=[   35],
     | 30.00th=[   43], 40.00th=[   43], 50.00th=[   50], 60.00th=[   51],
     | 70.00th=[   52], 80.00th=[   59], 90.00th=[   64], 95.00th=[   76],
     | 99.00th=[  194], 99.50th=[  227], 99.90th=[  367], 99.95th=[  383],
     | 99.99th=[  383]
    bw (KB  /s): min=  281, max=  928, per=100.00%, avg=605.59, stdev=124.04
  write: io=12212KB, bw=619033B/s, iops=151, runt= 20201msec
    slat (usec): min=14, max=8886, avg=51.60, stdev=219.59
    clat (msec): min=6, max=384, avg=56.35, stdev=29.03
     lat (msec): min=6, max=384, avg=56.40, stdev=29.03
    clat percentiles (msec):
     |  1.00th=[   18],  5.00th=[   34], 10.00th=[   35], 20.00th=[   42],
     | 30.00th=[   50], 40.00th=[   50], 50.00th=[   51], 60.00th=[   59],
     | 70.00th=[   59], 80.00th=[   67], 90.00th=[   69], 95.00th=[   84],
     | 99.00th=[  206], 99.50th=[  227], 99.90th=[  367], 99.95th=[  383],
     | 99.99th=[  383]
    bw (KB  /s): min=  355, max=  800, per=100.00%, avg=612.95, stdev=106.90
    lat (usec) : 500=0.07%, 750=0.10%, 1000=0.16%
    lat (msec) : 2=0.08%, 4=0.02%, 10=0.21%, 20=1.48%, 50=42.76%
    lat (msec) : 100=52.30%, 250=2.51%, 500=0.31%
  cpu          : usr=0.13%, sys=0.76%, ctx=11182, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=3014/w=3053/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=12056KB, aggrb=596KB/s, minb=596KB/s, maxb=596KB/s, mint=20201msec, maxt=20201msec
  WRITE: io=12212KB, aggrb=604KB/s, minb=604KB/s, maxb=604KB/s, mint=20201msec, maxt=20201msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [M(1)] [100.0% done] [476KB/472KB/0KB /s] [119/118/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=18692: Fri Jun 17 20:55:17 2016
  read : io=11824KB, bw=604059B/s, iops=147, runt= 20044msec
    slat (usec): min=13, max=29180, avg=38.37, stdev=536.21
    clat (usec): min=450, max=341929, avg=50188.67, stdev=27353.28
     lat (usec): min=478, max=341961, avg=50227.69, stdev=27342.27
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   26], 10.00th=[   34], 20.00th=[   35],
     | 30.00th=[   43], 40.00th=[   43], 50.00th=[   50], 60.00th=[   51],
     | 70.00th=[   52], 80.00th=[   59], 90.00th=[   67], 95.00th=[   76],
     | 99.00th=[  178], 99.50th=[  235], 99.90th=[  343], 99.95th=[  343],
     | 99.99th=[  343]
    bw (KB  /s): min=  301, max=  823, per=100.00%, avg=593.97, stdev=107.59
  write: io=11956KB, bw=610803B/s, iops=149, runt= 20044msec
    slat (usec): min=14, max=8462, avg=51.28, stdev=217.21
    clat (msec): min=12, max=349, avg=57.55, stdev=32.11
     lat (msec): min=12, max=349, avg=57.60, stdev=32.11
    clat percentiles (msec):
     |  1.00th=[   23],  5.00th=[   34], 10.00th=[   35], 20.00th=[   42],
     | 30.00th=[   50], 40.00th=[   51], 50.00th=[   51], 60.00th=[   59],
     | 70.00th=[   59], 80.00th=[   67], 90.00th=[   69], 95.00th=[   84],
     | 99.00th=[  243], 99.50th=[  262], 99.90th=[  343], 99.95th=[  351],
     | 99.99th=[  351]
    bw (KB  /s): min=  257, max=  800, per=100.00%, avg=599.87, stdev=109.01
    lat (usec) : 500=0.03%, 750=0.10%, 1000=0.15%
    lat (msec) : 2=0.13%, 4=0.02%, 10=0.15%, 20=1.24%, 50=41.77%
    lat (msec) : 100=53.00%, 250=2.84%, 500=0.56%
  cpu          : usr=0.20%, sys=0.67%, ctx=11054, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=2956/w=2989/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=11824KB, aggrb=589KB/s, minb=589KB/s, maxb=589KB/s, mint=20044msec, maxt=20044msec
  WRITE: io=11956KB, aggrb=596KB/s, minb=596KB/s, maxb=596KB/s, mint=20044msec, maxt=20044msec
```

### RAND-WRITE
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/3012KB/0KB /s] [0/753/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=22217: Fri Jun 17 21:04:47 2016
  write: io=30280KB, bw=1512.9KB/s, iops=378, runt= 20015msec
    slat (usec): min=9, max=1053.2K, avg=181.10, stdev=12105.42
    clat (msec): min=2, max=2771, avg=42.11, stdev=189.13
     lat (msec): min=2, max=2771, avg=42.30, stdev=189.50
    clat percentiles (msec):
     |  1.00th=[    4],  5.00th=[    7], 10.00th=[    9], 20.00th=[   10],
     | 30.00th=[   11], 40.00th=[   13], 50.00th=[   14], 60.00th=[   15],
     | 70.00th=[   17], 80.00th=[   18], 90.00th=[   25], 95.00th=[   59],
     | 99.00th=[ 1074], 99.50th=[ 1385], 99.90th=[ 2704], 99.95th=[ 2737],
     | 99.99th=[ 2769]
    bw (KB  /s): min=    3, max= 4749, per=100.00%, avg=2017.64, stdev=1786.89
    lat (msec) : 4=1.93%, 10=21.31%, 20=64.50%, 50=6.67%, 100=1.68%
    lat (msec) : 250=1.28%, 500=0.63%, 750=0.67%, 1000=0.17%, 2000=0.95%
    lat (msec) : >=2000=0.20%
  cpu          : usr=0.19%, sys=0.90%, ctx=11843, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=7570/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=30280KB, aggrb=1512KB/s, minb=1512KB/s, maxb=1512KB/s, mint=20015msec, maxt=20015msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/120KB/0KB /s] [0/30/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=22088: Fri Jun 17 21:04:27 2016
  write: io=32188KB, bw=1540.2KB/s, iops=385, runt= 20899msec
    slat (usec): min=9, max=2342.5K, avg=337.16, stdev=26115.60
    clat (msec): min=2, max=2514, avg=41.12, stdev=181.39
     lat (msec): min=2, max=2514, avg=41.46, stdev=183.25
    clat percentiles (msec):
     |  1.00th=[    4],  5.00th=[    6], 10.00th=[    9], 20.00th=[   10],
     | 30.00th=[   11], 40.00th=[   13], 50.00th=[   14], 60.00th=[   16],
     | 70.00th=[   17], 80.00th=[   18], 90.00th=[   26], 95.00th=[   72],
     | 99.00th=[  979], 99.50th=[ 1467], 99.90th=[ 2409], 99.95th=[ 2474],
     | 99.99th=[ 2507]
    bw (KB  /s): min=    5, max= 4904, per=100.00%, avg=2027.87, stdev=1883.33
    lat (msec) : 4=2.00%, 10=22.01%, 20=63.51%, 50=6.06%, 100=2.41%
    lat (msec) : 250=1.47%, 500=0.87%, 750=0.31%, 1000=0.37%, 2000=0.73%
    lat (msec) : >=2000=0.25%
  cpu          : usr=0.21%, sys=0.92%, ctx=12498, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=8047/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=32188KB, aggrb=1540KB/s, minb=1540KB/s, maxb=1540KB/s, mint=20899msec, maxt=20899msec
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [0.5% done] [0KB/0KB/0KB /s] [0/0/0 iops] [eta 01h:21m:03s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=21901: Fri Jun 17 21:04:06 2016
  write: io=22604KB, bw=1075.1KB/s, iops=268, runt= 21009msec
    slat (usec): min=9, max=570701, avg=141.96, stdev=7595.59
    clat (msec): min=2, max=2396, avg=59.33, stdev=230.62
     lat (msec): min=2, max=2396, avg=59.47, stdev=230.72
    clat percentiles (msec):
     |  1.00th=[    4],  5.00th=[    6], 10.00th=[    8], 20.00th=[   10],
     | 30.00th=[   11], 40.00th=[   13], 50.00th=[   14], 60.00th=[   16],
     | 70.00th=[   17], 80.00th=[   18], 90.00th=[   33], 95.00th=[  172],
     | 99.00th=[ 1303], 99.50th=[ 1565], 99.90th=[ 2376], 99.95th=[ 2376],
     | 99.99th=[ 2409]
    bw (KB  /s): min=    3, max= 4928, per=100.00%, avg=1555.59, stdev=1754.72
    lat (msec) : 4=2.12%, 10=22.51%, 20=61.03%, 50=6.78%, 100=1.45%
    lat (msec) : 250=1.82%, 500=0.94%, 750=0.64%, 1000=0.97%, 2000=1.31%
    lat (msec) : >=2000=0.42%
  cpu          : usr=0.10%, sys=0.69%, ctx=8335, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=5651/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=22604KB, aggrb=1075KB/s, minb=1075KB/s, maxb=1075KB/s, mint=21009msec, maxt=21009msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/4744KB/0KB /s] [0/1186/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=21777: Fri Jun 17 21:03:44 2016
  write: io=30568KB, bw=1516.3KB/s, iops=379, runt= 20160msec
    slat (usec): min=12, max=17446, avg=42.97, stdev=206.68
    clat (msec): min=2, max=2455, avg=42.14, stdev=177.45
     lat (msec): min=2, max=2455, avg=42.18, stdev=177.45
    clat percentiles (msec):
     |  1.00th=[    4],  5.00th=[    7], 10.00th=[    9], 20.00th=[   10],
     | 30.00th=[   11], 40.00th=[   13], 50.00th=[   14], 60.00th=[   16],
     | 70.00th=[   17], 80.00th=[   18], 90.00th=[   29], 95.00th=[   91],
     | 99.00th=[  881], 99.50th=[ 1598], 99.90th=[ 2147], 99.95th=[ 2409],
     | 99.99th=[ 2442]
    bw (KB  /s): min=   18, max= 5016, per=100.00%, avg=1890.48, stdev=1867.73
    lat (msec) : 4=1.90%, 10=22.64%, 20=62.26%, 50=6.12%, 100=2.20%
    lat (msec) : 250=2.19%, 500=1.13%, 750=0.39%, 1000=0.27%, 2000=0.65%
    lat (msec) : >=2000=0.25%
  cpu          : usr=0.33%, sys=0.84%, ctx=11606, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=7642/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=30568KB, aggrb=1516KB/s, minb=1516KB/s, maxb=1516KB/s, mint=20160msec, maxt=20160msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-for-rbd: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/4692KB/0KB /s] [0/1173/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=21636: Fri Jun 17 21:03:24 2016
  write: io=25940KB, bw=1288.5KB/s, iops=322, runt= 20133msec
    slat (usec): min=13, max=51814, avg=62.66, stdev=719.61
    clat (msec): min=2, max=2452, avg=49.58, stdev=193.26
     lat (msec): min=2, max=2453, avg=49.65, stdev=193.27
    clat percentiles (msec):
     |  1.00th=[    4],  5.00th=[    6], 10.00th=[    8], 20.00th=[   10],
     | 30.00th=[   11], 40.00th=[   13], 50.00th=[   14], 60.00th=[   16],
     | 70.00th=[   17], 80.00th=[   18], 90.00th=[   31], 95.00th=[  127],
     | 99.00th=[ 1139], 99.50th=[ 1385], 99.90th=[ 2409], 99.95th=[ 2442],
     | 99.99th=[ 2442]
    bw (KB  /s): min=   36, max= 4878, per=100.00%, avg=1704.77, stdev=1652.90
    lat (msec) : 4=2.17%, 10=22.44%, 20=61.36%, 50=6.65%, 100=2.00%
    lat (msec) : 250=1.45%, 500=1.05%, 750=1.25%, 1000=0.35%, 2000=1.05%
    lat (msec) : >=2000=0.23%
  cpu          : usr=0.13%, sys=1.11%, ctx=10798, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=6485/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=25940KB, aggrb=1288KB/s, minb=1288KB/s, maxb=1288KB/s, mint=20133msec, maxt=20133msec
```

### RAND-READ
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [7780KB/0KB/0KB /s] [1945/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=25109: Fri Jun 17 21:12:45 2016
  read : io=159104KB, bw=7949.7KB/s, iops=1987, runt= 20014msec
    slat (usec): min=9, max=856, avg=24.70, stdev= 7.10
    clat (usec): min=353, max=41190, avg=8021.67, stdev=13616.62
     lat (usec): min=379, max=41213, avg=8046.99, stdev=13616.08
    clat percentiles (usec):
     |  1.00th=[  470],  5.00th=[  540], 10.00th=[  612], 20.00th=[  788],
     | 30.00th=[  956], 40.00th=[ 1144], 50.00th=[ 1368], 60.00th=[ 1864],
     | 70.00th=[ 2896], 80.00th=[ 5536], 90.00th=[36608], 95.00th=[38144],
     | 99.00th=[39680], 99.50th=[39680], 99.90th=[40192], 99.95th=[40704],
     | 99.99th=[41216]
    bw (KB  /s): min= 6123, max=11293, per=99.99%, avg=7948.03, stdev=1201.89
    lat (usec) : 500=2.18%, 750=15.38%, 1000=14.94%
    lat (msec) : 2=29.29%, 4=14.51%, 10=5.48%, 20=0.05%, 50=18.18%
  cpu          : usr=0.88%, sys=4.09%, ctx=68238, majf=0, minf=49
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=39776/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=159104KB, aggrb=7949KB/s, minb=7949KB/s, maxb=7949KB/s, mint=20014msec, maxt=20014msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [7664KB/0KB/0KB /s] [1916/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=24986: Fri Jun 17 21:12:25 2016
  read : io=161540KB, bw=8075.4KB/s, iops=2018, runt= 20004msec
    slat (usec): min=12, max=244, avg=24.80, stdev= 5.86
    clat (usec): min=382, max=40930, avg=7896.40, stdev=13476.73
     lat (usec): min=410, max=40954, avg=7921.82, stdev=13476.20
    clat percentiles (usec):
     |  1.00th=[  470],  5.00th=[  540], 10.00th=[  612], 20.00th=[  788],
     | 30.00th=[  964], 40.00th=[ 1160], 50.00th=[ 1384], 60.00th=[ 1864],
     | 70.00th=[ 2832], 80.00th=[ 5344], 90.00th=[36608], 95.00th=[37632],
     | 99.00th=[39168], 99.50th=[39680], 99.90th=[40192], 99.95th=[40704],
     | 99.99th=[40704]
    bw (KB  /s): min= 5752, max=10135, per=100.00%, avg=8085.10, stdev=1099.64
    lat (usec) : 500=2.16%, 750=15.37%, 1000=14.38%
    lat (msec) : 2=29.82%, 4=14.94%, 10=5.36%, 20=0.15%, 50=17.83%
  cpu          : usr=0.89%, sys=4.18%, ctx=69257, majf=0, minf=49
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=40385/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=161540KB, aggrb=8075KB/s, minb=8075KB/s, maxb=8075KB/s, mint=20004msec, maxt=20004msec
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [8128KB/0KB/0KB /s] [2032/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=24860: Fri Jun 17 21:12:04 2016
  read : io=163664KB, bw=8167.7KB/s, iops=2041, runt= 20038msec
    slat (usec): min=12, max=848, avg=24.76, stdev= 7.10
    clat (usec): min=354, max=76042, avg=7806.03, stdev=13451.09
     lat (usec): min=394, max=76068, avg=7831.41, stdev=13450.64
    clat percentiles (usec):
     |  1.00th=[  474],  5.00th=[  540], 10.00th=[  612], 20.00th=[  788],
     | 30.00th=[  964], 40.00th=[ 1144], 50.00th=[ 1368], 60.00th=[ 1832],
     | 70.00th=[ 2768], 80.00th=[ 5088], 90.00th=[36608], 95.00th=[38144],
     | 99.00th=[39168], 99.50th=[39680], 99.90th=[40192], 99.95th=[40704],
     | 99.99th=[41216]
    bw (KB  /s): min= 6007, max=10581, per=100.00%, avg=8187.87, stdev=1124.38
    lat (usec) : 500=2.15%, 750=15.41%, 1000=14.88%
    lat (msec) : 2=29.73%, 4=15.06%, 10=5.13%, 20=0.04%, 50=17.59%
    lat (msec) : 100=0.01%
  cpu          : usr=0.96%, sys=4.16%, ctx=69829, majf=0, minf=49
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=40916/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=163664KB, aggrb=8167KB/s, minb=8167KB/s, maxb=8167KB/s, mint=20038msec, maxt=20038msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [r(1)] [100.0% done] [6996KB/0KB/0KB /s] [1749/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=24737: Fri Jun 17 21:11:44 2016
  read : io=164144KB, bw=8195.8KB/s, iops=2048, runt= 20028msec
    slat (usec): min=8, max=858, avg=24.82, stdev= 8.13
    clat (usec): min=358, max=41831, avg=7779.94, stdev=13397.33
     lat (usec): min=409, max=41855, avg=7805.38, stdev=13396.86
    clat percentiles (usec):
     |  1.00th=[  470],  5.00th=[  540], 10.00th=[  604], 20.00th=[  788],
     | 30.00th=[  964], 40.00th=[ 1160], 50.00th=[ 1384], 60.00th=[ 1848],
     | 70.00th=[ 2800], 80.00th=[ 5152], 90.00th=[36608], 95.00th=[37632],
     | 99.00th=[39168], 99.50th=[39680], 99.90th=[40192], 99.95th=[40704],
     | 99.99th=[41728]
    bw (KB  /s): min= 5600, max=11128, per=100.00%, avg=8195.26, stdev=1023.95
    lat (usec) : 500=2.36%, 750=15.39%, 1000=14.40%
    lat (msec) : 2=29.85%, 4=14.94%, 10=5.46%, 20=0.12%, 50=17.47%
  cpu          : usr=0.74%, sys=4.39%, ctx=70581, majf=0, minf=50
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=41036/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=164144KB, aggrb=8195KB/s, minb=8195KB/s, maxb=8195KB/s, mint=20028msec, maxt=20028msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-for-rbd: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [r(1)] [100.0% done] [7380KB/0KB/0KB /s] [1845/0/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=24609: Fri Jun 17 21:11:23 2016
  read : io=159820KB, bw=7987.5KB/s, iops=1996, runt= 20009msec
    slat (usec): min=8, max=861, avg=24.74, stdev= 7.79
    clat (usec): min=349, max=118003, avg=7983.72, stdev=13543.99
     lat (usec): min=376, max=118019, avg=8009.07, stdev=13543.45
    clat percentiles (usec):
     |  1.00th=[  474],  5.00th=[  540], 10.00th=[  620], 20.00th=[  804],
     | 30.00th=[  972], 40.00th=[ 1160], 50.00th=[ 1400], 60.00th=[ 1896],
     | 70.00th=[ 2928], 80.00th=[ 5472], 90.00th=[36608], 95.00th=[38144],
     | 99.00th=[39168], 99.50th=[39680], 99.90th=[40192], 99.95th=[40704],
     | 99.99th=[40704]
    bw (KB  /s): min= 6293, max=11424, per=100.00%, avg=7999.72, stdev=1131.34
    lat (usec) : 500=2.00%, 750=14.90%, 1000=14.66%
    lat (msec) : 2=29.75%, 4=14.96%, 10=5.55%, 20=0.15%, 50=18.04%
    lat (msec) : 250=0.01%
  cpu          : usr=1.19%, sys=3.81%, ctx=69186, majf=0, minf=49
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=39955/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=159820KB, aggrb=7987KB/s, minb=7987KB/s, maxb=7987KB/s, mint=20009msec, maxt=20009msec
```
### RAND-READ-WRITE
------------------------ Test 1 ------------------------
```
libaio-for-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [84KB/152KB/0KB /s] [21/38/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=30662: Fri Jun 17 21:28:08 2016
  read : io=29260KB, bw=1415.2KB/s, iops=353, runt= 20676msec
    slat (usec): min=7, max=820629, avg=139.96, stdev=9594.58
    clat (usec): min=5, max=1302.6K, avg=2337.96, stdev=20990.59
     lat (usec): min=416, max=1302.7K, avg=2478.53, stdev=23068.00
    clat percentiles (usec):
     |  1.00th=[  446],  5.00th=[  486], 10.00th=[  510], 20.00th=[  532],
     | 30.00th=[  556], 40.00th=[  572], 50.00th=[  604], 60.00th=[  660],
     | 70.00th=[  820], 80.00th=[ 1128], 90.00th=[ 4128], 95.00th=[ 7392],
     | 99.00th=[24192], 99.50th=[34048], 99.90th=[173056], 99.95th=[234496],
     | 99.99th=[1302528]
    bw (KB  /s): min=    3, max= 4560, per=100.00%, avg=1882.80, stdev=1486.89
  write: io=28944KB, bw=1399.1KB/s, iops=349, runt= 20676msec
    slat (usec): min=8, max=33824, avg=46.87, stdev=400.42
    clat (msec): min=2, max=2619, avg=43.09, stdev=182.57
     lat (msec): min=2, max=2619, avg=43.13, stdev=182.57
    clat percentiles (msec):
     |  1.00th=[    4],  5.00th=[    6], 10.00th=[    8], 20.00th=[   10],
     | 30.00th=[   11], 40.00th=[   12], 50.00th=[   14], 60.00th=[   15],
     | 70.00th=[   17], 80.00th=[   18], 90.00th=[   34], 95.00th=[  118],
     | 99.00th=[ 1090], 99.50th=[ 1565], 99.90th=[ 2474], 99.95th=[ 2606],
     | 99.99th=[ 2606]
    bw (KB  /s): min=    6, max= 4168, per=100.00%, avg=1794.52, stdev=1444.57
    lat (usec) : 10=0.01%, 500=3.82%, 750=29.72%, 1000=4.91%
    lat (msec) : 2=4.49%, 4=3.42%, 10=15.22%, 20=30.98%, 50=3.37%
    lat (msec) : 100=1.29%, 250=1.48%, 500=0.54%, 750=0.05%, 1000=0.16%
    lat (msec) : 2000=0.49%, >=2000=0.06%
  cpu          : usr=0.53%, sys=1.42%, ctx=25253, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=7315/w=7236/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=29260KB, aggrb=1415KB/s, minb=1415KB/s, maxb=1415KB/s, mint=20676msec, maxt=20676msec
  WRITE: io=28944KB, aggrb=1399KB/s, minb=1399KB/s, maxb=1399KB/s, mint=20676msec, maxt=20676msec
```

------------------------ Test 2 ------------------------
```
libaio-for-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [204KB/172KB/0KB /s] [51/43/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=30536: Fri Jun 17 21:27:47 2016
  read : io=20004KB, bw=994759B/s, iops=242, runt= 20592msec
    slat (usec): min=12, max=166487, avg=63.05, stdev=2358.29
    clat (usec): min=2, max=2126.3K, avg=4082.63, stdev=49535.20
     lat (usec): min=425, max=2126.3K, avg=4146.30, stdev=49588.22
    clat percentiles (usec):
     |  1.00th=[  446],  5.00th=[  486], 10.00th=[  506], 20.00th=[  532],
     | 30.00th=[  556], 40.00th=[  580], 50.00th=[  604], 60.00th=[  652],
     | 70.00th=[  804], 80.00th=[ 1080], 90.00th=[ 4192], 95.00th=[ 8384],
     | 99.00th=[29312], 99.50th=[39168], 99.90th=[888832], 99.95th=[1171456],
     | 99.99th=[2113536]
    bw (KB  /s): min=    5, max= 4432, per=100.00%, avg=1340.15, stdev=1282.61
  write: io=20128KB, bw=977.48KB/s, iops=244, runt= 20592msec
    slat (usec): min=13, max=8785, avg=45.02, stdev=139.22
    clat (msec): min=2, max=2398, avg=61.16, stdev=224.18
     lat (msec): min=2, max=2398, avg=61.20, stdev=224.17
    clat percentiles (msec):
     |  1.00th=[    3],  5.00th=[    6], 10.00th=[    8], 20.00th=[    9],
     | 30.00th=[   11], 40.00th=[   12], 50.00th=[   14], 60.00th=[   15],
     | 70.00th=[   17], 80.00th=[   18], 90.00th=[   48], 95.00th=[  247],
     | 99.00th=[ 1205], 99.50th=[ 1598], 99.90th=[ 2376], 99.95th=[ 2376],
     | 99.99th=[ 2409]
    bw (KB  /s): min=   10, max= 4384, per=100.00%, avg=1356.12, stdev=1310.47
    lat (usec) : 4=0.01%, 50=0.01%, 500=4.00%, 750=29.43%, 1000=5.13%
    lat (msec) : 2=4.17%, 4=3.42%, 10=15.05%, 20=29.06%, 50=4.74%
    lat (msec) : 100=1.46%, 250=0.91%, 500=0.68%, 750=0.64%, 1000=0.37%
    lat (msec) : 2000=0.77%, >=2000=0.16%
  cpu          : usr=0.28%, sys=1.08%, ctx=17696, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=5001/w=5032/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=20004KB, aggrb=971KB/s, minb=971KB/s, maxb=971KB/s, mint=20592msec, maxt=20592msec
  WRITE: io=20128KB, aggrb=977KB/s, minb=977KB/s, maxb=977KB/s, mint=20592msec, maxt=20592msec
```

------------------------ Test 3 ------------------------
```
libaio-for-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [512KB/472KB/0KB /s] [128/118/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=30413: Fri Jun 17 21:27:26 2016
  read : io=18432KB, bw=942728B/s, iops=230, runt= 20021msec
    slat (usec): min=12, max=209550, avg=73.13, stdev=3086.56
    clat (usec): min=193, max=1339.9K, avg=4622.17, stdev=53039.82
     lat (usec): min=414, max=1339.9K, avg=4695.95, stdev=53125.78
    clat percentiles (usec):
     |  1.00th=[  450],  5.00th=[  490], 10.00th=[  516], 20.00th=[  540],
     | 30.00th=[  564], 40.00th=[  588], 50.00th=[  620], 60.00th=[  692],
     | 70.00th=[  884], 80.00th=[ 1240], 90.00th=[ 4960], 95.00th=[ 8640],
     | 99.00th=[27008], 99.50th=[35584], 99.90th=[1236992], 99.95th=[1269760],
     | 99.99th=[1335296]
    bw (KB  /s): min=   38, max= 4280, per=100.00%, avg=1326.05, stdev=1375.51
  write: io=18464KB, bw=944365B/s, iops=230, runt= 20021msec
    slat (usec): min=13, max=24121, avg=50.40, stdev=387.56
    clat (msec): min=2, max=1818, avg=64.57, stdev=225.57
     lat (msec): min=2, max=1819, avg=64.62, stdev=225.58
    clat percentiles (msec):
     |  1.00th=[    3],  5.00th=[    5], 10.00th=[    8], 20.00th=[    9],
     | 30.00th=[   11], 40.00th=[   12], 50.00th=[   14], 60.00th=[   15],
     | 70.00th=[   17], 80.00th=[   18], 90.00th=[   41], 95.00th=[  281],
     | 99.00th=[ 1303], 99.50th=[ 1369], 99.90th=[ 1795], 99.95th=[ 1795],
     | 99.99th=[ 1827]
    bw (KB  /s): min=   34, max= 4488, per=100.00%, avg=1331.23, stdev=1379.78
    lat (usec) : 250=0.01%, 500=3.46%, 750=28.65%, 1000=5.01%
    lat (msec) : 2=5.07%, 4=3.28%, 10=16.93%, 20=28.76%, 50=4.30%
    lat (msec) : 100=0.99%, 250=0.78%, 500=0.49%, 750=0.56%, 1000=0.44%
    lat (msec) : 2000=1.25%
  cpu          : usr=0.17%, sys=1.11%, ctx=16060, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=4608/w=4616/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=18432KB, aggrb=920KB/s, minb=920KB/s, maxb=920KB/s, mint=20021msec, maxt=20021msec
  WRITE: io=18464KB, aggrb=922KB/s, minb=922KB/s, maxb=922KB/s, mint=20021msec, maxt=20021msec
```

------------------------ Test 4 ------------------------
```
libaio-for-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [1816KB/1908KB/0KB /s] [454/477/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=30287: Fri Jun 17 21:27:06 2016
  read : io=19232KB, bw=973339B/s, iops=237, runt= 20233msec
    slat (usec): min=7, max=29842, avg=37.32, stdev=494.22
    clat (usec): min=39, max=1365.7K, avg=3392.44, stdev=34137.80
     lat (usec): min=424, max=1365.7K, avg=3430.38, stdev=34140.73
    clat percentiles (usec):
     |  1.00th=[  454],  5.00th=[  490], 10.00th=[  516], 20.00th=[  540],
     | 30.00th=[  556], 40.00th=[  580], 50.00th=[  604], 60.00th=[  652],
     | 70.00th=[  812], 80.00th=[ 1128], 90.00th=[ 4256], 95.00th=[ 8640],
     | 99.00th=[30080], 99.50th=[37120], 99.90th=[602112], 99.95th=[774144],
     | 99.99th=[1368064]
    bw (KB  /s): min=   36, max= 3416, per=100.00%, avg=1239.21, stdev=1129.68
  write: io=19328KB, bw=978197B/s, iops=238, runt= 20233msec
    slat (usec): min=8, max=604776, avg=180.83, stdev=8749.76
    clat (msec): min=2, max=1697, avg=63.17, stdev=195.30
     lat (msec): min=2, max=1697, avg=63.35, stdev=195.47
    clat percentiles (msec):
     |  1.00th=[    3],  5.00th=[    5], 10.00th=[    7], 20.00th=[    9],
     | 30.00th=[   11], 40.00th=[   12], 50.00th=[   14], 60.00th=[   16],
     | 70.00th=[   17], 80.00th=[   20], 90.00th=[   80], 95.00th=[  322],
     | 99.00th=[ 1156], 99.50th=[ 1369], 99.90th=[ 1647], 99.95th=[ 1647],
     | 99.99th=[ 1696]
    bw (KB  /s): min=    3, max= 3514, per=100.00%, avg=1196.03, stdev=1102.81
    lat (usec) : 50=0.01%, 250=0.01%, 500=3.31%, 750=30.15%, 1000=4.75%
    lat (msec) : 2=4.65%, 4=3.53%, 10=16.38%, 20=26.32%, 50=4.56%
    lat (msec) : 100=1.58%, 250=1.73%, 500=1.01%, 750=0.65%, 1000=0.59%
    lat (msec) : 2000=0.78%
  cpu          : usr=0.30%, sys=1.04%, ctx=16884, majf=0, minf=33
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=4808/w=4832/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=19232KB, aggrb=950KB/s, minb=950KB/s, maxb=950KB/s, mint=20233msec, maxt=20233msec
  WRITE: io=19328KB, aggrb=955KB/s, minb=955KB/s, maxb=955KB/s, mint=20233msec, maxt=20233msec
```

------------------------ Test 5 ------------------------
```
libaio-for-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-for-rbd: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [m(1)] [100.0% done] [2932KB/2792KB/0KB /s] [733/698/0 iops] [eta 00m:00s]
libaio-for-rbd: (groupid=0, jobs=1): err= 0: pid=30160: Fri Jun 17 21:26:45 2016
  read : io=22104KB, bw=1103.7KB/s, iops=275, runt= 20028msec
    slat (usec): min=7, max=37887, avg=34.18, stdev=509.32
    clat (usec): min=33, max=2192.3K, avg=2834.62, stdev=33233.43
     lat (usec): min=432, max=2192.4K, avg=2869.43, stdev=33236.74
    clat percentiles (usec):
     |  1.00th=[  454],  5.00th=[  494], 10.00th=[  516], 20.00th=[  548],
     | 30.00th=[  564], 40.00th=[  588], 50.00th=[  612], 60.00th=[  668],
     | 70.00th=[  804], 80.00th=[ 1096], 90.00th=[ 4192], 95.00th=[ 8032],
     | 99.00th=[28800], 99.50th=[37120], 99.90th=[276480], 99.95th=[610304],
     | 99.99th=[2179072]
    bw (KB  /s): min=   66, max= 3049, per=100.00%, avg=1292.72, stdev=936.50
  write: io=22100KB, bw=1103.5KB/s, iops=275, runt= 20028msec
    slat (usec): min=8, max=1261.2K, avg=300.05, stdev=17115.21
    clat (msec): min=2, max=2767, avg=54.81, stdev=201.27
     lat (msec): min=2, max=2767, avg=55.12, stdev=201.97
    clat percentiles (msec):
     |  1.00th=[    4],  5.00th=[    5], 10.00th=[    7], 20.00th=[    9],
     | 30.00th=[   11], 40.00th=[   12], 50.00th=[   13], 60.00th=[   15],
     | 70.00th=[   16], 80.00th=[   18], 90.00th=[   59], 95.00th=[  277],
     | 99.00th=[  799], 99.50th=[ 2114], 99.90th=[ 2343], 99.95th=[ 2343],
     | 99.99th=[ 2769]
    bw (KB  /s): min=    3, max= 2930, per=100.00%, avg=1255.07, stdev=966.38
    lat (usec) : 50=0.01%, 500=3.11%, 750=30.45%, 1000=4.75%
    lat (msec) : 2=4.51%, 4=3.64%, 10=16.74%, 20=28.44%, 50=2.98%
    lat (msec) : 100=0.73%, 250=1.74%, 500=1.96%, 750=0.34%, 1000=0.20%
    lat (msec) : 2000=0.12%, >=2000=0.28%
  cpu          : usr=0.32%, sys=1.22%, ctx=19182, majf=0, minf=32
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=99.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=5526/w=5525/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=22104KB, aggrb=1103KB/s, minb=1103KB/s, maxb=1103KB/s, mint=20028msec, maxt=20028msec
  WRITE: io=22100KB, aggrb=1103KB/s, minb=1103KB/s, maxb=1103KB/s, mint=20028msec, maxt=20028msec
```

# Throughput Write
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [45.1% done] [0KB/0KB/0KB /s] [0/0/0 iops] [eta 01m:41s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=1366: Fri Jun 17 21:37:27 2016
  write: io=2352.0MB, bw=29101KB/s, iops=7, runt= 82762msec
    slat (usec): min=618, max=10603K, avg=46225.42, stdev=592806.28
    clat (msec): min=78, max=28830, avg=2166.79, stdev=4734.14
     lat (msec): min=79, max=28831, avg=2213.02, stdev=4761.89
    clat percentiles (msec):
     |  1.00th=[   99],  5.00th=[  157], 10.00th=[  192], 20.00th=[  235],
     | 30.00th=[  338], 40.00th=[  445], 50.00th=[  578], 60.00th=[  783],
     | 70.00th=[ 1057], 80.00th=[ 1565], 90.00th=[ 4883], 95.00th=[12387],
     | 99.00th=[16712], 99.50th=[16712], 99.90th=[16712], 99.95th=[16712],
     | 99.99th=[16712]
    bw (KB  /s): min=  180, max=178793, per=100.00%, avg=73643.42, stdev=53480.18
    lat (msec) : 100=1.02%, 250=20.58%, 500=23.47%, 750=12.76%, 1000=9.86%
    lat (msec) : 2000=13.78%, >=2000=18.54%
  cpu          : usr=0.28%, sys=0.57%, ctx=980, majf=0, minf=31
  IO depths    : 1=0.2%, 2=0.3%, 4=0.7%, 8=1.4%, 16=97.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.8%, 8=0.0%, 16=0.2%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=588/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=2352.0MB, aggrb=29100KB/s, minb=29100KB/s, maxb=29100KB/s, mint=82762msec, maxt=82762msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [9.2% done] [0KB/4096KB/0KB /s] [0/1/0 iops] [eta 10m:22s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=978: Fri Jun 17 21:36:04 2016
  write: io=536576KB, bw=8656.1KB/s, iops=2, runt= 61982msec
    slat (usec): min=614, max=15238K, avg=260607.33, stdev=1750804.74
    clat (msec): min=72, max=25309, avg=7307.28, stdev=9520.31
     lat (msec): min=74, max=25314, avg=7567.89, stdev=9532.43
    clat percentiles (msec):
     |  1.00th=[   74],  5.00th=[   90], 10.00th=[  116], 20.00th=[  221],
     | 30.00th=[  289], 40.00th=[  383], 50.00th=[  494], 60.00th=[ 1680],
     | 70.00th=[15139], 80.00th=[16712], 90.00th=[16712], 95.00th=[16712],
     | 99.00th=[16712], 99.50th=[16712], 99.90th=[16712], 99.95th=[16712],
     | 99.99th=[16712]
    bw (KB  /s): min=  268, max=175761, per=100.00%, avg=47197.75, stdev=58754.99
    lat (msec) : 100=7.63%, 250=19.85%, 500=23.66%, 750=7.63%, 1000=0.76%
    lat (msec) : 2000=0.76%, >=2000=39.69%
  cpu          : usr=0.07%, sys=0.18%, ctx=191, majf=0, minf=31
  IO depths    : 1=0.8%, 2=1.5%, 4=3.1%, 8=6.1%, 16=88.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.1%, 8=0.0%, 16=0.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=131/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=536576KB, aggrb=8656KB/s, minb=8656KB/s, maxb=8656KB/s, mint=61982msec, maxt=61982msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [45.5% done] [0KB/0KB/0KB /s] [0/0/0 iops] [eta 01m:42s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=439: Fri Jun 17 21:35:02 2016
  write: io=2364.0MB, bw=28596KB/s, iops=6, runt= 84653msec
    slat (usec): min=624, max=16571K, avg=45312.03, stdev=708020.77
    clat (msec): min=84, max=29664, avg=2204.65, stdev=5193.15
     lat (msec): min=86, max=29666, avg=2249.96, stdev=5244.63
    clat percentiles (msec):
     |  1.00th=[  100],  5.00th=[  141], 10.00th=[  198], 20.00th=[  253],
     | 30.00th=[  355], 40.00th=[  453], 50.00th=[  594], 60.00th=[  840],
     | 70.00th=[ 1221], 80.00th=[ 2073], 90.00th=[ 3392], 95.00th=[16712],
     | 99.00th=[16712], 99.50th=[16712], 99.90th=[16712], 99.95th=[16712],
     | 99.99th=[16712]
    bw (KB  /s): min=  167, max=173176, per=100.00%, avg=72987.96, stdev=52923.74
    lat (msec) : 100=1.02%, 250=18.95%, 500=23.35%, 750=13.20%, 1000=7.95%
    lat (msec) : 2000=14.72%, >=2000=20.81%
  cpu          : usr=0.35%, sys=0.47%, ctx=1028, majf=0, minf=31
  IO depths    : 1=0.2%, 2=0.3%, 4=0.7%, 8=1.4%, 16=97.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.8%, 8=0.0%, 16=0.2%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=591/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=2364.0MB, aggrb=28595KB/s, minb=28595KB/s, maxb=28595KB/s, mint=84653msec, maxt=84653msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [W(1)] [6.0% done] [0KB/65536KB/0KB /s] [0/16/0 iops] [eta 16m:06s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=32532: Fri Jun 17 21:33:37 2016
  write: io=372736KB, bw=6077.4KB/s, iops=1, runt= 61332msec
    slat (usec): min=619, max=7246.1K, avg=224886.09, stdev=1109384.25
    clat (msec): min=73, max=56400, avg=10541.91, stdev=14525.67
     lat (msec): min=73, max=56401, avg=10766.79, stdev=14623.82
    clat percentiles (msec):
     |  1.00th=[   74],  5.00th=[   91], 10.00th=[  104], 20.00th=[  143],
     | 30.00th=[  510], 40.00th=[ 1434], 50.00th=[ 1647], 60.00th=[ 4752],
     | 70.00th=[13173], 80.00th=[16712], 90.00th=[16712], 95.00th=[16712],
     | 99.00th=[16712], 99.50th=[16712], 99.90th=[16712], 99.95th=[16712],
     | 99.99th=[16712]
    bw (KB  /s): min=  565, max=45166, per=100.00%, avg=8105.52, stdev=9941.36
    lat (msec) : 100=9.89%, 250=15.38%, 500=3.30%, 750=3.30%, 2000=21.98%
    lat (msec) : >=2000=46.15%
  cpu          : usr=0.04%, sys=0.13%, ctx=105, majf=0, minf=31
  IO depths    : 1=1.1%, 2=2.2%, 4=4.4%, 8=8.8%, 16=83.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=98.7%, 8=0.0%, 16=1.3%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=91/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=372736KB, aggrb=6077KB/s, minb=6077KB/s, maxb=6077KB/s, mint=61332msec, maxt=61332msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [W(1)] [47.6% done] [0KB/0KB/0KB /s] [0/0/0 iops] [eta 01m:15s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=32062: Fri Jun 17 21:32:35 2016
  write: io=2460.0MB, bw=37652KB/s, iops=9, runt= 66903msec
    slat (usec): min=666, max=4663.9K, avg=10521.88, stdev=189021.66
    clat (msec): min=74, max=22525, avg=1724.83, stdev=3168.71
     lat (msec): min=75, max=22526, avg=1735.35, stdev=3185.49
    clat percentiles (msec):
     |  1.00th=[  121],  5.00th=[  169], 10.00th=[  204], 20.00th=[  273],
     | 30.00th=[  375], 40.00th=[  461], 50.00th=[  570], 60.00th=[  709],
     | 70.00th=[ 1037], 80.00th=[ 1663], 90.00th=[ 5145], 95.00th=[ 8455],
     | 99.00th=[16712], 99.50th=[16712], 99.90th=[16712], 99.95th=[16712],
     | 99.99th=[16712]
    bw (KB  /s): min= 1027, max=167806, per=100.00%, avg=71870.95, stdev=51081.07
    lat (msec) : 100=0.33%, 250=17.07%, 500=25.53%, 750=18.21%, 1000=8.13%
    lat (msec) : 2000=12.03%, >=2000=18.70%
  cpu          : usr=0.38%, sys=0.73%, ctx=1008, majf=0, minf=30
  IO depths    : 1=0.2%, 2=0.3%, 4=0.7%, 8=1.3%, 16=97.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.8%, 8=0.0%, 16=0.2%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=615/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=2460.0MB, aggrb=37652KB/s, minb=37652KB/s, maxb=37652KB/s, mint=66903msec, maxt=66903msec
```

# Throughput Read
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [108.0MB/0KB/0KB /s] [27/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=4527: Fri Jun 17 21:45:36 2016
  read : io=5120.0MB, bw=114827KB/s, iops=28, runt= 45659msec
    slat (usec): min=551, max=3499, avg=729.11, stdev=263.12
    clat (msec): min=77, max=2214, avg=569.37, stdev=463.21
     lat (msec): min=78, max=2215, avg=570.10, stdev=463.19
    clat percentiles (msec):
     |  1.00th=[  100],  5.00th=[  127], 10.00th=[  151], 20.00th=[  186],
     | 30.00th=[  237], 40.00th=[  302], 50.00th=[  388], 60.00th=[  482],
     | 70.00th=[  660], 80.00th=[ 1012], 90.00th=[ 1385], 95.00th=[ 1516],
     | 99.00th=[ 1762], 99.50th=[ 1827], 99.90th=[ 1975], 99.95th=[ 2212],
     | 99.99th=[ 2212]
    bw (KB  /s): min=48689, max=130031, per=99.26%, avg=113974.16, stdev=10371.40
    lat (msec) : 100=1.02%, 250=31.64%, 500=28.52%, 750=12.27%, 1000=6.09%
    lat (msec) : 2000=20.39%, >=2000=0.08%
  cpu          : usr=0.07%, sys=1.80%, ctx=11416, majf=0, minf=575
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=114826KB/s, minb=114826KB/s, maxb=114826KB/s, mint=45659msec, maxt=45659msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [116.0MB/0KB/0KB /s] [29/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=4251: Fri Jun 17 21:44:50 2016
  read : io=5120.0MB, bw=114844KB/s, iops=28, runt= 45652msec
    slat (usec): min=537, max=3656, avg=739.14, stdev=227.23
    clat (msec): min=67, max=2296, avg=569.33, stdev=423.39
     lat (msec): min=68, max=2296, avg=570.07, stdev=423.39
    clat percentiles (msec):
     |  1.00th=[   99],  5.00th=[  131], 10.00th=[  157], 20.00th=[  196],
     | 30.00th=[  251], 40.00th=[  338], 50.00th=[  437], 60.00th=[  594],
     | 70.00th=[  742], 80.00th=[  922], 90.00th=[ 1106], 95.00th=[ 1369],
     | 99.00th=[ 2040], 99.50th=[ 2147], 99.90th=[ 2245], 99.95th=[ 2311],
     | 99.99th=[ 2311]
    bw (KB  /s): min=64215, max=133139, per=99.44%, avg=114200.85, stdev=9095.54
    lat (msec) : 100=1.17%, 250=28.75%, 500=24.38%, 750=16.25%, 1000=13.20%
    lat (msec) : 2000=15.08%, >=2000=1.17%
  cpu          : usr=0.06%, sys=1.86%, ctx=11143, majf=0, minf=575
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=114844KB/s, minb=114844KB/s, maxb=114844KB/s, mint=45652msec, maxt=45652msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [108.0MB/0KB/0KB /s] [27/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=3972: Fri Jun 17 21:44:04 2016
  read : io=5120.0MB, bw=114847KB/s, iops=28, runt= 45651msec
    slat (usec): min=508, max=3307, avg=725.98, stdev=219.07
    clat (msec): min=95, max=1855, avg=569.32, stdev=406.60
     lat (msec): min=95, max=1856, avg=570.05, stdev=406.59
    clat percentiles (msec):
     |  1.00th=[  115],  5.00th=[  151], 10.00th=[  178], 20.00th=[  223],
     | 30.00th=[  269], 40.00th=[  343], 50.00th=[  424], 60.00th=[  545],
     | 70.00th=[  701], 80.00th=[  898], 90.00th=[ 1254], 95.00th=[ 1434],
     | 99.00th=[ 1663], 99.50th=[ 1713], 99.90th=[ 1827], 99.95th=[ 1860],
     | 99.99th=[ 1860]
    bw (KB  /s): min=35189, max=138709, per=99.16%, avg=113878.98, stdev=11456.24
    lat (msec) : 100=0.16%, 250=25.55%, 500=30.94%, 750=16.02%, 1000=11.17%
    lat (msec) : 2000=16.17%
  cpu          : usr=0.03%, sys=1.86%, ctx=11088, majf=0, minf=575
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=114846KB/s, minb=114846KB/s, maxb=114846KB/s, mint=45651msec, maxt=45651msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)
Jobs: 1 (f=1): [R(1)] [100.0% done] [108.0MB/0KB/0KB /s] [27/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=3692: Fri Jun 17 21:43:18 2016
  read : io=5120.0MB, bw=114832KB/s, iops=28, runt= 45657msec
    slat (usec): min=568, max=4457, avg=713.89, stdev=230.95
    clat (msec): min=53, max=2054, avg=569.36, stdev=454.62
     lat (msec): min=54, max=2055, avg=570.08, stdev=454.62
    clat percentiles (msec):
     |  1.00th=[   83],  5.00th=[  128], 10.00th=[  155], 20.00th=[  198],
     | 30.00th=[  251], 40.00th=[  322], 50.00th=[  404], 60.00th=[  515],
     | 70.00th=[  652], 80.00th=[  938], 90.00th=[ 1287], 95.00th=[ 1598],
     | 99.00th=[ 1827], 99.50th=[ 1893], 99.90th=[ 2024], 99.95th=[ 2057],
     | 99.99th=[ 2057]
    bw (KB  /s): min=22755, max=137612, per=99.08%, avg=113778.47, stdev=12622.54
    lat (msec) : 100=2.03%, 250=27.50%, 500=29.45%, 750=15.55%, 1000=7.81%
    lat (msec) : 2000=17.50%, >=2000=0.16%
  cpu          : usr=0.02%, sys=1.84%, ctx=11150, majf=0, minf=65
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=114831KB/s, minb=114831KB/s, maxb=114831KB/s, mint=45657msec, maxt=45657msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
Jobs: 1 (f=1): [R(1)] [100.0% done] [108.0MB/0KB/0KB /s] [27/0/0 iops] [eta 00m:00s]
libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=4806: Fri Jun 17 21:46:22 2016
  read : io=5120.0MB, bw=114850KB/s, iops=28, runt= 45650msec
    slat (usec): min=520, max=4059, avg=723.28, stdev=280.44
    clat (msec): min=96, max=2502, avg=569.24, stdev=451.29
     lat (msec): min=97, max=2503, avg=569.96, stdev=451.28
    clat percentiles (msec):
     |  1.00th=[  112],  5.00th=[  139], 10.00th=[  159], 20.00th=[  194],
     | 30.00th=[  241], 40.00th=[  306], 50.00th=[  392], 60.00th=[  506],
     | 70.00th=[  701], 80.00th=[  988], 90.00th=[ 1287], 95.00th=[ 1483],
     | 99.00th=[ 1827], 99.50th=[ 1926], 99.90th=[ 2311], 99.95th=[ 2507],
     | 99.99th=[ 2507]
    bw (KB  /s): min=46413, max=144000, per=99.34%, avg=114094.86, stdev=11357.44
    lat (msec) : 100=0.31%, 250=31.09%, 500=28.05%, 750=12.58%, 1000=8.59%
    lat (msec) : 2000=19.06%, >=2000=0.31%
  cpu          : usr=0.05%, sys=1.81%, ctx=11503, majf=0, minf=575
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=114849KB/s, minb=114849KB/s, maxb=114849KB/s, mint=45650msec, maxt=45650msec
```
