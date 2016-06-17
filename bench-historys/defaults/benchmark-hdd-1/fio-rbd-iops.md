# rados block device using fio-rbd

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
fio-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/1984KB/0KB /s] [0/496/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=1718: Fri Jun 17 20:14:27 2016
  write: io=38976KB, bw=1925.5KB/s, iops=481, runt= 20243msec
    slat (usec): min=1, max=25, avg= 2.11, stdev= 1.77
    clat (msec): min=10, max=792, avg=33.20, stdev=56.35
     lat (msec): min=10, max=792, avg=33.20, stdev=56.35
    clat percentiles (msec):
     |  1.00th=[   17],  5.00th=[   18], 10.00th=[   19], 20.00th=[   26],
     | 30.00th=[   26], 40.00th=[   26], 50.00th=[   26], 60.00th=[   26],
     | 70.00th=[   26], 80.00th=[   27], 90.00th=[   28], 95.00th=[   77],
     | 99.00th=[  202], 99.50th=[  251], 99.90th=[  791], 99.95th=[  791],
     | 99.99th=[  791]
    bw (KB  /s): min=  348, max= 2886, per=100.00%, avg=2031.03, stdev=642.65
    lat (msec) : 20=15.44%, 50=78.49%, 100=3.28%, 250=2.13%, 500=0.16%
    lat (msec) : 750=0.16%, 1000=0.33%
  cpu          : usr=0.20%, sys=0.09%, ctx=654, majf=0, minf=14
  IO depths    : 1=6.2%, 2=12.5%, 4=25.0%, 8=50.0%, 16=6.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.1%, 8=0.0%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=9744/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=38976KB, aggrb=1925KB/s, minb=1925KB/s, maxb=1925KB/s, mint=20243msec, maxt=20243msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2176KB/0KB /s] [0/544/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=1538: Fri Jun 17 20:14:07 2016
  write: io=38976KB, bw=1898.6KB/s, iops=474, runt= 20529msec
    slat (usec): min=1, max=31, avg= 2.00, stdev= 1.82
    clat (msec): min=15, max=664, avg=33.67, stdev=46.57
     lat (msec): min=15, max=664, avg=33.67, stdev=46.57
    clat percentiles (msec):
     |  1.00th=[   18],  5.00th=[   18], 10.00th=[   19], 20.00th=[   26],
     | 30.00th=[   26], 40.00th=[   26], 50.00th=[   26], 60.00th=[   26],
     | 70.00th=[   26], 80.00th=[   27], 90.00th=[   35], 95.00th=[   72],
     | 99.00th=[  235], 99.50th=[  363], 99.90th=[  668], 99.95th=[  668],
     | 99.99th=[  668]
    bw (KB  /s): min=  360, max= 2909, per=100.00%, avg=1978.97, stdev=621.78
    lat (msec) : 20=11.33%, 50=81.61%, 100=4.11%, 250=2.13%, 500=0.49%
    lat (msec) : 750=0.33%
  cpu          : usr=0.20%, sys=0.07%, ctx=652, majf=0, minf=14
  IO depths    : 1=6.2%, 2=12.5%, 4=25.0%, 8=50.0%, 16=6.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.1%, 8=0.0%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=9744/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=38976KB, aggrb=1898KB/s, minb=1898KB/s, maxb=1898KB/s, mint=20529msec, maxt=20529msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/1600KB/0KB /s] [0/400/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=1347: Fri Jun 17 20:13:46 2016
  write: io=40960KB, bw=1982.5KB/s, iops=495, runt= 20661msec
    slat (usec): min=1, max=24, avg= 2.09, stdev= 1.72
    clat (msec): min=9, max=807, avg=32.24, stdev=52.79
     lat (msec): min=9, max=807, avg=32.24, stdev=52.79
    clat percentiles (msec):
     |  1.00th=[   17],  5.00th=[   18], 10.00th=[   19], 20.00th=[   26],
     | 30.00th=[   26], 40.00th=[   26], 50.00th=[   26], 60.00th=[   26],
     | 70.00th=[   26], 80.00th=[   27], 90.00th=[   28], 95.00th=[   60],
     | 99.00th=[  127], 99.50th=[  277], 99.90th=[  807], 99.95th=[  807],
     | 99.99th=[  807]
    bw (KB  /s): min=  573, max= 2891, per=100.00%, avg=2072.11, stdev=560.30
    lat (msec) : 10=0.47%, 20=13.75%, 50=80.13%, 100=3.00%, 250=2.03%
    lat (msec) : 500=0.16%, 750=0.31%, 1000=0.16%
  cpu          : usr=0.21%, sys=0.09%, ctx=693, majf=0, minf=14
  IO depths    : 1=6.2%, 2=12.5%, 4=25.0%, 8=50.0%, 16=6.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.1%, 8=0.0%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=10240/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=40960KB, aggrb=1982KB/s, minb=1982KB/s, maxb=1982KB/s, mint=20661msec, maxt=20661msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2112KB/0KB /s] [0/528/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=1165: Fri Jun 17 20:13:25 2016
  write: io=38912KB, bw=1945.3KB/s, iops=486, runt= 20004msec
    slat (usec): min=1, max=28, avg= 2.09, stdev= 1.74
    clat (msec): min=8, max=992, avg=32.86, stdev=48.94
     lat (msec): min=8, max=992, avg=32.86, stdev=48.94
    clat percentiles (msec):
     |  1.00th=[   16],  5.00th=[   18], 10.00th=[   19], 20.00th=[   26],
     | 30.00th=[   26], 40.00th=[   26], 50.00th=[   26], 60.00th=[   26],
     | 70.00th=[   26], 80.00th=[   27], 90.00th=[   31], 95.00th=[   92],
     | 99.00th=[  137], 99.50th=[  260], 99.90th=[  996], 99.95th=[  996],
     | 99.99th=[  996]
    bw (KB  /s): min=   99, max= 2847, per=100.00%, avg=2035.06, stdev=529.97
    lat (msec) : 10=0.49%, 20=14.64%, 50=77.14%, 100=4.61%, 250=2.47%
    lat (msec) : 500=0.49%, 1000=0.16%
  cpu          : usr=0.19%, sys=0.10%, ctx=654, majf=0, minf=14
  IO depths    : 1=6.2%, 2=12.5%, 4=25.0%, 8=50.0%, 16=6.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.1%, 8=0.0%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=9728/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=38912KB, aggrb=1945KB/s, minb=1945KB/s, maxb=1945KB/s, mint=20004msec, maxt=20004msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/1472KB/0KB /s] [0/368/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=973: Fri Jun 17 20:13:04 2016
  write: io=40896KB, bw=2043.7KB/s, iops=510, runt= 20011msec
    slat (usec): min=0, max=19, avg= 2.02, stdev= 1.73
    clat (msec): min=9, max=856, avg=31.28, stdev=47.62
     lat (msec): min=9, max=856, avg=31.28, stdev=47.62
    clat percentiles (msec):
     |  1.00th=[   18],  5.00th=[   18], 10.00th=[   19], 20.00th=[   25],
     | 30.00th=[   26], 40.00th=[   26], 50.00th=[   26], 60.00th=[   26],
     | 70.00th=[   26], 80.00th=[   27], 90.00th=[   28], 95.00th=[   60],
     | 99.00th=[  231], 99.50th=[  306], 99.90th=[  857], 99.95th=[  857],
     | 99.99th=[  857]
    bw (KB  /s): min=  478, max= 2938, per=100.00%, avg=2152.77, stdev=541.55
    lat (msec) : 10=0.16%, 20=17.68%, 50=76.84%, 100=3.44%, 250=0.94%
    lat (msec) : 500=0.63%, 750=0.16%, 1000=0.16%
  cpu          : usr=0.25%, sys=0.04%, ctx=680, majf=0, minf=14
  IO depths    : 1=6.2%, 2=12.5%, 4=25.0%, 8=50.0%, 16=6.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.1%, 8=0.0%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=10224/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=40896KB, aggrb=2043KB/s, minb=2043KB/s, maxb=2043KB/s, mint=20011msec, maxt=20011msec
```

### READ
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [23040KB/0KB/0KB /s] [5760/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=3328: Fri Jun 17 20:18:27 2016
  read : io=477624KB, bw=23878KB/s, iops=5969, runt= 20003msec
    slat (usec): min=0, max=51, avg= 1.30, stdev= 1.30
    clat (usec): min=21, max=8223, avg=2654.30, stdev=906.23
     lat (usec): min=22, max=8224, avg=2655.60, stdev=906.22
    clat percentiles (usec):
     |  1.00th=[   36],  5.00th=[  235], 10.00th=[ 2256], 20.00th=[ 2512],
     | 30.00th=[ 2640], 40.00th=[ 2736], 50.00th=[ 2832], 60.00th=[ 2896],
     | 70.00th=[ 2960], 80.00th=[ 3024], 90.00th=[ 3216], 95.00th=[ 3632],
     | 99.00th=[ 5472], 99.50th=[ 5600], 99.90th=[ 5984], 99.95th=[ 6560],
     | 99.99th=[ 7200]
    bw (KB  /s): min=16850, max=68950, per=100.00%, avg=23904.44, stdev=8289.97
    lat (usec) : 50=1.07%, 100=0.01%, 250=6.64%, 500=1.71%, 750=0.01%
    lat (msec) : 2=0.03%, 4=87.79%, 10=2.75%
  cpu          : usr=1.66%, sys=0.74%, ctx=7695, majf=0, minf=16
  IO depths    : 1=6.2%, 2=12.4%, 4=24.7%, 8=49.5%, 16=7.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.2%, 8=0.0%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=119406/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=477624KB, aggrb=23877KB/s, minb=23877KB/s, maxb=23877KB/s, mint=20003msec, maxt=20003msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [22592KB/0KB/0KB /s] [5648/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=3148: Fri Jun 17 20:18:06 2016
  read : io=477808KB, bw=23888KB/s, iops=5972, runt= 20002msec
    slat (usec): min=0, max=187, avg= 1.26, stdev= 1.69
    clat (usec): min=6, max=8001, avg=2653.72, stdev=908.81
     lat (usec): min=22, max=8002, avg=2654.98, stdev=908.73
    clat percentiles (usec):
     |  1.00th=[   52],  5.00th=[  233], 10.00th=[ 2256], 20.00th=[ 2512],
     | 30.00th=[ 2640], 40.00th=[ 2736], 50.00th=[ 2832], 60.00th=[ 2896],
     | 70.00th=[ 2960], 80.00th=[ 3024], 90.00th=[ 3216], 95.00th=[ 3568],
     | 99.00th=[ 5408], 99.50th=[ 5600], 99.90th=[ 5984], 99.95th=[ 6304],
     | 99.99th=[ 7840]
    bw (KB  /s): min=16752, max=68855, per=100.00%, avg=23911.51, stdev=8306.18
    lat (usec) : 10=0.01%, 50=0.99%, 100=0.03%, 250=6.55%, 500=1.84%
    lat (usec) : 750=0.02%
    lat (msec) : 2=0.03%, 4=87.50%, 10=3.04%
  cpu          : usr=1.52%, sys=0.81%, ctx=7867, majf=0, minf=16
  IO depths    : 1=6.2%, 2=12.4%, 4=24.7%, 8=49.6%, 16=7.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.2%, 8=0.0%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=119452/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=477808KB, aggrb=23888KB/s, minb=23888KB/s, maxb=23888KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [22464KB/0KB/0KB /s] [5616/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=2971: Fri Jun 17 20:17:46 2016
  read : io=473848KB, bw=23689KB/s, iops=5922, runt= 20003msec
    slat (usec): min=0, max=33, avg= 1.25, stdev= 1.28
    clat (usec): min=20, max=25951, avg=2676.14, stdev=949.26
     lat (usec): min=22, max=25970, avg=2677.39, stdev=949.26
    clat percentiles (usec):
     |  1.00th=[   43],  5.00th=[  233], 10.00th=[ 2288], 20.00th=[ 2544],
     | 30.00th=[ 2672], 40.00th=[ 2768], 50.00th=[ 2832], 60.00th=[ 2896],
     | 70.00th=[ 2960], 80.00th=[ 3024], 90.00th=[ 3216], 95.00th=[ 3632],
     | 99.00th=[ 5408], 99.50th=[ 5536], 99.90th=[ 6240], 99.95th=[ 7072],
     | 99.99th=[25984]
    bw (KB  /s): min=17272, max=66392, per=100.00%, avg=23710.44, stdev=8122.62
    lat (usec) : 50=1.07%, 100=0.01%, 250=6.48%, 500=1.91%, 750=0.01%
    lat (usec) : 1000=0.02%
    lat (msec) : 2=0.03%, 4=87.98%, 10=2.47%, 50=0.01%
  cpu          : usr=1.59%, sys=0.87%, ctx=7545, majf=0, minf=16
  IO depths    : 1=6.2%, 2=12.4%, 4=24.7%, 8=49.5%, 16=7.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.2%, 8=0.0%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=118462/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=473848KB, aggrb=23688KB/s, minb=23688KB/s, maxb=23688KB/s, mint=20003msec, maxt=20003msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [23232KB/0KB/0KB /s] [5808/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=3506: Fri Jun 17 20:18:47 2016
  read : io=481020KB, bw=24050KB/s, iops=6012, runt= 20001msec
    slat (usec): min=0, max=208, avg= 1.27, stdev= 1.43
    clat (usec): min=20, max=7535, avg=2635.30, stdev=904.24
     lat (usec): min=22, max=7536, avg=2636.57, stdev=904.23
    clat percentiles (usec):
     |  1.00th=[   45],  5.00th=[  235], 10.00th=[ 2256], 20.00th=[ 2480],
     | 30.00th=[ 2608], 40.00th=[ 2704], 50.00th=[ 2800], 60.00th=[ 2864],
     | 70.00th=[ 2928], 80.00th=[ 3024], 90.00th=[ 3184], 95.00th=[ 3600],
     | 99.00th=[ 5472], 99.50th=[ 5600], 99.90th=[ 6112], 99.95th=[ 6240],
     | 99.99th=[ 7264]
    bw (KB  /s): min=16616, max=69088, per=100.00%, avg=24069.85, stdev=8307.25
    lat (usec) : 50=1.02%, 100=0.01%, 250=6.34%, 500=1.98%, 750=0.01%
    lat (msec) : 2=0.05%, 4=87.49%, 10=3.08%
  cpu          : usr=1.89%, sys=0.57%, ctx=7740, majf=0, minf=16
  IO depths    : 1=6.2%, 2=12.4%, 4=24.7%, 8=49.6%, 16=7.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.2%, 8=0.1%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=120255/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=481020KB, aggrb=24049KB/s, minb=24049KB/s, maxb=24049KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [22976KB/0KB/0KB /s] [5744/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=3686: Fri Jun 17 20:19:07 2016
  read : io=478332KB, bw=23914KB/s, iops=5978, runt= 20002msec
    slat (usec): min=0, max=35, avg= 1.24, stdev= 1.26
    clat (usec): min=20, max=7425, avg=2651.27, stdev=907.57
     lat (usec): min=23, max=7426, avg=2652.50, stdev=907.56
    clat percentiles (usec):
     |  1.00th=[   44],  5.00th=[  237], 10.00th=[ 2288], 20.00th=[ 2480],
     | 30.00th=[ 2640], 40.00th=[ 2736], 50.00th=[ 2832], 60.00th=[ 2896],
     | 70.00th=[ 2960], 80.00th=[ 3024], 90.00th=[ 3184], 95.00th=[ 3568],
     | 99.00th=[ 5472], 99.50th=[ 5600], 99.90th=[ 6176], 99.95th=[ 6624],
     | 99.99th=[ 7392]
    bw (KB  /s): min=17277, max=68359, per=100.00%, avg=23946.90, stdev=8288.53
    lat (usec) : 50=1.04%, 100=0.01%, 250=6.26%, 500=2.11%
    lat (msec) : 2=0.07%, 4=87.70%, 10=2.82%
  cpu          : usr=1.73%, sys=0.59%, ctx=7654, majf=0, minf=16
  IO depths    : 1=6.2%, 2=12.4%, 4=24.7%, 8=49.6%, 16=7.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.2%, 8=0.1%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=119583/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=478332KB, aggrb=23914KB/s, minb=23914KB/s, maxb=23914KB/s, mint=20002msec, maxt=20002msec
```

### READ-WRITE
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [M(1)] [100.0% done] [1912KB/1816KB/0KB /s] [478/454/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=4036: Fri Jun 17 20:19:56 2016
  read : io=36284KB, bw=1813.1KB/s, iops=453, runt= 20003msec
    slat (usec): min=1, max=360, avg= 2.25, stdev= 4.26
    clat (usec): min=22, max=284851, avg=10271.80, stdev=15788.35
     lat (usec): min=27, max=284853, avg=10274.05, stdev=15788.21
    clat percentiles (usec):
     |  1.00th=[   34],  5.00th=[   79], 10.00th=[  318], 20.00th=[  740],
     | 30.00th=[  956], 40.00th=[ 1112], 50.00th=[ 1304], 60.00th=[16192],
     | 70.00th=[17024], 80.00th=[17280], 90.00th=[24448], 95.00th=[26752],
     | 99.00th=[74240], 99.50th=[91648], 99.90th=[242688], 99.95th=[242688],
     | 99.99th=[284672]
    bw (KB  /s): min=  336, max= 2500, per=100.00%, avg=1816.82, stdev=401.68
  write: io=35892KB, bw=1794.4KB/s, iops=448, runt= 20003msec
    slat (usec): min=1, max=52, avg= 2.40, stdev= 2.13
    clat (msec): min=7, max=287, avg=25.21, stdev=18.14
     lat (msec): min=7, max=287, avg=25.21, stdev=18.14
    clat percentiles (msec):
     |  1.00th=[   16],  5.00th=[   17], 10.00th=[   17], 20.00th=[   18],
     | 30.00th=[   18], 40.00th=[   19], 50.00th=[   24], 60.00th=[   25],
     | 70.00th=[   26], 80.00th=[   26], 90.00th=[   34], 95.00th=[   43],
     | 99.00th=[   99], 99.50th=[  116], 99.90th=[  285], 99.95th=[  289],
     | 99.99th=[  289]
    bw (KB  /s): min=  417, max= 2368, per=99.98%, avg=1793.61, stdev=392.06
    lat (usec) : 50=2.14%, 100=0.50%, 250=1.55%, 500=2.83%, 750=3.23%
    lat (usec) : 1000=6.01%
    lat (msec) : 2=11.92%, 4=0.02%, 10=0.53%, 20=38.10%, 50=30.26%
    lat (msec) : 100=2.33%, 250=0.48%, 500=0.09%
  cpu          : usr=0.50%, sys=0.19%, ctx=1671, majf=0, minf=15
  IO depths    : 1=4.5%, 2=9.0%, 4=19.0%, 8=56.6%, 16=10.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.4%, 8=1.6%, 16=5.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=9071/w=8973/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=36284KB, aggrb=1813KB/s, minb=1813KB/s, maxb=1813KB/s, mint=20003msec, maxt=20003msec
  WRITE: io=35892KB, aggrb=1794KB/s, minb=1794KB/s, maxb=1794KB/s, mint=20003msec, maxt=20003msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [M(1)] [100.0% done] [1956KB/1776KB/0KB /s] [489/444/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=4213: Fri Jun 17 20:20:16 2016
  read : io=31928KB, bw=1595.3KB/s, iops=398, runt= 20015msec
    slat (usec): min=0, max=23, avg= 2.06, stdev= 1.99
    clat (usec): min=18, max=366113, avg=11383.75, stdev=23487.82
     lat (usec): min=27, max=366114, avg=11385.81, stdev=23487.76
    clat percentiles (usec):
     |  1.00th=[   40],  5.00th=[  137], 10.00th=[  354], 20.00th=[  764],
     | 30.00th=[  964], 40.00th=[ 1096], 50.00th=[ 1304], 60.00th=[16192],
     | 70.00th=[16768], 80.00th=[17280], 90.00th=[24192], 95.00th=[26240],
     | 99.00th=[108032], 99.50th=[205824], 99.90th=[333824], 99.95th=[333824],
     | 99.99th=[366592]
    bw (KB  /s): min=  392, max= 2503, per=100.00%, avg=1599.57, stdev=542.78
  write: io=31436KB, bw=1570.7KB/s, iops=392, runt= 20015msec
    slat (usec): min=0, max=25, avg= 2.27, stdev= 2.06
    clat (msec): min=8, max=367, avg=29.12, stdev=34.83
     lat (msec): min=8, max=367, avg=29.12, stdev=34.83
    clat percentiles (msec):
     |  1.00th=[   16],  5.00th=[   17], 10.00th=[   17], 20.00th=[   18],
     | 30.00th=[   18], 40.00th=[   19], 50.00th=[   25], 60.00th=[   25],
     | 70.00th=[   26], 80.00th=[   27], 90.00th=[   35], 95.00th=[   64],
     | 99.00th=[  237], 99.50th=[  260], 99.90th=[  367], 99.95th=[  367],
     | 99.99th=[  367]
    bw (KB  /s): min=  352, max= 2348, per=100.00%, avg=1579.38, stdev=523.39
    lat (usec) : 20=0.01%, 50=1.70%, 100=0.45%, 250=1.61%, 500=3.16%
    lat (usec) : 750=2.88%, 1000=6.36%
    lat (msec) : 2=12.35%, 4=0.04%, 10=0.40%, 20=37.22%, 50=29.44%
    lat (msec) : 100=2.26%, 250=1.70%, 500=0.40%
  cpu          : usr=0.40%, sys=0.20%, ctx=1502, majf=0, minf=15
  IO depths    : 1=4.4%, 2=8.9%, 4=19.0%, 8=57.1%, 16=10.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.3%, 8=1.6%, 16=5.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=7982/w=7859/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=31928KB, aggrb=1595KB/s, minb=1595KB/s, maxb=1595KB/s, mint=20015msec, maxt=20015msec
  WRITE: io=31436KB, aggrb=1570KB/s, minb=1570KB/s, maxb=1570KB/s, mint=20015msec, maxt=20015msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [M(1)] [100.0% done] [2048KB/1964KB/0KB /s] [512/491/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=4390: Fri Jun 17 20:20:37 2016
  read : io=35868KB, bw=1792.2KB/s, iops=448, runt= 20014msec
    slat (usec): min=0, max=36, avg= 2.12, stdev= 2.17
    clat (usec): min=15, max=240288, avg=10683.38, stdev=18399.81
     lat (usec): min=28, max=240295, avg=10685.50, stdev=18399.71
    clat percentiles (usec):
     |  1.00th=[   37],  5.00th=[  133], 10.00th=[  346], 20.00th=[  804],
     | 30.00th=[  988], 40.00th=[ 1112], 50.00th=[ 1304], 60.00th=[16320],
     | 70.00th=[16768], 80.00th=[17280], 90.00th=[24192], 95.00th=[25216],
     | 99.00th=[90624], 99.50th=[116224], 99.90th=[240640], 99.95th=[240640],
     | 99.99th=[240640]
    bw (KB  /s): min=  243, max= 2674, per=100.00%, avg=1802.05, stdev=460.08
  write: io=35424KB, bw=1769.1KB/s, iops=442, runt= 20014msec
    slat (usec): min=1, max=29, avg= 2.24, stdev= 2.07
    clat (msec): min=8, max=242, avg=25.27, stdev=21.34
     lat (msec): min=8, max=242, avg=25.27, stdev=21.34
    clat percentiles (msec):
     |  1.00th=[   16],  5.00th=[   17], 10.00th=[   17], 20.00th=[   18],
     | 30.00th=[   18], 40.00th=[   18], 50.00th=[   19], 60.00th=[   25],
     | 70.00th=[   26], 80.00th=[   26], 90.00th=[   33], 95.00th=[   42],
     | 99.00th=[  137], 99.50th=[  167], 99.90th=[  241], 99.95th=[  243],
     | 99.99th=[  243]
    bw (KB  /s): min=  293, max= 2419, per=100.00%, avg=1780.26, stdev=413.99
    lat (usec) : 20=0.01%, 50=1.80%, 100=0.46%, 250=1.35%, 500=3.07%
    lat (usec) : 750=2.63%, 1000=6.23%
    lat (msec) : 2=12.27%, 4=0.02%, 10=0.72%, 20=41.37%, 50=27.05%
    lat (msec) : 100=1.72%, 250=1.31%
  cpu          : usr=0.52%, sys=0.15%, ctx=1648, majf=0, minf=15
  IO depths    : 1=4.5%, 2=9.0%, 4=19.3%, 8=56.7%, 16=10.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.4%, 8=1.5%, 16=5.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8967/w=8856/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=35868KB, aggrb=1792KB/s, minb=1792KB/s, maxb=1792KB/s, mint=20014msec, maxt=20014msec
  WRITE: io=35424KB, aggrb=1769KB/s, minb=1769KB/s, maxb=1769KB/s, mint=20014msec, maxt=20014msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [M(1)] [100.0% done] [1332KB/1164KB/0KB /s] [333/291/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=4570: Fri Jun 17 20:20:57 2016
  read : io=35932KB, bw=1795.7KB/s, iops=448, runt= 20011msec
    slat (usec): min=1, max=37, avg= 2.14, stdev= 2.09
    clat (usec): min=24, max=315879, avg=10037.67, stdev=16503.20
     lat (usec): min=29, max=315880, avg=10039.82, stdev=16503.11
    clat percentiles (usec):
     |  1.00th=[   40],  5.00th=[  133], 10.00th=[  338], 20.00th=[  796],
     | 30.00th=[  972], 40.00th=[ 1112], 50.00th=[ 1320], 60.00th=[16192],
     | 70.00th=[17024], 80.00th=[17280], 90.00th=[19072], 95.00th=[25216],
     | 99.00th=[70144], 99.50th=[108032], 99.90th=[234496], 99.95th=[240640],
     | 99.99th=[317440]
    bw (KB  /s): min=  477, max= 2611, per=99.84%, avg=1792.13, stdev=483.45
  write: io=35480KB, bw=1773.3KB/s, iops=443, runt= 20011msec
    slat (usec): min=1, max=28, avg= 2.35, stdev= 2.14
    clat (msec): min=7, max=316, avg=25.86, stdev=23.81
     lat (msec): min=7, max=316, avg=25.86, stdev=23.81
    clat percentiles (msec):
     |  1.00th=[    9],  5.00th=[   17], 10.00th=[   17], 20.00th=[   18],
     | 30.00th=[   18], 40.00th=[   18], 50.00th=[   19], 60.00th=[   25],
     | 70.00th=[   26], 80.00th=[   26], 90.00th=[   34], 95.00th=[   44],
     | 99.00th=[  118], 99.50th=[  200], 99.90th=[  318], 99.95th=[  318],
     | 99.99th=[  318]
    bw (KB  /s): min=  499, max= 2422, per=99.88%, avg=1770.87, stdev=421.52
    lat (usec) : 50=1.73%, 100=0.49%, 250=1.74%, 500=2.78%, 750=2.49%
    lat (usec) : 1000=6.73%
    lat (msec) : 2=11.99%, 10=1.58%, 20=41.26%, 50=26.24%, 100=1.67%
    lat (msec) : 250=1.22%, 500=0.09%
  cpu          : usr=0.46%, sys=0.21%, ctx=1685, majf=0, minf=15
  IO depths    : 1=4.5%, 2=9.0%, 4=19.2%, 8=56.6%, 16=10.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.4%, 8=1.5%, 16=5.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8983/w=8870/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=35932KB, aggrb=1795KB/s, minb=1795KB/s, maxb=1795KB/s, mint=20011msec, maxt=20011msec
  WRITE: io=35480KB, aggrb=1773KB/s, minb=1773KB/s, maxb=1773KB/s, mint=20011msec, maxt=20011msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [M(1)] [100.0% done] [1328KB/1292KB/0KB /s] [332/323/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=4747: Fri Jun 17 20:21:18 2016
  read : io=36436KB, bw=1821.8KB/s, iops=455, runt= 20008msec
    slat (usec): min=0, max=31, avg= 2.09, stdev= 2.15
    clat (usec): min=23, max=224855, avg=10244.09, stdev=16737.22
     lat (usec): min=28, max=224858, avg=10246.18, stdev=16737.13
    clat percentiles (usec):
     |  1.00th=[   37],  5.00th=[  115], 10.00th=[  350], 20.00th=[  780],
     | 30.00th=[  964], 40.00th=[ 1096], 50.00th=[ 1256], 60.00th=[16192],
     | 70.00th=[16768], 80.00th=[17280], 90.00th=[24192], 95.00th=[25728],
     | 99.00th=[77312], 99.50th=[100864], 99.90th=[220160], 99.95th=[224256],
     | 99.99th=[224256]
    bw (KB  /s): min=  962, max= 2453, per=100.00%, avg=1832.84, stdev=334.03
  write: io=36032KB, bw=1800.9KB/s, iops=450, runt= 20008msec
    slat (usec): min=1, max=29, avg= 2.26, stdev= 2.05
    clat (msec): min=8, max=260, avg=25.11, stdev=17.83
     lat (msec): min=8, max=260, avg=25.11, stdev=17.83
    clat percentiles (msec):
     |  1.00th=[   15],  5.00th=[   17], 10.00th=[   17], 20.00th=[   18],
     | 30.00th=[   18], 40.00th=[   18], 50.00th=[   25], 60.00th=[   25],
     | 70.00th=[   26], 80.00th=[   26], 90.00th=[   34], 95.00th=[   41],
     | 99.00th=[  104], 99.50th=[  121], 99.90th=[  225], 99.95th=[  225],
     | 99.99th=[  262]
    bw (KB  /s): min= 1051, max= 2298, per=100.00%, avg=1810.32, stdev=272.19
    lat (usec) : 50=1.83%, 100=0.53%, 250=1.51%, 500=2.77%, 750=3.02%
    lat (usec) : 1000=6.84%
    lat (msec) : 2=12.16%, 4=0.02%, 10=0.71%, 20=37.62%, 50=30.44%
    lat (msec) : 100=1.68%, 250=0.85%, 500=0.02%
  cpu          : usr=0.48%, sys=0.20%, ctx=1708, majf=0, minf=15
  IO depths    : 1=4.4%, 2=8.8%, 4=19.0%, 8=57.1%, 16=10.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.3%, 8=1.6%, 16=5.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=9109/w=9008/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=36436KB, aggrb=1821KB/s, minb=1821KB/s, maxb=1821KB/s, mint=20008msec, maxt=20008msec
  WRITE: io=36032KB, aggrb=1800KB/s, minb=1800KB/s, maxb=1800KB/s, mint=20008msec, maxt=20008msec
```

### RAND-WRITE
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/1936KB/0KB /s] [0/484/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=5135: Fri Jun 17 20:22:12 2016
  write: io=24188KB, bw=1208.9KB/s, iops=302, runt= 20009msec
    slat (usec): min=0, max=28, avg= 2.27, stdev= 2.03
    clat (msec): min=3, max=1762, avg=52.90, stdev=185.77
     lat (msec): min=3, max=1762, avg=52.91, stdev=185.77
    clat percentiles (msec):
     |  1.00th=[    9],  5.00th=[   12], 10.00th=[   13], 20.00th=[   15],
     | 30.00th=[   17], 40.00th=[   17], 50.00th=[   18], 60.00th=[   19],
     | 70.00th=[   23], 80.00th=[   28], 90.00th=[   36], 95.00th=[   80],
     | 99.00th=[ 1205], 99.50th=[ 1483], 99.90th=[ 1729], 99.95th=[ 1762],
     | 99.99th=[ 1762]
    bw (KB  /s): min=   43, max= 3610, per=100.00%, avg=1672.71, stdev=1313.42
    lat (msec) : 4=0.07%, 10=2.79%, 20=62.99%, 50=26.89%, 100=2.53%
    lat (msec) : 250=1.74%, 500=0.64%, 1000=0.89%, 2000=1.46%
  cpu          : usr=0.12%, sys=0.12%, ctx=551, majf=0, minf=15
  IO depths    : 1=2.1%, 2=6.3%, 4=21.2%, 8=61.7%, 16=8.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.7%, 8=1.2%, 16=6.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=6047/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=24188KB, aggrb=1208KB/s, minb=1208KB/s, maxb=1208KB/s, mint=20009msec, maxt=20009msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/1904KB/0KB /s] [0/476/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=5315: Fri Jun 17 20:22:33 2016
  write: io=20560KB, bw=993.20KB/s, iops=248, runt= 20701msec
    slat (usec): min=0, max=47, avg= 2.31, stdev= 2.18
    clat (msec): min=3, max=1470, avg=64.40, stdev=199.75
     lat (msec): min=3, max=1470, avg=64.40, stdev=199.75
    clat percentiles (msec):
     |  1.00th=[    8],  5.00th=[   11], 10.00th=[   13], 20.00th=[   15],
     | 30.00th=[   16], 40.00th=[   17], 50.00th=[   18], 60.00th=[   19],
     | 70.00th=[   24], 80.00th=[   30], 90.00th=[   48], 95.00th=[  249],
     | 99.00th=[ 1139], 99.50th=[ 1434], 99.90th=[ 1450], 99.95th=[ 1450],
     | 99.99th=[ 1467]
    bw (KB  /s): min=   44, max= 3521, per=100.00%, avg=1319.00, stdev=1193.21
    lat (msec) : 4=0.10%, 10=4.28%, 20=60.74%, 50=25.35%, 100=3.19%
    lat (msec) : 250=1.40%, 500=1.07%, 750=1.03%, 1000=1.09%, 2000=1.75%
  cpu          : usr=0.13%, sys=0.08%, ctx=489, majf=0, minf=15
  IO depths    : 1=1.9%, 2=6.0%, 4=20.5%, 8=62.4%, 16=9.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.7%, 8=1.4%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=5140/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=20560KB, aggrb=993KB/s, minb=993KB/s, maxb=993KB/s, mint=20701msec, maxt=20701msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/3504KB/0KB /s] [0/876/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=5495: Fri Jun 17 20:22:54 2016
  write: io=22340KB, bw=1116.3KB/s, iops=279, runt= 20013msec
    slat (usec): min=1, max=26, avg= 2.33, stdev= 1.99
    clat (msec): min=3, max=1499, avg=57.29, stdev=178.25
     lat (msec): min=3, max=1499, avg=57.29, stdev=178.25
    clat percentiles (msec):
     |  1.00th=[    8],  5.00th=[   11], 10.00th=[   13], 20.00th=[   14],
     | 30.00th=[   16], 40.00th=[   17], 50.00th=[   18], 60.00th=[   19],
     | 70.00th=[   22], 80.00th=[   29], 90.00th=[   45], 95.00th=[  180],
     | 99.00th=[ 1156], 99.50th=[ 1188], 99.90th=[ 1434], 99.95th=[ 1434],
     | 99.99th=[ 1500]
    bw (KB  /s): min=   41, max= 3596, per=100.00%, avg=1492.12, stdev=1361.37
    lat (msec) : 4=0.09%, 10=3.42%, 20=63.28%, 50=23.72%, 100=2.95%
    lat (msec) : 250=2.27%, 500=1.11%, 750=0.68%, 1000=1.22%, 2000=1.25%
  cpu          : usr=0.20%, sys=0.02%, ctx=504, majf=0, minf=15
  IO depths    : 1=2.2%, 2=6.7%, 4=21.5%, 8=60.9%, 16=8.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.8%, 8=1.1%, 16=6.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=5585/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=22340KB, aggrb=1116KB/s, minb=1116KB/s, maxb=1116KB/s, mint=20013msec, maxt=20013msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/1344KB/0KB /s] [0/336/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=5675: Fri Jun 17 20:23:14 2016
  write: io=21564KB, bw=1073.5KB/s, iops=268, runt= 20088msec
    slat (usec): min=1, max=2073, avg= 2.80, stdev=28.83
    clat (msec): min=3, max=2029, avg=59.58, stdev=196.16
     lat (msec): min=3, max=2029, avg=59.58, stdev=196.16
    clat percentiles (msec):
     |  1.00th=[    9],  5.00th=[   12], 10.00th=[   13], 20.00th=[   15],
     | 30.00th=[   17], 40.00th=[   17], 50.00th=[   18], 60.00th=[   19],
     | 70.00th=[   25], 80.00th=[   31], 90.00th=[   53], 95.00th=[  174],
     | 99.00th=[ 1123], 99.50th=[ 1483], 99.90th=[ 2024], 99.95th=[ 2024],
     | 99.99th=[ 2024]
    bw (KB  /s): min=   49, max= 3609, per=100.00%, avg=1428.48, stdev=1221.83
    lat (msec) : 4=0.06%, 10=3.36%, 20=62.47%, 50=23.50%, 100=3.10%
    lat (msec) : 250=3.69%, 500=1.08%, 750=0.82%, 1000=0.74%, 2000=1.00%
    lat (msec) : >=2000=0.19%
  cpu          : usr=0.11%, sys=0.10%, ctx=478, majf=0, minf=15
  IO depths    : 1=2.2%, 2=6.7%, 4=21.3%, 8=61.0%, 16=8.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.9%, 8=1.1%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=5391/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=21564KB, aggrb=1073KB/s, minb=1073KB/s, maxb=1073KB/s, mint=20088msec, maxt=20088msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/484KB/0KB /s] [0/121/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=5855: Fri Jun 17 20:23:35 2016
  write: io=23524KB, bw=1175.4KB/s, iops=293, runt= 20014msec
    slat (usec): min=1, max=167, avg= 2.28, stdev= 3.03
    clat (msec): min=2, max=1832, avg=54.41, stdev=189.46
     lat (msec): min=2, max=1832, avg=54.41, stdev=189.46
    clat percentiles (msec):
     |  1.00th=[    8],  5.00th=[   12], 10.00th=[   13], 20.00th=[   15],
     | 30.00th=[   17], 40.00th=[   17], 50.00th=[   18], 60.00th=[   20],
     | 70.00th=[   23], 80.00th=[   27], 90.00th=[   36], 95.00th=[  101],
     | 99.00th=[ 1287], 99.50th=[ 1500], 99.90th=[ 1762], 99.95th=[ 1827],
     | 99.99th=[ 1827]
    bw (KB  /s): min=   33, max= 3564, per=100.00%, avg=1563.84, stdev=1401.34
    lat (msec) : 4=0.12%, 10=3.28%, 20=62.91%, 50=27.05%, 100=1.62%
    lat (msec) : 250=1.33%, 500=1.14%, 750=0.60%, 1000=0.53%, 2000=1.43%
  cpu          : usr=0.18%, sys=0.05%, ctx=531, majf=0, minf=15
  IO depths    : 1=2.0%, 2=6.1%, 4=21.0%, 8=62.0%, 16=8.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.6%, 8=1.3%, 16=6.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=5881/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=23524KB, aggrb=1175KB/s, minb=1175KB/s, maxb=1175KB/s, mint=20014msec, maxt=20014msec
```

### RAND-READ
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [r(1)] [100.0% done] [32592KB/0KB/0KB /s] [8148/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=7048: Fri Jun 17 20:26:05 2016
  read : io=653252KB, bw=32659KB/s, iops=8164, runt= 20002msec
    slat (usec): min=0, max=253, avg= 1.36, stdev= 1.67
    clat (usec): min=1004, max=6146, avg=1931.34, stdev=429.27
     lat (usec): min=1005, max=6148, avg=1932.70, stdev=429.24
    clat percentiles (usec):
     |  1.00th=[ 1336],  5.00th=[ 1496], 10.00th=[ 1560], 20.00th=[ 1672],
     | 30.00th=[ 1736], 40.00th=[ 1784], 50.00th=[ 1816], 60.00th=[ 1864],
     | 70.00th=[ 1944], 80.00th=[ 2160], 90.00th=[ 2384], 95.00th=[ 2960],
     | 99.00th=[ 3536], 99.50th=[ 3664], 99.90th=[ 4128], 99.95th=[ 4512],
     | 99.99th=[ 5408]
    bw (KB  /s): min=28998, max=33804, per=100.00%, avg=32680.56, stdev=794.20
    lat (msec) : 2=74.23%, 4=25.62%, 10=0.15%
  cpu          : usr=2.81%, sys=1.19%, ctx=12150, majf=0, minf=17
  IO depths    : 1=3.1%, 2=9.1%, 4=23.8%, 8=55.3%, 16=8.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.7%, 8=0.3%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=163313/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=653252KB, aggrb=32659KB/s, minb=32659KB/s, maxb=32659KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [r(1)] [100.0% done] [35872KB/0KB/0KB /s] [8968/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=6868: Fri Jun 17 20:25:45 2016
  read : io=667444KB, bw=33371KB/s, iops=8342, runt= 20001msec
    slat (usec): min=0, max=174, avg= 1.31, stdev= 1.71
    clat (usec): min=883, max=6302, avg=1890.89, stdev=446.30
     lat (usec): min=883, max=6303, avg=1892.19, stdev=446.28
    clat percentiles (usec):
     |  1.00th=[ 1272],  5.00th=[ 1432], 10.00th=[ 1496], 20.00th=[ 1576],
     | 30.00th=[ 1656], 40.00th=[ 1720], 50.00th=[ 1784], 60.00th=[ 1848],
     | 70.00th=[ 1912], 80.00th=[ 2128], 90.00th=[ 2384], 95.00th=[ 2928],
     | 99.00th=[ 3504], 99.50th=[ 3632], 99.90th=[ 4128], 99.95th=[ 4576],
     | 99.99th=[ 5280]
    bw (KB  /s): min=28416, max=37624, per=99.78%, avg=33298.15, stdev=2037.66
    lat (usec) : 1000=0.01%
    lat (msec) : 2=75.36%, 4=24.49%, 10=0.14%
  cpu          : usr=2.81%, sys=1.12%, ctx=12592, majf=0, minf=17
  IO depths    : 1=3.0%, 2=8.9%, 4=23.7%, 8=55.7%, 16=8.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.6%, 8=0.4%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=166861/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=667444KB, aggrb=33370KB/s, minb=33370KB/s, maxb=33370KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [r(1)] [50.0% done] [33004KB/0KB/0KB /s] [8251/0/0 iops] [eta 00m:10s]
Jobs: 1 (f=1): [r(1)] [100.0% done] [33294KB/0KB/0KB /s] [8323/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=6691: Fri Jun 17 20:25:25 2016
  read : io=660040KB, bw=32999KB/s, iops=8249, runt= 20002msec
    slat (usec): min=0, max=355, avg= 1.37, stdev= 2.06
    clat (usec): min=893, max=7230, avg=1911.06, stdev=436.95
     lat (usec): min=894, max=7231, avg=1912.43, stdev=436.92
    clat percentiles (usec):
     |  1.00th=[ 1304],  5.00th=[ 1464], 10.00th=[ 1528], 20.00th=[ 1624],
     | 30.00th=[ 1704], 40.00th=[ 1752], 50.00th=[ 1800], 60.00th=[ 1848],
     | 70.00th=[ 1928], 80.00th=[ 2128], 90.00th=[ 2384], 95.00th=[ 2960],
     | 99.00th=[ 3536], 99.50th=[ 3664], 99.90th=[ 4048], 99.95th=[ 4448],
     | 99.99th=[ 5216]
    bw (KB  /s): min=31528, max=37280, per=100.00%, avg=33033.82, stdev=1114.62
    lat (usec) : 1000=0.01%
    lat (msec) : 2=75.19%, 4=24.68%, 10=0.13%
  cpu          : usr=2.98%, sys=1.08%, ctx=12421, majf=0, minf=17
  IO depths    : 1=3.1%, 2=9.0%, 4=23.9%, 8=55.3%, 16=8.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.7%, 8=0.3%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=165010/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=660040KB, aggrb=32998KB/s, minb=32998KB/s, maxb=32998KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [r(1)] [100.0% done] [32752KB/0KB/0KB /s] [8188/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=6507: Fri Jun 17 20:25:04 2016
  read : io=679704KB, bw=33984KB/s, iops=8495, runt= 20001msec
    slat (usec): min=0, max=556, avg= 1.25, stdev= 2.32
    clat (usec): min=977, max=8036, avg=1856.90, stdev=447.21
     lat (usec): min=978, max=8037, avg=1858.15, stdev=447.18
    clat percentiles (usec):
     |  1.00th=[ 1256],  5.00th=[ 1400], 10.00th=[ 1480], 20.00th=[ 1560],
     | 30.00th=[ 1624], 40.00th=[ 1688], 50.00th=[ 1752], 60.00th=[ 1816],
     | 70.00th=[ 1880], 80.00th=[ 2024], 90.00th=[ 2352], 95.00th=[ 2928],
     | 99.00th=[ 3472], 99.50th=[ 3632], 99.90th=[ 4048], 99.95th=[ 4384],
     | 99.99th=[ 6176]
    bw (KB  /s): min=29005, max=37836, per=100.00%, avg=34059.28, stdev=2194.62
    lat (usec) : 1000=0.01%
    lat (msec) : 2=79.25%, 4=20.63%, 10=0.12%
  cpu          : usr=2.82%, sys=1.12%, ctx=12834, majf=0, minf=17
  IO depths    : 1=2.9%, 2=8.6%, 4=23.5%, 8=56.1%, 16=8.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.6%, 8=0.4%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=169926/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=679704KB, aggrb=33983KB/s, minb=33983KB/s, maxb=33983KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [r(1)] [100.0% done] [32471KB/0KB/0KB /s] [8117/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=6329: Fri Jun 17 20:24:44 2016
  read : io=648792KB, bw=32436KB/s, iops=8109, runt= 20002msec
    slat (usec): min=0, max=319, avg= 1.33, stdev= 1.79
    clat (usec): min=991, max=6172, avg=1944.64, stdev=427.64
     lat (usec): min=992, max=6174, avg=1945.96, stdev=427.61
    clat percentiles (usec):
     |  1.00th=[ 1352],  5.00th=[ 1496], 10.00th=[ 1576], 20.00th=[ 1688],
     | 30.00th=[ 1736], 40.00th=[ 1784], 50.00th=[ 1832], 60.00th=[ 1880],
     | 70.00th=[ 1960], 80.00th=[ 2192], 90.00th=[ 2384], 95.00th=[ 2960],
     | 99.00th=[ 3536], 99.50th=[ 3664], 99.90th=[ 4192], 99.95th=[ 4768],
     | 99.99th=[ 5536]
    bw (KB  /s): min=29333, max=33692, per=100.00%, avg=32468.97, stdev=887.55
    lat (usec) : 1000=0.01%
    lat (msec) : 2=72.47%, 4=27.37%, 10=0.16%
  cpu          : usr=2.61%, sys=1.36%, ctx=12026, majf=0, minf=17
  IO depths    : 1=3.2%, 2=9.2%, 4=24.0%, 8=55.1%, 16=8.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.7%, 8=0.3%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=162198/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=648792KB, aggrb=32436KB/s, minb=32436KB/s, maxb=32436KB/s, mint=20002msec, maxt=20002msec
```

### RAND-READ-WRITE
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [m(1)] [100.0% done] [1892KB/1688KB/0KB /s] [473/422/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=7744: Fri Jun 17 20:27:42 2016
  read : io=14492KB, bw=741249B/s, iops=180, runt= 20020msec
    slat (usec): min=1, max=101, avg= 2.43, stdev= 4.35
    clat (usec): min=779, max=1145.5K, avg=22326.65, stdev=101688.90
     lat (usec): min=785, max=1145.5K, avg=22329.09, stdev=101688.95
    clat percentiles (usec):
     |  1.00th=[ 1012],  5.00th=[ 1352], 10.00th=[ 1576], 20.00th=[ 1928],
     | 30.00th=[ 2256], 40.00th=[ 2480], 50.00th=[ 2928], 60.00th=[ 8384],
     | 70.00th=[12992], 80.00th=[15680], 90.00th=[18048], 95.00th=[25728],
     | 99.00th=[610304], 99.50th=[946176], 99.90th=[1138688], 99.95th=[1138688],
     | 99.99th=[1138688]
    bw (KB  /s): min=   62, max= 2868, per=100.00%, avg=877.12, stdev=833.17
  write: io=14468KB, bw=740021B/s, iops=180, runt= 20020msec
    slat (usec): min=0, max=181, avg= 2.70, stdev= 5.08
    clat (msec): min=3, max=1221, avg=66.07, stdev=176.15
     lat (msec): min=3, max=1221, avg=66.07, stdev=176.15
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    9], 10.00th=[   12], 20.00th=[   15],
     | 30.00th=[   16], 40.00th=[   17], 50.00th=[   18], 60.00th=[   19],
     | 70.00th=[   22], 80.00th=[   29], 90.00th=[   75], 95.00th=[  424],
     | 99.00th=[ 1029], 99.50th=[ 1090], 99.90th=[ 1172], 99.95th=[ 1221],
     | 99.99th=[ 1221]
    bw (KB  /s): min=    7, max= 2645, per=100.00%, avg=874.64, stdev=840.52
    lat (usec) : 1000=0.46%
    lat (msec) : 2=10.36%, 4=15.62%, 10=9.81%, 20=43.65%, 50=12.56%
    lat (msec) : 100=1.84%, 250=1.38%, 500=1.62%, 750=1.10%, 1000=0.90%
    lat (msec) : 2000=0.72%
  cpu          : usr=0.22%, sys=0.10%, ctx=882, majf=0, minf=16
  IO depths    : 1=1.6%, 2=5.1%, 4=16.8%, 8=65.2%, 16=11.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.4%, 8=2.5%, 16=5.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=3623/w=3617/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=14492KB, aggrb=723KB/s, minb=723KB/s, maxb=723KB/s, mint=20020msec, maxt=20020msec
  WRITE: io=14468KB, aggrb=722KB/s, minb=722KB/s, maxb=722KB/s, mint=20020msec, maxt=20020msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [m(1)] [0.4% done] [224KB/212KB/0KB /s] [56/53/0 iops] [eta 01h:20m:28s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=7558: Fri Jun 17 20:27:22 2016
  read : io=22744KB, bw=1085.8KB/s, iops=271, runt= 20948msec
    slat (usec): min=0, max=206, avg= 2.31, stdev= 4.71
    clat (usec): min=764, max=1155.5K, avg=12947.39, stdev=61489.99
     lat (usec): min=770, max=1155.5K, avg=12949.70, stdev=61490.01
    clat percentiles (usec):
     |  1.00th=[  980],  5.00th=[ 1240], 10.00th=[ 1480], 20.00th=[ 1864],
     | 30.00th=[ 2192], 40.00th=[ 2384], 50.00th=[ 2640], 60.00th=[ 7328],
     | 70.00th=[11584], 80.00th=[14272], 90.00th=[16768], 95.00th=[18560],
     | 99.00th=[164864], 99.50th=[643072], 99.90th=[806912], 99.95th=[995328],
     | 99.99th=[1155072]
    bw (KB  /s): min=   18, max= 2942, per=100.00%, avg=1429.62, stdev=1113.42
  write: io=22724KB, bw=1084.8KB/s, iops=271, runt= 20948msec
    slat (usec): min=0, max=193, avg= 2.59, stdev= 4.75
    clat (msec): min=3, max=1509, avg=45.96, stdev=153.49
     lat (msec): min=3, max=1509, avg=45.96, stdev=153.49
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    9], 10.00th=[   11], 20.00th=[   14],
     | 30.00th=[   15], 40.00th=[   16], 50.00th=[   17], 60.00th=[   18],
     | 70.00th=[   20], 80.00th=[   23], 90.00th=[   32], 95.00th=[   76],
     | 99.00th=[ 1057], 99.50th=[ 1156], 99.90th=[ 1385], 99.95th=[ 1467],
     | 99.99th=[ 1516]
    bw (KB  /s): min=   80, max= 2809, per=100.00%, avg=1382.30, stdev=1117.06
    lat (usec) : 1000=0.66%
    lat (msec) : 2=11.13%, 4=16.01%, 10=8.23%, 20=48.42%, 50=11.87%
    lat (msec) : 100=0.69%, 250=0.85%, 500=0.69%, 750=0.31%, 1000=0.56%
    lat (msec) : 2000=0.56%
  cpu          : usr=0.32%, sys=0.17%, ctx=1396, majf=0, minf=16
  IO depths    : 1=1.5%, 2=5.3%, 4=17.0%, 8=64.5%, 16=11.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.5%, 8=2.4%, 16=5.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=5686/w=5681/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=22744KB, aggrb=1085KB/s, minb=1085KB/s, maxb=1085KB/s, mint=20948msec, maxt=20948msec
  WRITE: io=22724KB, aggrb=1084KB/s, minb=1084KB/s, maxb=1084KB/s, mint=20948msec, maxt=20948msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=0): [m(1)] [0.3% done] [132KB/108KB/0KB /s] [33/27/0 iops] [eta 01h:48m:36s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=7921: Fri Jun 17 20:28:04 2016
  read : io=16856KB, bw=840911B/s, iops=205, runt= 20526msec
    slat (usec): min=0, max=121, avg= 2.27, stdev= 2.79
    clat (usec): min=738, max=1220.4K, avg=23418.17, stdev=106023.16
     lat (usec): min=742, max=1220.4K, avg=23420.44, stdev=106023.24
    clat percentiles (usec):
     |  1.00th=[  964],  5.00th=[ 1208], 10.00th=[ 1384], 20.00th=[ 1784],
     | 30.00th=[ 2128], 40.00th=[ 2384], 50.00th=[ 2640], 60.00th=[ 8160],
     | 70.00th=[11840], 80.00th=[15040], 90.00th=[18304], 95.00th=[41216],
     | 99.00th=[700416], 99.50th=[962560], 99.90th=[1105920], 99.95th=[1105920],
     | 99.99th=[1220608]
    bw (KB  /s): min=   28, max= 2815, per=100.00%, avg=980.89, stdev=919.07
  write: io=16828KB, bw=839514B/s, iops=204, runt= 20526msec
    slat (usec): min=0, max=32, avg= 2.45, stdev= 2.16
    clat (msec): min=2, max=1360, avg=52.93, stdev=162.03
     lat (msec): min=3, max=1360, avg=52.94, stdev=162.03
    clat percentiles (msec):
     |  1.00th=[    6],  5.00th=[    9], 10.00th=[   11], 20.00th=[   14],
     | 30.00th=[   16], 40.00th=[   17], 50.00th=[   18], 60.00th=[   19],
     | 70.00th=[   21], 80.00th=[   26], 90.00th=[   45], 95.00th=[  198],
     | 99.00th=[ 1020], 99.50th=[ 1106], 99.90th=[ 1319], 99.95th=[ 1336],
     | 99.99th=[ 1369]
    bw (KB  /s): min=   28, max= 2827, per=100.00%, avg=983.56, stdev=924.24
    lat (usec) : 750=0.01%, 1000=0.74%
    lat (msec) : 2=12.34%, 4=14.57%, 10=9.54%, 20=43.21%, 50=13.00%
    lat (msec) : 100=2.39%, 250=0.75%, 500=1.29%, 750=0.61%, 1000=0.82%
    lat (msec) : 2000=0.74%
  cpu          : usr=0.19%, sys=0.18%, ctx=1040, majf=0, minf=16
  IO depths    : 1=1.6%, 2=5.0%, 4=16.4%, 8=64.8%, 16=12.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.5%, 8=2.5%, 16=4.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=4214/w=4207/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=16856KB, aggrb=821KB/s, minb=821KB/s, maxb=821KB/s, mint=20526msec, maxt=20526msec
  WRITE: io=16828KB, aggrb=819KB/s, minb=819KB/s, maxb=819KB/s, mint=20526msec, maxt=20526msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [m(1)] [100.0% done] [156KB/116KB/0KB /s] [39/29/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=8104: Fri Jun 17 20:28:24 2016
  read : io=16292KB, bw=833691B/s, iops=203, runt= 20011msec
    slat (usec): min=0, max=187, avg= 2.26, stdev= 4.45
    clat (usec): min=763, max=1210.6K, avg=18949.66, stdev=100032.71
     lat (usec): min=769, max=1210.6K, avg=18951.92, stdev=100032.68
    clat percentiles (usec):
     |  1.00th=[ 1064],  5.00th=[ 1288], 10.00th=[ 1512], 20.00th=[ 1864],
     | 30.00th=[ 2160], 40.00th=[ 2384], 50.00th=[ 2640], 60.00th=[ 7584],
     | 70.00th=[11840], 80.00th=[14400], 90.00th=[17792], 95.00th=[20608],
     | 99.00th=[651264], 99.50th=[913408], 99.90th=[1171456], 99.95th=[1171456],
     | 99.99th=[1204224]
    bw (KB  /s): min=   94, max= 2867, per=100.00%, avg=1117.04, stdev=1067.60
  write: io=16332KB, bw=835738B/s, iops=204, runt= 20011msec
    slat (usec): min=0, max=130, avg= 2.42, stdev= 2.95
    clat (msec): min=3, max=1276, avg=59.43, stdev=188.65
     lat (msec): min=3, max=1276, avg=59.44, stdev=188.65
    clat percentiles (msec):
     |  1.00th=[    6],  5.00th=[    9], 10.00th=[   12], 20.00th=[   14],
     | 30.00th=[   16], 40.00th=[   17], 50.00th=[   18], 60.00th=[   19],
     | 70.00th=[   21], 80.00th=[   25], 90.00th=[   42], 95.00th=[  103],
     | 99.00th=[ 1106], 99.50th=[ 1172], 99.90th=[ 1254], 99.95th=[ 1254],
     | 99.99th=[ 1270]
    bw (KB  /s): min=   65, max= 2666, per=100.00%, avg=1111.09, stdev=1047.97
    lat (usec) : 1000=0.34%
    lat (msec) : 2=11.93%, 4=15.40%, 10=8.71%, 20=45.46%, 50=13.17%
    lat (msec) : 100=1.78%, 250=0.27%, 500=0.20%, 750=0.74%, 1000=1.04%
    lat (msec) : 2000=0.97%
  cpu          : usr=0.24%, sys=0.11%, ctx=951, majf=0, minf=16
  IO depths    : 1=1.6%, 2=5.3%, 4=16.8%, 8=65.0%, 16=11.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.3%, 8=2.7%, 16=5.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=4073/w=4083/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=16292KB, aggrb=814KB/s, minb=814KB/s, maxb=814KB/s, mint=20011msec, maxt=20011msec
  WRITE: io=16332KB, aggrb=816KB/s, minb=816KB/s, maxb=816KB/s, mint=20011msec, maxt=20011msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [m(1)] [100.0% done] [100KB/116KB/0KB /s] [25/29/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=8284: Fri Jun 17 20:28:45 2016
  read : io=20572KB, bw=994.75KB/s, iops=248, runt= 20681msec
    slat (usec): min=0, max=351, avg= 2.40, stdev= 5.85
    clat (usec): min=699, max=1465.3K, avg=14136.04, stdev=73027.73
     lat (usec): min=706, max=1465.3K, avg=14138.44, stdev=73027.84
    clat percentiles (usec):
     |  1.00th=[  996],  5.00th=[ 1304], 10.00th=[ 1464], 20.00th=[ 1832],
     | 30.00th=[ 2192], 40.00th=[ 2416], 50.00th=[ 2704], 60.00th=[ 8160],
     | 70.00th=[11968], 80.00th=[14656], 90.00th=[17024], 95.00th=[19072],
     | 99.00th=[164864], 99.50th=[569344], 99.90th=[1318912], 99.95th=[1318912],
     | 99.99th=[1466368]
    bw (KB  /s): min=   70, max= 2898, per=100.00%, avg=1332.96, stdev=1114.12
  write: io=20732KB, bw=1002.5KB/s, iops=250, runt= 20681msec
    slat (usec): min=1, max=358, avg= 2.75, stdev= 7.71
    clat (msec): min=3, max=1604, avg=49.74, stdev=160.78
     lat (msec): min=3, max=1604, avg=49.74, stdev=160.78
    clat percentiles (msec):
     |  1.00th=[    5],  5.00th=[    9], 10.00th=[   12], 20.00th=[   14],
     | 30.00th=[   15], 40.00th=[   17], 50.00th=[   18], 60.00th=[   19],
     | 70.00th=[   20], 80.00th=[   24], 90.00th=[   35], 95.00th=[  118],
     | 99.00th=[  996], 99.50th=[ 1319], 99.90th=[ 1532], 99.95th=[ 1598],
     | 99.99th=[ 1598]
    bw (KB  /s): min=   91, max= 2784, per=100.00%, avg=1343.64, stdev=1125.86
    lat (usec) : 750=0.01%, 1000=0.50%
    lat (msec) : 2=11.47%, 4=15.04%, 10=8.49%, 20=47.77%, 50=11.89%
    lat (msec) : 100=1.65%, 250=0.85%, 500=0.63%, 750=0.71%, 1000=0.41%
    lat (msec) : 2000=0.58%
  cpu          : usr=0.36%, sys=0.09%, ctx=1215, majf=0, minf=16
  IO depths    : 1=1.6%, 2=5.1%, 4=16.7%, 8=65.1%, 16=11.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.3%, 8=2.7%, 16=5.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=5143/w=5183/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=20572KB, aggrb=994KB/s, minb=994KB/s, maxb=994KB/s, mint=20681msec, maxt=20681msec
  WRITE: io=20732KB, aggrb=1002KB/s, minb=1002KB/s, maxb=1002KB/s, mint=20681msec, maxt=20681msec
```

# Throughput Write
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=0): [W(1)] [46.9% done] [0KB/0KB/0KB /s] [0/0/0 iops] [eta 01m:16s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=11515: Fri Jun 17 20:37:44 2016
  write: io=2396.0MB, bw=38317KB/s, iops=9, runt= 64032msec
    slat (usec): min=192, max=11303, avg=1100.37, stdev=1224.64
    clat (msec): min=110, max=8668, avg=1663.49, stdev=1757.83
     lat (msec): min=111, max=8669, avg=1664.59, stdev=1757.75
    clat percentiles (msec):
     |  1.00th=[  188],  5.00th=[  351], 10.00th=[  424], 20.00th=[  562],
     | 30.00th=[  635], 40.00th=[  676], 50.00th=[  930], 60.00th=[ 1074],
     | 70.00th=[ 1319], 80.00th=[ 2671], 90.00th=[ 4178], 95.00th=[ 5997],
     | 99.00th=[ 7635], 99.50th=[ 8717], 99.90th=[ 8717], 99.95th=[ 8717],
     | 99.99th=[ 8717]
    bw (KB  /s): min= 1298, max=116889, per=100.00%, avg=61712.14, stdev=37520.25
    lat (msec) : 250=1.67%, 500=17.20%, 750=21.20%, 1000=14.52%, 2000=19.53%
    lat (msec) : >=2000=25.88%
  cpu          : usr=0.79%, sys=0.02%, ctx=219, majf=0, minf=14
  IO depths    : 1=2.7%, 2=6.3%, 4=20.4%, 8=60.6%, 16=10.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.7%, 8=1.7%, 16=5.6%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=599/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=2396.0MB, aggrb=38316KB/s, minb=38316KB/s, maxb=38316KB/s, mint=64032msec, maxt=64032msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [18.1% done] [0KB/0KB/0KB /s] [0/0/0 iops] [eta 05m:57s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=10990: Fri Jun 17 20:36:37 2016
  write: io=946176KB, bw=12261KB/s, iops=2, runt= 77168msec
    slat (usec): min=194, max=14061, avg=996.16, stdev=1187.29
    clat (msec): min=90, max=32426, avg=5184.68, stdev=7724.13
     lat (msec): min=90, max=32427, avg=5185.68, stdev=7724.07
    clat percentiles (msec):
     |  1.00th=[  139],  5.00th=[  253], 10.00th=[  367], 20.00th=[  478],
     | 30.00th=[  578], 40.00th=[ 1004], 50.00th=[ 2868], 60.00th=[ 3556],
     | 70.00th=[ 4686], 80.00th=[ 5800], 90.00th=[13042], 95.00th=[16712],
     | 99.00th=[16712], 99.50th=[16712], 99.90th=[16712], 99.95th=[16712],
     | 99.99th=[16712]
    bw (KB  /s): min=  293, max=112604, per=100.00%, avg=45557.05, stdev=42318.28
    lat (msec) : 100=0.87%, 250=3.90%, 500=16.02%, 750=16.88%, 1000=1.73%
    lat (msec) : 2000=3.03%, >=2000=57.58%
  cpu          : usr=0.25%, sys=0.00%, ctx=91, majf=0, minf=14
  IO depths    : 1=2.2%, 2=4.3%, 4=14.7%, 8=66.2%, 16=12.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.7%, 8=1.9%, 16=5.4%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=231/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=946176KB, aggrb=12261KB/s, minb=12261KB/s, maxb=12261KB/s, mint=77168msec, maxt=77168msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=0): [W(1)] [48.1% done] [0KB/0KB/0KB /s] [0/0/0 iops] [eta 01m:09s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=10528: Fri Jun 17 20:35:15 2016
  write: io=2456.0MB, bw=40410KB/s, iops=9, runt= 62236msec
    slat (usec): min=196, max=17114, avg=1253.98, stdev=1706.75
    clat (msec): min=196, max=9682, avg=1590.02, stdev=1740.01
     lat (msec): min=197, max=9683, avg=1591.27, stdev=1740.05
    clat percentiles (msec):
     |  1.00th=[  208],  5.00th=[  330], 10.00th=[  379], 20.00th=[  537],
     | 30.00th=[  611], 40.00th=[  652], 50.00th=[  775], 60.00th=[  971],
     | 70.00th=[ 1254], 80.00th=[ 2868], 90.00th=[ 4113], 95.00th=[ 4752],
     | 99.00th=[ 9634], 99.50th=[ 9634], 99.90th=[ 9634], 99.95th=[ 9634],
     | 99.99th=[ 9634]
    bw (KB  /s): min= 3596, max=122591, per=100.00%, avg=69381.37, stdev=40414.08
    lat (msec) : 250=1.79%, 500=15.47%, 750=31.27%, 1000=11.73%, 2000=12.05%
    lat (msec) : >=2000=27.69%
  cpu          : usr=0.87%, sys=0.01%, ctx=222, majf=0, minf=14
  IO depths    : 1=2.0%, 2=6.2%, 4=18.6%, 8=63.4%, 16=9.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.2%, 8=2.1%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=614/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=2456.0MB, aggrb=40409KB/s, minb=40409KB/s, maxb=40409KB/s, mint=62236msec, maxt=62236msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [20.6% done] [0KB/0KB/0KB /s] [0/0/0 iops] [eta 04m:10s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=10081: Fri Jun 17 20:34:10 2016
  write: io=1120.0MB, bw=17768KB/s, iops=4, runt= 64547msec
    slat (usec): min=193, max=8010, avg=1031.14, stdev=1081.85
    clat (msec): min=102, max=18111, avg=3682.36, stdev=4615.64
     lat (msec): min=103, max=18112, avg=3683.39, stdev=4615.56
    clat percentiles (msec):
     |  1.00th=[  114],  5.00th=[  204], 10.00th=[  285], 20.00th=[  486],
     | 30.00th=[  578], 40.00th=[  676], 50.00th=[ 1450], 60.00th=[ 2966],
     | 70.00th=[ 4228], 80.00th=[ 5276], 90.00th=[12911], 95.00th=[14222],
     | 99.00th=[16712], 99.50th=[16712], 99.90th=[16712], 99.95th=[16712],
     | 99.99th=[16712]
    bw (KB  /s): min=  781, max=130031, per=100.00%, avg=55190.77, stdev=45677.66
    lat (msec) : 250=9.29%, 500=15.00%, 750=17.14%, 1000=5.00%, 2000=7.50%
    lat (msec) : >=2000=46.07%
  cpu          : usr=0.36%, sys=0.01%, ctx=118, majf=0, minf=14
  IO depths    : 1=1.8%, 2=4.3%, 4=14.6%, 8=65.0%, 16=14.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.5%, 8=1.9%, 16=4.7%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=280/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=1120.0MB, aggrb=17768KB/s, minb=17768KB/s, maxb=17768KB/s, mint=64547msec, maxt=64547msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=0): [W(1)] [52.5% done] [0KB/8192KB/0KB /s] [0/2/0 iops] [eta 00m:57s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=9646: Fri Jun 17 20:33:05 2016
  write: io=2648.0MB, bw=44326KB/s, iops=10, runt= 61173msec
    slat (usec): min=196, max=8612, avg=1000.73, stdev=1018.80
    clat (msec): min=281, max=6900, avg=1456.49, stdev=1317.91
     lat (msec): min=282, max=6900, avg=1457.49, stdev=1317.92
    clat percentiles (msec):
     |  1.00th=[  351],  5.00th=[  469], 10.00th=[  529], 20.00th=[  570],
     | 30.00th=[  603], 40.00th=[  652], 50.00th=[  775], 60.00th=[ 1037],
     | 70.00th=[ 1500], 80.00th=[ 2737], 90.00th=[ 3359], 95.00th=[ 4424],
     | 99.00th=[ 5800], 99.50th=[ 6259], 99.90th=[ 6915], 99.95th=[ 6915],
     | 99.99th=[ 6915]
    bw (KB  /s): min= 7353, max=122268, per=100.00%, avg=68201.64, stdev=38000.82
    lat (msec) : 500=6.80%, 750=41.39%, 1000=9.67%, 2000=15.41%, >=2000=26.74%
  cpu          : usr=0.89%, sys=0.01%, ctx=222, majf=0, minf=14
  IO depths    : 1=2.6%, 2=7.9%, 4=23.7%, 8=57.6%, 16=8.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.2%, 8=0.6%, 16=6.3%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=662/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=2648.0MB, aggrb=44325KB/s, minb=44325KB/s, maxb=44325KB/s, mint=61173msec, maxt=61173msec
```

# Throughput Read
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [123.9MB/0KB/0KB /s] [30/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=14936: Fri Jun 17 20:45:37 2016
  read : io=5120.0MB, bw=112811KB/s, iops=27, runt= 46475msec
    slat (usec): min=0, max=44, avg= 2.78, stdev= 5.14
    clat (msec): min=314, max=1443, avg=579.41, stdev=167.90
     lat (msec): min=314, max=1443, avg=579.41, stdev=167.90
    clat percentiles (msec):
     |  1.00th=[  375],  5.00th=[  420], 10.00th=[  441], 20.00th=[  469],
     | 30.00th=[  498], 40.00th=[  519], 50.00th=[  537], 60.00th=[  553],
     | 70.00th=[  570], 80.00th=[  594], 90.00th=[  898], 95.00th=[ 1004],
     | 99.00th=[ 1074], 99.50th=[ 1090], 99.90th=[ 1352], 99.95th=[ 1450],
     | 99.99th=[ 1450]
    bw (KB  /s): min= 7420, max=144943, per=98.64%, avg=111277.34, stdev=16592.78
    lat (msec) : 500=31.41%, 750=54.53%, 1000=8.91%, 2000=5.16%
  cpu          : usr=0.02%, sys=0.01%, ctx=125, majf=0, minf=16
  IO depths    : 1=2.0%, 2=7.4%, 4=26.3%, 8=57.1%, 16=7.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.3%, 8=0.0%, 16=6.7%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=112810KB/s, minb=112810KB/s, maxb=112810KB/s, mint=46475msec, maxt=46475msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [116.0MB/0KB/0KB /s] [29/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=14600: Fri Jun 17 20:44:50 2016
  read : io=5120.0MB, bw=112794KB/s, iops=27, runt= 46482msec
    slat (usec): min=0, max=64, avg= 2.60, stdev= 4.92
    clat (msec): min=295, max=1462, avg=579.63, stdev=159.50
     lat (msec): min=295, max=1462, avg=579.63, stdev=159.50
    clat percentiles (msec):
     |  1.00th=[  371],  5.00th=[  416], 10.00th=[  433], 20.00th=[  474],
     | 30.00th=[  506], 40.00th=[  529], 50.00th=[  545], 60.00th=[  570],
     | 70.00th=[  586], 80.00th=[  594], 90.00th=[  881], 95.00th=[  963],
     | 99.00th=[ 1074], 99.50th=[ 1139], 99.90th=[ 1254], 99.95th=[ 1467],
     | 99.99th=[ 1467]
    bw (KB  /s): min= 7861, max=134898, per=98.90%, avg=111548.63, stdev=15798.22
    lat (msec) : 500=26.95%, 750=59.61%, 1000=10.31%, 2000=3.12%
  cpu          : usr=0.03%, sys=0.00%, ctx=112, majf=0, minf=16
  IO depths    : 1=2.3%, 2=8.0%, 4=25.3%, 8=57.2%, 16=7.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.3%, 8=0.0%, 16=6.7%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=112793KB/s, minb=112793KB/s, maxb=112793KB/s, mint=46482msec, maxt=46482msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [119.1MB/0KB/0KB /s] [29/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=14264: Fri Jun 17 20:44:03 2016
  read : io=5120.0MB, bw=112474KB/s, iops=27, runt= 46614msec
    slat (usec): min=0, max=82, avg= 2.49, stdev= 5.34
    clat (msec): min=263, max=1142, avg=580.97, stdev=149.00
     lat (msec): min=263, max=1142, avg=580.97, stdev=149.00
    clat percentiles (msec):
     |  1.00th=[  424],  5.00th=[  453], 10.00th=[  465], 20.00th=[  498],
     | 30.00th=[  519], 40.00th=[  529], 50.00th=[  545], 60.00th=[  562],
     | 70.00th=[  586], 80.00th=[  594], 90.00th=[  848], 95.00th=[  988],
     | 99.00th=[ 1090], 99.50th=[ 1090], 99.90th=[ 1123], 99.95th=[ 1139],
     | 99.99th=[ 1139]
    bw (KB  /s): min= 6930, max=156038, per=99.38%, avg=111771.21, stdev=15847.26
    lat (msec) : 500=22.42%, 750=67.19%, 1000=5.47%, 2000=4.92%
  cpu          : usr=0.02%, sys=0.00%, ctx=112, majf=0, minf=16
  IO depths    : 1=3.0%, 2=8.8%, 4=26.2%, 8=55.1%, 16=6.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.5%, 8=0.1%, 16=6.4%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=112474KB/s, minb=112474KB/s, maxb=112474KB/s, mint=46614msec, maxt=46614msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [108.0MB/0KB/0KB /s] [27/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=13928: Fri Jun 17 20:43:16 2016
  read : io=5120.0MB, bw=113069KB/s, iops=27, runt= 46369msec
    slat (usec): min=0, max=36, avg= 2.61, stdev= 4.99
    clat (msec): min=106, max=1328, avg=578.46, stdev=166.04
     lat (msec): min=106, max=1328, avg=578.47, stdev=166.04
    clat percentiles (msec):
     |  1.00th=[  404],  5.00th=[  437], 10.00th=[  453], 20.00th=[  478],
     | 30.00th=[  502], 40.00th=[  523], 50.00th=[  537], 60.00th=[  545],
     | 70.00th=[  562], 80.00th=[  578], 90.00th=[  930], 95.00th=[  988],
     | 99.00th=[ 1074], 99.50th=[ 1106], 99.90th=[ 1139], 99.95th=[ 1336],
     | 99.99th=[ 1336]
    bw (KB  /s): min= 7699, max=129955, per=98.57%, avg=111453.12, stdev=15730.49
    lat (msec) : 250=0.16%, 500=29.14%, 750=56.88%, 1000=9.22%, 2000=4.61%
  cpu          : usr=0.03%, sys=0.00%, ctx=113, majf=0, minf=16
  IO depths    : 1=2.0%, 2=7.6%, 4=26.5%, 8=56.9%, 16=7.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.4%, 8=0.0%, 16=6.6%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=113068KB/s, minb=113068KB/s, maxb=113068KB/s, mint=46369msec, maxt=46369msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [127.9MB/0KB/0KB /s] [31/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=13592: Fri Jun 17 20:42:30 2016
  read : io=5120.0MB, bw=112944KB/s, iops=27, runt= 46420msec
    slat (usec): min=0, max=40, avg= 2.40, stdev= 4.91
    clat (msec): min=180, max=1133, avg=578.64, stdev=158.14
     lat (msec): min=180, max=1133, avg=578.64, stdev=158.14
    clat percentiles (msec):
     |  1.00th=[  424],  5.00th=[  465], 10.00th=[  474], 20.00th=[  486],
     | 30.00th=[  502], 40.00th=[  523], 50.00th=[  537], 60.00th=[  545],
     | 70.00th=[  562], 80.00th=[  586], 90.00th=[  922], 95.00th=[ 1012],
     | 99.00th=[ 1074], 99.50th=[ 1090], 99.90th=[ 1123], 99.95th=[ 1139],
     | 99.99th=[ 1139]
    bw (KB  /s): min=51898, max=178891, per=100.00%, avg=113471.06, stdev=12907.80
    lat (msec) : 250=0.16%, 500=28.59%, 750=59.84%, 1000=5.23%, 2000=6.17%
  cpu          : usr=0.02%, sys=0.00%, ctx=111, majf=0, minf=16
  IO depths    : 1=2.1%, 2=8.2%, 4=27.1%, 8=55.6%, 16=7.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.4%, 8=0.1%, 16=6.5%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=112944KB/s, minb=112944KB/s, maxb=112944KB/s, mint=46420msec, maxt=46420msec
```
