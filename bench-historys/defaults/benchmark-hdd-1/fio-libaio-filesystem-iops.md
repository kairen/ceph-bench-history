# rados file system using fio-libaio

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
libaio-filesystem: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

fio: terminating on signal 2

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=31563: Sat Jun 18 00:38:03 2016
  write: io=462848B, bw=463775B/s, iops=113, runt=   998msec
    slat (msec): min=7, max=56, avg= 8.82, stdev= 4.49
    clat (usec): min=4, max=127240, avg=117094.96, stdev=26481.72
     lat (msec): min=8, max=182, avg=125.92, stdev=27.01
    clat percentiles (msec):
     |  1.00th=[    9],  5.00th=[   43], 10.00th=[   93], 20.00th=[  126],
     | 30.00th=[  126], 40.00th=[  126], 50.00th=[  126], 60.00th=[  126],
     | 70.00th=[  127], 80.00th=[  127], 90.00th=[  127], 95.00th=[  127],
     | 99.00th=[  128], 99.50th=[  128], 99.90th=[  128], 99.95th=[  128],
     | 99.99th=[  128]
    bw (KB  /s): min=  311, max=  311, per=68.81%, avg=311.00, stdev= 0.00
    lat (usec) : 10=0.88%
    lat (msec) : 10=0.88%, 20=0.88%, 50=2.65%, 100=5.31%, 250=89.38%
  cpu          : usr=0.00%, sys=0.30%, ctx=116, majf=0, minf=30
  IO depths    : 1=0.9%, 2=1.8%, 4=3.5%, 8=7.1%, 16=86.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.0%, 8=0.0%, 16=1.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=113/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=452KB, aggrb=452KB/s, minb=452KB/s, maxb=452KB/s, mint=998msec, maxt=998msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

fio: terminating on signal 2

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=31567: Sat Jun 18 00:38:04 2016
  write: io=98304B, bw=479531B/s, iops=117, runt=   205msec
    slat (usec): min=8130, max=9673, avg=8494.50, stdev=371.66
    clat (usec): min=3, max=127267, avg=84738.17, stdev=44487.52
     lat (msec): min=8, max=135, avg=93.23, stdev=44.47
    clat percentiles (usec):
     |  1.00th=[    3],  5.00th=[ 8384], 10.00th=[16768], 20.00th=[33536],
     | 30.00th=[60160], 40.00th=[77312], 50.00th=[93696], 60.00th=[119296],
     | 70.00th=[125440], 80.00th=[127488], 90.00th=[127488], 95.00th=[127488],
     | 99.00th=[127488], 99.50th=[127488], 99.90th=[127488], 99.95th=[127488],
     | 99.99th=[127488]
    lat (usec) : 4=4.17%
    lat (msec) : 10=4.17%, 20=4.17%, 50=12.50%, 100=25.00%, 250=50.00%
  cpu          : usr=0.00%, sys=0.49%, ctx=25, majf=0, minf=30
  IO depths    : 1=4.2%, 2=8.3%, 4=16.7%, 8=33.3%, 16=37.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=90.0%, 8=0.0%, 16=10.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=24/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=96KB, aggrb=468KB/s, minb=468KB/s, maxb=468KB/s, mint=205msec, maxt=205msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=24007: Sat Jun 18 00:12:17 2016
  write: io=7768.0KB, bw=396769B/s, iops=96, runt= 20048msec
    slat (msec): min=7, max=225, avg=10.32, stdev=11.54
    clat (usec): min=5, max=650714, avg=154131.73, stdev=82426.87
     lat (msec): min=49, max=734, avg=164.45, stdev=85.80
    clat percentiles (msec):
     |  1.00th=[  126],  5.00th=[  126], 10.00th=[  126], 20.00th=[  126],
     | 30.00th=[  126], 40.00th=[  126], 50.00th=[  126], 60.00th=[  126],
     | 70.00th=[  127], 80.00th=[  128], 90.00th=[  241], 95.00th=[  351],
     | 99.00th=[  494], 99.50th=[  627], 99.90th=[  644], 99.95th=[  652],
     | 99.99th=[  652]
    bw (KB  /s): min=  103, max=  477, per=100.00%, avg=390.58, stdev=108.41
    lat (usec) : 10=0.05%
    lat (msec) : 50=0.05%, 250=90.06%, 500=8.96%, 750=0.88%
  cpu          : usr=0.04%, sys=0.20%, ctx=1943, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1942/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=7768KB, aggrb=387KB/s, minb=387KB/s, maxb=387KB/s, mint=20048msec, maxt=20048msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=24007: Sat Jun 18 00:12:17 2016
  write: io=7768.0KB, bw=396769B/s, iops=96, runt= 20048msec
    slat (msec): min=7, max=225, avg=10.32, stdev=11.54
    clat (usec): min=5, max=650714, avg=154131.73, stdev=82426.87
     lat (msec): min=49, max=734, avg=164.45, stdev=85.80
    clat percentiles (msec):
     |  1.00th=[  126],  5.00th=[  126], 10.00th=[  126], 20.00th=[  126],
     | 30.00th=[  126], 40.00th=[  126], 50.00th=[  126], 60.00th=[  126],
     | 70.00th=[  127], 80.00th=[  128], 90.00th=[  241], 95.00th=[  351],
     | 99.00th=[  494], 99.50th=[  627], 99.90th=[  644], 99.95th=[  652],
     | 99.99th=[  652]
    bw (KB  /s): min=  103, max=  477, per=100.00%, avg=390.58, stdev=108.41
    lat (usec) : 10=0.05%
    lat (msec) : 50=0.05%, 250=90.06%, 500=8.96%, 750=0.88%
  cpu          : usr=0.04%, sys=0.20%, ctx=1943, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1942/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=7768KB, aggrb=387KB/s, minb=387KB/s, maxb=387KB/s, mint=20048msec, maxt=20048msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=24130: Sat Jun 18 00:12:37 2016
  write: io=7868.0KB, bw=401937B/s, iops=98, runt= 20045msec
    slat (msec): min=5, max=225, avg=10.19, stdev=11.90
    clat (usec): min=5, max=842555, avg=152251.09, stdev=90398.06
     lat (msec): min=83, max=850, avg=162.44, stdev=94.24
    clat percentiles (msec):
     |  1.00th=[  126],  5.00th=[  126], 10.00th=[  126], 20.00th=[  126],
     | 30.00th=[  126], 40.00th=[  126], 50.00th=[  126], 60.00th=[  126],
     | 70.00th=[  127], 80.00th=[  127], 90.00th=[  202], 95.00th=[  359],
     | 99.00th=[  578], 99.50th=[  758], 99.90th=[  840], 99.95th=[  840],
     | 99.99th=[  840]
    bw (KB  /s): min=   87, max=  477, per=100.00%, avg=393.46, stdev=123.32
    lat (usec) : 10=0.05%
    lat (msec) : 100=0.05%, 250=91.97%, 500=6.25%, 750=1.17%, 1000=0.51%
  cpu          : usr=0.04%, sys=0.20%, ctx=1968, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1967/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=7868KB, aggrb=392KB/s, minb=392KB/s, maxb=392KB/s, mint=20045msec, maxt=20045msec
```

### READ
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=24602: Sat Jun 18 00:13:56 2016
  read : io=169860KB, bw=8492.6KB/s, iops=2123, runt= 20001msec
    slat (usec): min=372, max=4463, avg=465.85, stdev=50.66
    clat (usec): min=4, max=12702, avg=7064.33, stdev=416.47
     lat (usec): min=499, max=13195, avg=7531.45, stdev=437.88
    clat percentiles (usec):
     |  1.00th=[ 6624],  5.00th=[ 6624], 10.00th=[ 6688], 20.00th=[ 6752],
     | 30.00th=[ 6816], 40.00th=[ 6880], 50.00th=[ 7008], 60.00th=[ 7072],
     | 70.00th=[ 7200], 80.00th=[ 7264], 90.00th=[ 7456], 95.00th=[ 7776],
     | 99.00th=[ 8768], 99.50th=[ 9024], 99.90th=[ 9536], 99.95th=[12096],
     | 99.99th=[12736]
    bw (KB  /s): min= 7776, max= 9032, per=99.99%, avg=8491.08, stdev=326.94
    lat (usec) : 10=0.01%, 750=0.01%, 1000=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=99.91%, 20=0.07%
  cpu          : usr=1.09%, sys=3.46%, ctx=84912, majf=0, minf=44
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=42465/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=169860KB, aggrb=8492KB/s, minb=8492KB/s, maxb=8492KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=24728: Sat Jun 18 00:14:16 2016
  read : io=172888KB, bw=8643.1KB/s, iops=2160, runt= 20001msec
    slat (usec): min=395, max=2018, avg=457.57, stdev=37.84
    clat (usec): min=4, max=9321, avg=6940.84, stdev=293.91
     lat (usec): min=447, max=9778, avg=7399.67, stdev=306.72
    clat percentiles (usec):
     |  1.00th=[ 6624],  5.00th=[ 6688], 10.00th=[ 6688], 20.00th=[ 6752],
     | 30.00th=[ 6816], 40.00th=[ 6816], 50.00th=[ 6944], 60.00th=[ 6944],
     | 70.00th=[ 7008], 80.00th=[ 7072], 90.00th=[ 7200], 95.00th=[ 7264],
     | 99.00th=[ 8512], 99.50th=[ 8768], 99.90th=[ 9024], 99.95th=[ 9152],
     | 99.99th=[ 9280]
    bw (KB  /s): min= 8304, max= 8984, per=100.00%, avg=8645.54, stdev=178.86
    lat (usec) : 10=0.01%, 500=0.01%, 1000=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=99.98%
  cpu          : usr=1.14%, sys=3.50%, ctx=86471, majf=0, minf=45
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=43222/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=172888KB, aggrb=8643KB/s, minb=8643KB/s, maxb=8643KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=24851: Sat Jun 18 00:14:37 2016
  read : io=172628KB, bw=8630.1KB/s, iops=2157, runt= 20001msec
    slat (usec): min=403, max=2022, avg=458.28, stdev=37.83
    clat (usec): min=5, max=9176, avg=6951.38, stdev=287.77
     lat (usec): min=447, max=9639, avg=7410.94, stdev=300.05
    clat percentiles (usec):
     |  1.00th=[ 6688],  5.00th=[ 6688], 10.00th=[ 6688], 20.00th=[ 6752],
     | 30.00th=[ 6816], 40.00th=[ 6880], 50.00th=[ 6944], 60.00th=[ 6944],
     | 70.00th=[ 7008], 80.00th=[ 7072], 90.00th=[ 7200], 95.00th=[ 7264],
     | 99.00th=[ 8512], 99.50th=[ 8768], 99.90th=[ 9024], 99.95th=[ 9024],
     | 99.99th=[ 9152]
    bw (KB  /s): min= 8248, max= 8912, per=99.97%, avg=8627.49, stdev=171.83
    lat (usec) : 10=0.01%, 500=0.01%, 1000=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=99.98%
  cpu          : usr=1.12%, sys=3.52%, ctx=86356, majf=0, minf=45
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=43157/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=172628KB, aggrb=8630KB/s, minb=8630KB/s, maxb=8630KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=24974: Sat Jun 18 00:14:57 2016
  read : io=172220KB, bw=8610.6KB/s, iops=2152, runt= 20001msec
    slat (usec): min=399, max=2150, avg=459.36, stdev=37.18
    clat (usec): min=5, max=9366, avg=6967.74, stdev=291.08
     lat (usec): min=443, max=9876, avg=7428.37, stdev=303.64
    clat percentiles (usec):
     |  1.00th=[ 6624],  5.00th=[ 6688], 10.00th=[ 6688], 20.00th=[ 6752],
     | 30.00th=[ 6816], 40.00th=[ 6880], 50.00th=[ 6944], 60.00th=[ 7008],
     | 70.00th=[ 7008], 80.00th=[ 7072], 90.00th=[ 7200], 95.00th=[ 7328],
     | 99.00th=[ 8512], 99.50th=[ 8768], 99.90th=[ 9152], 99.95th=[ 9280],
     | 99.99th=[ 9280]
    bw (KB  /s): min= 8248, max= 8944, per=100.00%, avg=8619.90, stdev=162.15
    lat (usec) : 10=0.01%, 500=0.01%, 1000=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=99.98%
  cpu          : usr=1.04%, sys=3.57%, ctx=86123, majf=0, minf=45
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=43055/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=172220KB, aggrb=8610KB/s, minb=8610KB/s, maxb=8610KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=25100: Sat Jun 18 00:15:17 2016
  read : io=172792KB, bw=8639.2KB/s, iops=2159, runt= 20001msec
    slat (usec): min=410, max=1657, avg=457.83, stdev=36.34
    clat (usec): min=4, max=9728, avg=6944.75, stdev=268.29
     lat (usec): min=447, max=10177, avg=7403.86, stdev=278.39
    clat percentiles (usec):
     |  1.00th=[ 6688],  5.00th=[ 6688], 10.00th=[ 6752], 20.00th=[ 6816],
     | 30.00th=[ 6816], 40.00th=[ 6880], 50.00th=[ 6944], 60.00th=[ 6944],
     | 70.00th=[ 7008], 80.00th=[ 7008], 90.00th=[ 7072], 95.00th=[ 7136],
     | 99.00th=[ 8640], 99.50th=[ 8768], 99.90th=[ 9024], 99.95th=[ 9152],
     | 99.99th=[ 9664]
    bw (KB  /s): min= 8376, max= 8880, per=100.00%, avg=8639.79, stdev=115.66
    lat (usec) : 10=0.01%, 500=0.01%, 1000=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=99.98%
  cpu          : usr=1.12%, sys=3.49%, ctx=86434, majf=0, minf=46
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=43198/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=172792KB, aggrb=8639KB/s, minb=8639KB/s, maxb=8639KB/s, mint=20001msec, maxt=20001msec
```

### READ-WRITE
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=25560: Sat Jun 18 00:16:34 2016
  read : io=9028.0KB, bw=462118B/s, iops=112, runt= 20005msec
    slat (usec): min=427, max=43230, avg=552.59, stdev=1190.19
    clat (msec): min=7, max=283, avg=65.09, stdev=24.54
     lat (msec): min=7, max=284, avg=65.64, stdev=24.79
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   36], 10.00th=[   42], 20.00th=[   50],
     | 30.00th=[   56], 40.00th=[   59], 50.00th=[   66], 60.00th=[   68],
     | 70.00th=[   75], 80.00th=[   76], 90.00th=[   84], 95.00th=[   92],
     | 99.00th=[  176], 99.50th=[  225], 99.90th=[  277], 99.95th=[  277],
     | 99.99th=[  285]
    bw (KB  /s): min=  174, max=  638, per=99.58%, avg=449.10, stdev=92.41
  write: io=9024.0KB, bw=461913B/s, iops=112, runt= 20005msec
    slat (msec): min=3, max=75, avg= 8.30, stdev= 4.08
    clat (usec): min=4, max=284009, avg=67422.66, stdev=28807.62
     lat (msec): min=7, max=291, avg=75.73, stdev=29.64
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   35], 10.00th=[   43], 20.00th=[   51],
     | 30.00th=[   59], 40.00th=[   60], 50.00th=[   68], 60.00th=[   69],
     | 70.00th=[   76], 80.00th=[   77], 90.00th=[   85], 95.00th=[   96],
     | 99.00th=[  219], 99.50th=[  251], 99.90th=[  277], 99.95th=[  277],
     | 99.99th=[  285]
    bw (KB  /s): min=  324, max=  516, per=99.68%, avg=449.54, stdev=52.10
    lat (usec) : 10=0.02%
    lat (msec) : 10=0.07%, 20=0.07%, 50=19.37%, 100=76.18%, 250=3.90%
    lat (msec) : 500=0.40%
  cpu          : usr=0.09%, sys=0.45%, ctx=8678, majf=0, minf=29
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=2257/w=2256/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=9028KB, aggrb=451KB/s, minb=451KB/s, maxb=451KB/s, mint=20005msec, maxt=20005msec
  WRITE: io=9024KB, aggrb=451KB/s, minb=451KB/s, maxb=451KB/s, mint=20005msec, maxt=20005msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=25686: Sat Jun 18 00:16:55 2016
  read : io=8680.0KB, bw=444393B/s, iops=108, runt= 20001msec
    slat (usec): min=425, max=97164, avg=561.79, stdev=2075.58
    clat (msec): min=24, max=500, avg=67.57, stdev=35.07
     lat (msec): min=25, max=501, avg=68.14, stdev=35.53
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   37], 10.00th=[   42], 20.00th=[   50],
     | 30.00th=[   56], 40.00th=[   59], 50.00th=[   66], 60.00th=[   68],
     | 70.00th=[   75], 80.00th=[   76], 90.00th=[   85], 95.00th=[  100],
     | 99.00th=[  251], 99.50th=[  285], 99.90th=[  379], 99.95th=[  494],
     | 99.99th=[  502]
    bw (KB  /s): min=  140, max=  652, per=100.00%, avg=435.10, stdev=109.07
  write: io=8676.0KB, bw=444188B/s, iops=108, runt= 20001msec
    slat (msec): min=3, max=252, avg= 8.65, stdev= 9.42
    clat (usec): min=4, max=509157, avg=70251.26, stdev=42269.06
     lat (msec): min=8, max=517, avg=78.90, stdev=43.88
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   36], 10.00th=[   43], 20.00th=[   51],
     | 30.00th=[   59], 40.00th=[   60], 50.00th=[   68], 60.00th=[   69],
     | 70.00th=[   76], 80.00th=[   77], 90.00th=[   86], 95.00th=[  102],
     | 99.00th=[  269], 99.50th=[  285], 99.90th=[  502], 99.95th=[  510],
     | 99.99th=[  510]
    bw (KB  /s): min=  134, max=  508, per=100.00%, avg=433.90, stdev=75.19
    lat (usec) : 10=0.02%
    lat (msec) : 10=0.02%, 20=0.07%, 50=19.45%, 100=74.97%, 250=4.31%
    lat (msec) : 500=1.06%, 750=0.09%
  cpu          : usr=0.09%, sys=0.42%, ctx=7119, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=2170/w=2169/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=8680KB, aggrb=433KB/s, minb=433KB/s, maxb=433KB/s, mint=20001msec, maxt=20001msec
  WRITE: io=8676KB, aggrb=433KB/s, minb=433KB/s, maxb=433KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=25809: Sat Jun 18 00:17:15 2016
  read : io=8816.0KB, bw=451356B/s, iops=110, runt= 20001msec
    slat (usec): min=424, max=47016, avg=571.86, stdev=1525.27
    clat (msec): min=7, max=316, avg=67.59, stdev=32.52
     lat (msec): min=7, max=316, avg=68.16, stdev=32.78
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   37], 10.00th=[   42], 20.00th=[   50],
     | 30.00th=[   57], 40.00th=[   59], 50.00th=[   66], 60.00th=[   68],
     | 70.00th=[   75], 80.00th=[   76], 90.00th=[   85], 95.00th=[   99],
     | 99.00th=[  241], 99.50th=[  281], 99.90th=[  302], 99.95th=[  310],
     | 99.99th=[  318]
    bw (KB  /s): min=  242, max=  594, per=100.00%, avg=440.41, stdev=80.67
  write: io=8800.0KB, bw=450537B/s, iops=109, runt= 20001msec
    slat (msec): min=3, max=232, avg= 8.51, stdev= 7.97
    clat (usec): min=5, max=309455, avg=68159.27, stdev=32023.15
     lat (msec): min=7, max=317, avg=76.67, stdev=33.54
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   36], 10.00th=[   43], 20.00th=[   51],
     | 30.00th=[   59], 40.00th=[   60], 50.00th=[   68], 60.00th=[   69],
     | 70.00th=[   76], 80.00th=[   77], 90.00th=[   85], 95.00th=[   95],
     | 99.00th=[  235], 99.50th=[  285], 99.90th=[  310], 99.95th=[  310],
     | 99.99th=[  310]
    bw (KB  /s): min=  272, max=  514, per=100.00%, avg=440.08, stdev=63.19
    lat (usec) : 10=0.02%
    lat (msec) : 10=0.07%, 20=0.09%, 50=19.10%, 100=75.82%, 250=4.13%
    lat (msec) : 500=0.77%
  cpu          : usr=0.15%, sys=0.36%, ctx=5780, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=2204/w=2200/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=8816KB, aggrb=440KB/s, minb=440KB/s, maxb=440KB/s, mint=20001msec, maxt=20001msec
  WRITE: io=8800KB, aggrb=439KB/s, minb=439KB/s, maxb=439KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=25935: Sat Jun 18 00:17:35 2016
  read : io=8760.0KB, bw=448467B/s, iops=109, runt= 20002msec
    slat (usec): min=424, max=52212, avg=552.79, stdev=1187.49
    clat (msec): min=24, max=509, avg=67.28, stdev=38.10
     lat (msec): min=25, max=510, avg=67.83, stdev=38.29
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   37], 10.00th=[   42], 20.00th=[   50],
     | 30.00th=[   56], 40.00th=[   59], 50.00th=[   65], 60.00th=[   68],
     | 70.00th=[   74], 80.00th=[   76], 90.00th=[   84], 95.00th=[   92],
     | 99.00th=[  260], 99.50th=[  318], 99.90th=[  502], 99.95th=[  510],
     | 99.99th=[  510]
    bw (KB  /s): min=  183, max=  604, per=99.77%, avg=436.00, stdev=112.03
  write: io=8748.0KB, bw=447852B/s, iops=109, runt= 20002msec
    slat (msec): min=3, max=262, avg= 8.58, stdev= 9.47
    clat (usec): min=4, max=510165, avg=69418.77, stdev=41435.70
     lat (msec): min=8, max=518, avg=78.00, stdev=43.49
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   35], 10.00th=[   43], 20.00th=[   51],
     | 30.00th=[   55], 40.00th=[   60], 50.00th=[   68], 60.00th=[   69],
     | 70.00th=[   76], 80.00th=[   77], 90.00th=[   85], 95.00th=[   94],
     | 99.00th=[  302], 99.50th=[  310], 99.90th=[  502], 99.95th=[  510],
     | 99.99th=[  510]
    bw (KB  /s): min=  114, max=  522, per=99.71%, avg=435.74, stdev=85.74
    lat (usec) : 10=0.02%
    lat (msec) : 10=0.02%, 20=0.07%, 50=19.44%, 100=76.08%, 250=3.20%
    lat (msec) : 500=1.01%, 750=0.16%
  cpu          : usr=0.15%, sys=0.37%, ctx=8515, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=2190/w=2187/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=8760KB, aggrb=437KB/s, minb=437KB/s, maxb=437KB/s, mint=20002msec, maxt=20002msec
  WRITE: io=8748KB, aggrb=437KB/s, minb=437KB/s, maxb=437KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=26061: Sat Jun 18 00:17:55 2016
  read : io=8824.0KB, bw=451743B/s, iops=110, runt= 20002msec
    slat (usec): min=427, max=37650, avg=530.59, stdev=793.12
    clat (msec): min=7, max=317, avg=67.04, stdev=32.13
     lat (msec): min=8, max=317, avg=67.58, stdev=32.21
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   37], 10.00th=[   42], 20.00th=[   50],
     | 30.00th=[   53], 40.00th=[   59], 50.00th=[   65], 60.00th=[   68],
     | 70.00th=[   75], 80.00th=[   76], 90.00th=[   85], 95.00th=[   93],
     | 99.00th=[  249], 99.50th=[  285], 99.90th=[  310], 99.95th=[  318],
     | 99.99th=[  318]
    bw (KB  /s): min=  191, max=  612, per=100.00%, avg=441.28, stdev=102.47
  write: io=8844.0KB, bw=452767B/s, iops=110, runt= 20002msec
    slat (msec): min=4, max=232, avg= 8.51, stdev= 7.87
    clat (usec): min=4, max=318545, avg=68371.82, stdev=33213.38
     lat (msec): min=7, max=325, avg=76.88, stdev=34.92
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   36], 10.00th=[   43], 20.00th=[   51],
     | 30.00th=[   55], 40.00th=[   60], 50.00th=[   68], 60.00th=[   69],
     | 70.00th=[   76], 80.00th=[   77], 90.00th=[   85], 95.00th=[   95],
     | 99.00th=[  243], 99.50th=[  293], 99.90th=[  310], 99.95th=[  310],
     | 99.99th=[  318]
    bw (KB  /s): min=  250, max=  516, per=99.90%, avg=441.56, stdev=73.23
    lat (usec) : 10=0.02%
    lat (msec) : 10=0.05%, 20=0.07%, 50=19.45%, 100=75.71%, 250=3.80%
    lat (msec) : 500=0.91%
  cpu          : usr=0.09%, sys=0.44%, ctx=8648, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.2%, 16=99.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=2206/w=2211/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=8824KB, aggrb=441KB/s, minb=441KB/s, maxb=441KB/s, mint=20002msec, maxt=20002msec
  WRITE: io=8844KB, aggrb=442KB/s, minb=442KB/s, maxb=442KB/s, mint=20002msec, maxt=20002msec
```

### RAND-WRITE
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=26185: Sat Jun 18 00:18:16 2016
  write: io=8620.0KB, bw=441167B/s, iops=107, runt= 20008msec
    slat (msec): min=2, max=179, avg= 9.28, stdev=11.76
    clat (usec): min=4, max=434729, avg=138557.64, stdev=62594.34
     lat (msec): min=8, max=446, avg=147.84, stdev=65.02
    clat percentiles (msec):
     |  1.00th=[   84],  5.00th=[   92], 10.00th=[   95], 20.00th=[  100],
     | 30.00th=[  106], 40.00th=[  111], 50.00th=[  116], 60.00th=[  119],
     | 70.00th=[  133], 80.00th=[  165], 90.00th=[  231], 95.00th=[  277],
     | 99.00th=[  383], 99.50th=[  408], 99.90th=[  429], 99.95th=[  433],
     | 99.99th=[  437]
    bw (KB  /s): min=  158, max=  581, per=99.03%, avg=425.82, stdev=98.41
    lat (usec) : 10=0.05%
    lat (msec) : 10=0.05%, 20=0.09%, 50=0.19%, 100=18.42%, 250=74.71%
    lat (msec) : 500=6.50%
  cpu          : usr=0.06%, sys=0.21%, ctx=2156, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2155/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=8620KB, aggrb=430KB/s, minb=430KB/s, maxb=430KB/s, mint=20008msec, maxt=20008msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=26308: Sat Jun 18 00:18:36 2016
  write: io=7564.0KB, bw=385695B/s, iops=94, runt= 20082msec
    slat (msec): min=2, max=460, avg=10.61, stdev=17.29
    clat (usec): min=5, max=726930, avg=158515.55, stdev=81847.72
     lat (msec): min=89, max=735, avg=169.13, stdev=85.12
    clat percentiles (msec):
     |  1.00th=[   88],  5.00th=[   93], 10.00th=[   99], 20.00th=[  106],
     | 30.00th=[  112], 40.00th=[  118], 50.00th=[  126], 60.00th=[  133],
     | 70.00th=[  165], 80.00th=[  219], 90.00th=[  277], 95.00th=[  314],
     | 99.00th=[  379], 99.50th=[  635], 99.90th=[  725], 99.95th=[  725],
     | 99.99th=[  725]
    bw (KB  /s): min=  194, max=  597, per=100.00%, avg=381.16, stdev=109.71
    lat (usec) : 10=0.05%
    lat (msec) : 100=10.52%, 250=75.30%, 500=13.33%, 750=0.79%
  cpu          : usr=0.00%, sys=0.25%, ctx=1892, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1891/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=7564KB, aggrb=376KB/s, minb=376KB/s, maxb=376KB/s, mint=20082msec, maxt=20082msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=26434: Sat Jun 18 00:18:56 2016
  write: io=8632.0KB, bw=441847B/s, iops=107, runt= 20005msec
    slat (msec): min=2, max=201, avg= 9.26, stdev=12.99
    clat (usec): min=4, max=469890, avg=138386.67, stdev=67923.19
     lat (msec): min=8, max=476, avg=147.65, stdev=70.69
    clat percentiles (msec):
     |  1.00th=[   81],  5.00th=[   89], 10.00th=[   92], 20.00th=[   97],
     | 30.00th=[  101], 40.00th=[  106], 50.00th=[  112], 60.00th=[  118],
     | 70.00th=[  127], 80.00th=[  169], 90.00th=[  253], 95.00th=[  289],
     | 99.00th=[  392], 99.50th=[  412], 99.90th=[  465], 99.95th=[  469],
     | 99.99th=[  469]
    bw (KB  /s): min=  190, max=  656, per=100.00%, avg=431.50, stdev=116.60
    lat (usec) : 10=0.05%
    lat (msec) : 10=0.05%, 20=0.05%, 50=0.14%, 100=26.78%, 250=62.33%
    lat (msec) : 500=10.61%
  cpu          : usr=0.13%, sys=0.15%, ctx=2159, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2158/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=8632KB, aggrb=431KB/s, minb=431KB/s, maxb=431KB/s, mint=20005msec, maxt=20005msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=26557: Sat Jun 18 00:19:17 2016
  write: io=8560.0KB, bw=438074B/s, iops=106, runt= 20009msec
    slat (msec): min=2, max=219, avg= 9.34, stdev=13.58
    clat (usec): min=5, max=621436, avg=139674.14, stdev=72465.66
     lat (msec): min=57, max=640, avg=149.02, stdev=75.41
    clat percentiles (msec):
     |  1.00th=[   80],  5.00th=[   88], 10.00th=[   92], 20.00th=[   97],
     | 30.00th=[  102], 40.00th=[  109], 50.00th=[  115], 60.00th=[  121],
     | 70.00th=[  133], 80.00th=[  159], 90.00th=[  239], 95.00th=[  302],
     | 99.00th=[  424], 99.50th=[  506], 99.90th=[  603], 99.95th=[  611],
     | 99.99th=[  619]
    bw (KB  /s): min=  102, max=  640, per=100.00%, avg=428.55, stdev=116.40
    lat (usec) : 10=0.05%
    lat (msec) : 100=24.86%, 250=66.68%, 500=7.90%, 750=0.51%
  cpu          : usr=0.07%, sys=0.20%, ctx=2141, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2140/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=8560KB, aggrb=427KB/s, minb=427KB/s, maxb=427KB/s, mint=20009msec, maxt=20009msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=26681: Sat Jun 18 00:19:37 2016
  write: io=8404.0KB, bw=430263B/s, iops=105, runt= 20001msec
    slat (msec): min=2, max=242, avg= 9.51, stdev=14.71
    clat (usec): min=4, max=597024, avg=142384.90, stdev=84943.97
     lat (msec): min=24, max=621, avg=151.90, stdev=88.69
    clat percentiles (msec):
     |  1.00th=[   76],  5.00th=[   87], 10.00th=[   91], 20.00th=[   96],
     | 30.00th=[  100], 40.00th=[  104], 50.00th=[  109], 60.00th=[  115],
     | 70.00th=[  124], 80.00th=[  163], 90.00th=[  260], 95.00th=[  351],
     | 99.00th=[  465], 99.50th=[  529], 99.90th=[  562], 99.95th=[  562],
     | 99.99th=[  594]
    bw (KB  /s): min=   86, max=  634, per=99.58%, avg=418.23, stdev=150.51
    lat (usec) : 10=0.05%
    lat (msec) : 50=0.19%, 100=29.08%, 250=59.78%, 500=10.09%, 750=0.81%
  cpu          : usr=0.05%, sys=0.23%, ctx=2102, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.2%, 8=0.4%, 16=99.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=2101/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=8404KB, aggrb=420KB/s, minb=420KB/s, maxb=420KB/s, mint=20001msec, maxt=20001msec
```

### RAND-READ
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=27138: Sat Jun 18 00:20:53 2016
  read : io=127560KB, bw=6377.7KB/s, iops=1594, runt= 20001msec
    slat (usec): min=413, max=1097.3K, avg=621.47, stdev=6625.32
    clat (usec): min=4, max=1156.5K, avg=9295.18, stdev=26839.96
     lat (usec): min=607, max=1157.2K, avg=9917.95, stdev=28026.81
    clat percentiles (msec):
     |  1.00th=[    8],  5.00th=[    9], 10.00th=[    9], 20.00th=[    9],
     | 30.00th=[    9], 40.00th=[    9], 50.00th=[    9], 60.00th=[    9],
     | 70.00th=[    9], 80.00th=[    9], 90.00th=[    9], 95.00th=[   10],
     | 99.00th=[   11], 99.50th=[   12], 99.90th=[  388], 99.95th=[  807],
     | 99.99th=[ 1156]
    bw (KB  /s): min=    3, max= 7296, per=100.00%, avg=6617.39, stdev=1850.15
    lat (usec) : 10=0.01%, 750=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=98.05%, 20=1.77%, 250=0.06%
    lat (msec) : 500=0.02%, 750=0.03%, 1000=0.01%, 2000=0.04%
  cpu          : usr=0.83%, sys=2.70%, ctx=63633, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=31890/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=127560KB, aggrb=6377KB/s, minb=6377KB/s, maxb=6377KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=27264: Sat Jun 18 00:21:14 2016
  read : io=145468KB, bw=7273.4KB/s, iops=1818, runt= 20001msec
    slat (usec): min=434, max=2432, avg=544.26, stdev=50.59
    clat (usec): min=4, max=10491, avg=8248.51, stdev=263.91
     lat (usec): min=538, max=11023, avg=8794.04, stdev=271.68
    clat percentiles (usec):
     |  1.00th=[ 7904],  5.00th=[ 7968], 10.00th=[ 8032], 20.00th=[ 8096],
     | 30.00th=[ 8160], 40.00th=[ 8160], 50.00th=[ 8256], 60.00th=[ 8256],
     | 70.00th=[ 8256], 80.00th=[ 8384], 90.00th=[ 8384], 95.00th=[ 8512],
     | 99.00th=[ 9536], 99.50th=[ 9792], 99.90th=[10304], 99.95th=[10432],
     | 99.99th=[10432]
    bw (KB  /s): min= 7048, max= 7360, per=100.00%, avg=7274.26, stdev=50.73
    lat (usec) : 10=0.01%, 750=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=99.70%, 20=0.27%
  cpu          : usr=1.00%, sys=3.02%, ctx=72756, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=36367/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=145468KB, aggrb=7273KB/s, minb=7273KB/s, maxb=7273KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=27387: Sat Jun 18 00:21:34 2016
  read : io=145912KB, bw=7295.3KB/s, iops=1823, runt= 20001msec
    slat (usec): min=422, max=2515, avg=542.59, stdev=50.31
    clat (usec): min=4, max=10869, avg=8223.51, stdev=267.19
     lat (usec): min=502, max=11434, avg=8767.36, stdev=275.28
    clat percentiles (usec):
     |  1.00th=[ 7840],  5.00th=[ 7968], 10.00th=[ 8032], 20.00th=[ 8096],
     | 30.00th=[ 8096], 40.00th=[ 8160], 50.00th=[ 8256], 60.00th=[ 8256],
     | 70.00th=[ 8256], 80.00th=[ 8384], 90.00th=[ 8384], 95.00th=[ 8512],
     | 99.00th=[ 9664], 99.50th=[ 9792], 99.90th=[10176], 99.95th=[10304],
     | 99.99th=[10816]
    bw (KB  /s): min= 7128, max= 7400, per=100.00%, avg=7297.03, stdev=39.16
    lat (usec) : 10=0.01%, 750=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=99.80%, 20=0.18%
  cpu          : usr=1.05%, sys=2.98%, ctx=72962, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=36478/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=145912KB, aggrb=7295KB/s, minb=7295KB/s, maxb=7295KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=27510: Sat Jun 18 00:21:55 2016
  read : io=145412KB, bw=7270.3KB/s, iops=1817, runt= 20001msec
    slat (usec): min=422, max=2169, avg=544.51, stdev=49.05
    clat (usec): min=4, max=10509, avg=8251.60, stdev=264.88
     lat (usec): min=502, max=11076, avg=8797.38, stdev=272.68
    clat percentiles (usec):
     |  1.00th=[ 7904],  5.00th=[ 7968], 10.00th=[ 8032], 20.00th=[ 8096],
     | 30.00th=[ 8160], 40.00th=[ 8160], 50.00th=[ 8256], 60.00th=[ 8256],
     | 70.00th=[ 8256], 80.00th=[ 8384], 90.00th=[ 8384], 95.00th=[ 8512],
     | 99.00th=[ 9664], 99.50th=[ 9792], 99.90th=[10176], 99.95th=[10304],
     | 99.99th=[10432]
    bw (KB  /s): min= 7064, max= 7328, per=100.00%, avg=7270.15, stdev=42.79
    lat (usec) : 10=0.01%, 750=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=99.70%, 20=0.28%
  cpu          : usr=1.11%, sys=2.90%, ctx=72693, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=36353/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=145412KB, aggrb=7270KB/s, minb=7270KB/s, maxb=7270KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=27633: Sat Jun 18 00:22:15 2016
  read : io=145376KB, bw=7268.5KB/s, iops=1817, runt= 20001msec
    slat (usec): min=439, max=2365, avg=544.67, stdev=48.05
    clat (usec): min=4, max=10465, avg=8253.71, stdev=257.29
     lat (usec): min=560, max=10973, avg=8799.64, stdev=264.68
    clat percentiles (usec):
     |  1.00th=[ 7904],  5.00th=[ 7968], 10.00th=[ 8032], 20.00th=[ 8096],
     | 30.00th=[ 8160], 40.00th=[ 8256], 50.00th=[ 8256], 60.00th=[ 8256],
     | 70.00th=[ 8256], 80.00th=[ 8384], 90.00th=[ 8384], 95.00th=[ 8512],
     | 99.00th=[ 9536], 99.50th=[ 9792], 99.90th=[10176], 99.95th=[10304],
     | 99.99th=[10432]
    bw (KB  /s): min= 7104, max= 7328, per=100.00%, avg=7269.54, stdev=38.29
    lat (usec) : 10=0.01%, 750=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=99.83%, 20=0.15%
  cpu          : usr=1.01%, sys=3.00%, ctx=72650, majf=0, minf=47
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=36344/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=145376KB, aggrb=7268KB/s, minb=7268KB/s, maxb=7268KB/s, mint=20001msec, maxt=20001msec
```

### RAND-READ-WRITE
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=28075: Sat Jun 18 00:23:29 2016
  read : io=6060.0KB, bw=310256B/s, iops=75, runt= 20001msec
    slat (usec): min=451, max=247669, avg=771.70, stdev=6347.82
    clat (usec): min=4, max=1179.5K, avg=98484.00, stdev=140346.60
     lat (usec): min=510, max=1180.7K, avg=99256.49, stdev=140789.14
    clat percentiles (msec):
     |  1.00th=[   26],  5.00th=[   37], 10.00th=[   41], 20.00th=[   47],
     | 30.00th=[   50], 40.00th=[   56], 50.00th=[   59], 60.00th=[   65],
     | 70.00th=[   71], 80.00th=[   82], 90.00th=[  161], 95.00th=[  416],
     | 99.00th=[  652], 99.50th=[ 1123], 99.90th=[ 1172], 99.95th=[ 1172],
     | 99.99th=[ 1172]
    bw (KB  /s): min=   15, max=  669, per=100.00%, avg=319.42, stdev=203.66
  write: io=5992.0KB, bw=306775B/s, iops=74, runt= 20001msec
    slat (msec): min=2, max=1059, avg=12.56, stdev=43.41
    clat (msec): min=5, max=1173, avg=98.04, stdev=135.91
     lat (msec): min=15, max=1185, avg=110.60, stdev=147.28
    clat percentiles (msec):
     |  1.00th=[   28],  5.00th=[   36], 10.00th=[   40], 20.00th=[   46],
     | 30.00th=[   51], 40.00th=[   56], 50.00th=[   60], 60.00th=[   65],
     | 70.00th=[   70], 80.00th=[   82], 90.00th=[  174], 95.00th=[  437],
     | 99.00th=[  644], 99.50th=[  742], 99.90th=[ 1172], 99.95th=[ 1172],
     | 99.99th=[ 1172]
    bw (KB  /s): min=   15, max=  598, per=100.00%, avg=316.08, stdev=193.69
    lat (usec) : 10=0.03%, 750=0.03%
    lat (msec) : 2=0.07%, 4=0.13%, 10=0.07%, 20=0.10%, 50=28.14%
    lat (msec) : 100=58.31%, 250=5.01%, 500=4.41%, 750=3.12%, 2000=0.56%
  cpu          : usr=0.04%, sys=0.33%, ctx=4116, majf=0, minf=30
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.3%, 16=99.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1515/w=1498/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=6060KB, aggrb=302KB/s, minb=302KB/s, maxb=302KB/s, mint=20001msec, maxt=20001msec
  WRITE: io=5992KB, aggrb=299KB/s, minb=299KB/s, maxb=299KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=28201: Sat Jun 18 00:23:50 2016
  read : io=6068.0KB, bw=310635B/s, iops=75, runt= 20003msec
    slat (usec): min=452, max=1283, avg=595.46, stdev=63.71
    clat (msec): min=3, max=1332, avg=95.47, stdev=128.89
     lat (msec): min=4, max=1332, avg=96.06, stdev=128.90
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   37], 10.00th=[   41], 20.00th=[   47],
     | 30.00th=[   51], 40.00th=[   55], 50.00th=[   59], 60.00th=[   64],
     | 70.00th=[   69], 80.00th=[   80], 90.00th=[  133], 95.00th=[  392],
     | 99.00th=[  766], 99.50th=[  824], 99.90th=[ 1074], 99.95th=[ 1336],
     | 99.99th=[ 1336]
    bw (KB  /s): min=   14, max=  687, per=100.00%, avg=311.61, stdev=196.57
  write: io=6004.0KB, bw=307358B/s, iops=75, runt= 20003msec
    slat (msec): min=2, max=451, avg=12.71, stdev=37.78
    clat (usec): min=4, max=1328.9K, avg=102121.23, stdev=148022.85
     lat (msec): min=3, max=1514, avg=114.84, stdev=159.38
    clat percentiles (msec):
     |  1.00th=[   30],  5.00th=[   36], 10.00th=[   41], 20.00th=[   46],
     | 30.00th=[   51], 40.00th=[   55], 50.00th=[   59], 60.00th=[   64],
     | 70.00th=[   71], 80.00th=[   84], 90.00th=[  190], 95.00th=[  420],
     | 99.00th=[  799], 99.50th=[ 1057], 99.90th=[ 1319], 99.95th=[ 1336],
     | 99.99th=[ 1336]
    bw (KB  /s): min=   24, max=  590, per=100.00%, avg=309.19, stdev=180.07
    lat (usec) : 10=0.03%
    lat (msec) : 4=0.03%, 10=0.03%, 20=0.10%, 50=28.30%, 100=57.69%
    lat (msec) : 250=5.63%, 500=5.47%, 750=1.59%, 1000=0.80%, 2000=0.33%
  cpu          : usr=0.11%, sys=0.25%, ctx=3749, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.3%, 16=99.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1517/w=1501/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=6068KB, aggrb=303KB/s, minb=303KB/s, maxb=303KB/s, mint=20003msec, maxt=20003msec
  WRITE: io=6004KB, aggrb=300KB/s, minb=300KB/s, maxb=300KB/s, mint=20003msec, maxt=20003msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=28324: Sat Jun 18 00:24:10 2016
  read : io=6100.0KB, bw=311075B/s, iops=75, runt= 20080msec
    slat (usec): min=459, max=909, avg=596.09, stdev=61.79
    clat (msec): min=20, max=835, avg=100.24, stdev=119.30
     lat (msec): min=21, max=836, avg=100.83, stdev=119.30
    clat percentiles (msec):
     |  1.00th=[   29],  5.00th=[   36], 10.00th=[   41], 20.00th=[   47],
     | 30.00th=[   52], 40.00th=[   58], 50.00th=[   63], 60.00th=[   68],
     | 70.00th=[   77], 80.00th=[   89], 90.00th=[  231], 95.00th=[  371],
     | 99.00th=[  619], 99.50th=[  652], 99.90th=[  824], 99.95th=[  840],
     | 99.99th=[  840]
    bw (KB  /s): min=   55, max=  632, per=100.00%, avg=319.15, stdev=170.29
  write: io=6056.0KB, bw=308831B/s, iops=75, runt= 20080msec
    slat (msec): min=2, max=524, avg=12.65, stdev=36.47
    clat (usec): min=5, max=852315, avg=97632.04, stdev=120630.54
     lat (msec): min=26, max=867, avg=110.28, stdev=130.34
    clat percentiles (msec):
     |  1.00th=[   28],  5.00th=[   35], 10.00th=[   40], 20.00th=[   46],
     | 30.00th=[   51], 40.00th=[   58], 50.00th=[   63], 60.00th=[   68],
     | 70.00th=[   76], 80.00th=[   86], 90.00th=[  184], 95.00th=[  359],
     | 99.00th=[  652], 99.50th=[  824], 99.90th=[  848], 99.95th=[  857],
     | 99.99th=[  857]
    bw (KB  /s): min=   51, max=  547, per=100.00%, avg=318.59, stdev=158.36
    lat (usec) : 10=0.03%
    lat (msec) : 20=0.03%, 50=27.11%, 100=56.99%, 250=7.50%, 500=5.07%
    lat (msec) : 750=2.73%, 1000=0.53%
  cpu          : usr=0.04%, sys=0.33%, ctx=4461, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.3%, 16=99.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1525/w=1514/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=6100KB, aggrb=303KB/s, minb=303KB/s, maxb=303KB/s, mint=20080msec, maxt=20080msec
  WRITE: io=6056KB, aggrb=301KB/s, minb=301KB/s, maxb=301KB/s, mint=20080msec, maxt=20080msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=28447: Sat Jun 18 00:24:30 2016
  read : io=6352.0KB, bw=324881B/s, iops=79, runt= 20021msec
    slat (usec): min=448, max=1145, avg=595.34, stdev=64.04
    clat (msec): min=22, max=904, avg=97.78, stdev=127.91
     lat (msec): min=22, max=905, avg=98.38, stdev=127.91
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   34], 10.00th=[   41], 20.00th=[   47],
     | 30.00th=[   51], 40.00th=[   57], 50.00th=[   62], 60.00th=[   67],
     | 70.00th=[   74], 80.00th=[   83], 90.00th=[  139], 95.00th=[  416],
     | 99.00th=[  717], 99.50th=[  848], 99.90th=[  906], 99.95th=[  906],
     | 99.99th=[  906]
    bw (KB  /s): min=   47, max=  590, per=100.00%, avg=338.20, stdev=179.89
  write: io=6340.0KB, bw=324267B/s, iops=79, runt= 20021msec
    slat (msec): min=2, max=513, avg=12.02, stdev=36.28
    clat (usec): min=5, max=896258, avg=90567.69, stdev=115464.58
     lat (msec): min=25, max=911, avg=102.59, stdev=126.09
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   35], 10.00th=[   41], 20.00th=[   47],
     | 30.00th=[   52], 40.00th=[   57], 50.00th=[   61], 60.00th=[   67],
     | 70.00th=[   72], 80.00th=[   80], 90.00th=[  104], 95.00th=[  383],
     | 99.00th=[  619], 99.50th=[  791], 99.90th=[  889], 99.95th=[  898],
     | 99.99th=[  898]
    bw (KB  /s): min=    7, max=  598, per=100.00%, avg=336.09, stdev=183.39
    lat (usec) : 10=0.03%
    lat (msec) : 50=26.76%, 100=60.76%, 250=5.20%, 500=4.54%, 750=2.02%
    lat (msec) : 1000=0.69%
  cpu          : usr=0.10%, sys=0.29%, ctx=5134, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.3%, 16=99.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1588/w=1585/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=6352KB, aggrb=317KB/s, minb=317KB/s, maxb=317KB/s, mint=20021msec, maxt=20021msec
  WRITE: io=6340KB, aggrb=316KB/s, minb=316KB/s, maxb=316KB/s, mint=20021msec, maxt=20021msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=28573: Sat Jun 18 00:24:51 2016
  read : io=5856.0KB, bw=299797B/s, iops=73, runt= 20002msec
    slat (usec): min=458, max=878, avg=596.72, stdev=60.45
    clat (msec): min=16, max=789, avg=102.43, stdev=116.85
     lat (msec): min=16, max=790, avg=103.03, stdev=116.85
    clat percentiles (msec):
     |  1.00th=[   30],  5.00th=[   35], 10.00th=[   41], 20.00th=[   48],
     | 30.00th=[   53], 40.00th=[   59], 50.00th=[   65], 60.00th=[   73],
     | 70.00th=[   83], 80.00th=[  101], 90.00th=[  192], 95.00th=[  412],
     | 99.00th=[  586], 99.50th=[  668], 99.90th=[  791], 99.95th=[  791],
     | 99.99th=[  791]
    bw (KB  /s): min=   27, max=  614, per=100.00%, avg=298.40, stdev=161.28
  write: io=5828.0KB, bw=298363B/s, iops=72, runt= 20002msec
    slat (msec): min=2, max=522, avg=13.12, stdev=37.75
    clat (usec): min=4, max=795204, avg=101684.47, stdev=116401.20
     lat (msec): min=4, max=801, avg=114.80, stdev=124.26
    clat percentiles (msec):
     |  1.00th=[   27],  5.00th=[   36], 10.00th=[   40], 20.00th=[   47],
     | 30.00th=[   53], 40.00th=[   59], 50.00th=[   64], 60.00th=[   71],
     | 70.00th=[   81], 80.00th=[   99], 90.00th=[  194], 95.00th=[  408],
     | 99.00th=[  594], 99.50th=[  660], 99.90th=[  791], 99.95th=[  799],
     | 99.99th=[  799]
    bw (KB  /s): min=    6, max=  568, per=100.00%, avg=298.51, stdev=164.94
    lat (usec) : 10=0.03%
    lat (msec) : 10=0.03%, 20=0.14%, 50=24.27%, 100=55.29%, 250=11.26%
    lat (msec) : 500=6.30%, 750=2.33%, 1000=0.34%
  cpu          : usr=0.11%, sys=0.24%, ctx=3336, majf=0, minf=31
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.3%, 16=99.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1464/w=1457/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5856KB, aggrb=292KB/s, minb=292KB/s, maxb=292KB/s, mint=20002msec, maxt=20002msec
  WRITE: io=5828KB, aggrb=291KB/s, minb=291KB/s, maxb=291KB/s, mint=20002msec, maxt=20002msec
```

# Throughput Write
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=28697: Sat Jun 18 00:25:51 2016
  write: io=1964.0MB, bw=33489KB/s, iops=8, runt= 60054msec
    slat (msec): min=78, max=649, avg=122.29, stdev=66.93
    clat (usec): min=13, max=2770.5K, avg=1806906.34, stdev=344354.96
     lat (msec): min=181, max=2869, avg=1929.20, stdev=351.64
    clat percentiles (msec):
     |  1.00th=[  482],  5.00th=[ 1483], 10.00th=[ 1516], 20.00th=[ 1565],
     | 30.00th=[ 1598], 40.00th=[ 1663], 50.00th=[ 1745], 60.00th=[ 1844],
     | 70.00th=[ 1975], 80.00th=[ 2114], 90.00th=[ 2278], 95.00th=[ 2376],
     | 99.00th=[ 2507], 99.50th=[ 2638], 99.90th=[ 2769], 99.95th=[ 2769],
     | 99.99th=[ 2769]
    bw (KB  /s): min= 1893, max=44361, per=100.00%, avg=34018.19, stdev=8547.98
    lat (usec) : 20=0.20%
    lat (msec) : 250=0.20%, 500=0.61%, 750=0.41%, 1000=0.41%, 2000=69.45%
    lat (msec) : >=2000=28.72%
  cpu          : usr=0.26%, sys=0.37%, ctx=493, majf=0, minf=29
  IO depths    : 1=0.2%, 2=0.4%, 4=0.8%, 8=1.6%, 16=96.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.8%, 8=0.0%, 16=0.2%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=491/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=1964.0MB, aggrb=33488KB/s, minb=33488KB/s, maxb=33488KB/s, mint=60054msec, maxt=60054msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=29063: Sat Jun 18 00:26:51 2016
  write: io=1904.0MB, bw=32445KB/s, iops=7, runt= 60093msec
    slat (msec): min=79, max=773, avg=126.23, stdev=70.08
    clat (usec): min=12, max=2546.5K, avg=1860175.75, stdev=307078.18
     lat (msec): min=100, max=2667, avg=1986.41, stdev=310.97
    clat percentiles (msec):
     |  1.00th=[  515],  5.00th=[ 1532], 10.00th=[ 1565], 20.00th=[ 1663],
     | 30.00th=[ 1729], 40.00th=[ 1795], 50.00th=[ 1860], 60.00th=[ 1909],
     | 70.00th=[ 1958], 80.00th=[ 2073], 90.00th=[ 2278], 95.00th=[ 2343],
     | 99.00th=[ 2474], 99.50th=[ 2540], 99.90th=[ 2540], 99.95th=[ 2540],
     | 99.99th=[ 2540]
    bw (KB  /s): min= 1980, max=43885, per=100.00%, avg=32836.99, stdev=8309.00
    lat (usec) : 20=0.21%
    lat (msec) : 250=0.21%, 500=0.42%, 750=0.63%, 1000=0.21%, 2000=73.11%
    lat (msec) : >=2000=25.21%
  cpu          : usr=0.29%, sys=0.33%, ctx=479, majf=0, minf=30
  IO depths    : 1=0.2%, 2=0.4%, 4=0.8%, 8=1.7%, 16=96.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.8%, 8=0.0%, 16=0.2%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=476/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=1904.0MB, aggrb=32444KB/s, minb=32444KB/s, maxb=32444KB/s, mint=60093msec, maxt=60093msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=29423: Sat Jun 18 00:27:52 2016
  write: io=1904.0MB, bw=32457KB/s, iops=7, runt= 60070msec
    slat (msec): min=78, max=870, avg=126.18, stdev=78.69
    clat (usec): min=11, max=2970.6K, avg=1856710.92, stdev=358778.50
     lat (msec): min=107, max=3066, avg=1982.89, stdev=365.24
    clat percentiles (msec):
     |  1.00th=[  388],  5.00th=[ 1500], 10.00th=[ 1549], 20.00th=[ 1631],
     | 30.00th=[ 1680], 40.00th=[ 1745], 50.00th=[ 1795], 60.00th=[ 1876],
     | 70.00th=[ 1975], 80.00th=[ 2147], 90.00th=[ 2311], 95.00th=[ 2409],
     | 99.00th=[ 2769], 99.50th=[ 2966], 99.90th=[ 2966], 99.95th=[ 2966],
     | 99.99th=[ 2966]
    bw (KB  /s): min= 1767, max=43885, per=100.00%, avg=32957.62, stdev=8753.37
    lat (usec) : 20=0.21%
    lat (msec) : 250=0.42%, 500=0.42%, 750=0.42%, 1000=0.21%, 2000=70.17%
    lat (msec) : >=2000=28.15%
  cpu          : usr=0.31%, sys=0.30%, ctx=482, majf=0, minf=30
  IO depths    : 1=0.2%, 2=0.4%, 4=0.8%, 8=1.7%, 16=96.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.8%, 8=0.0%, 16=0.2%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=476/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=1904.0MB, aggrb=32457KB/s, minb=32457KB/s, maxb=32457KB/s, mint=60070msec, maxt=60070msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=29787: Sat Jun 18 00:28:52 2016
  write: io=1876.0MB, bw=31819KB/s, iops=7, runt= 60373msec
    slat (msec): min=77, max=653, avg=128.71, stdev=81.40
    clat (usec): min=13, max=2740.3K, avg=1902275.10, stdev=323592.20
     lat (msec): min=481, max=2847, avg=2030.99, stdev=325.94
    clat percentiles (msec):
     |  1.00th=[  816],  5.00th=[ 1500], 10.00th=[ 1582], 20.00th=[ 1647],
     | 30.00th=[ 1713], 40.00th=[ 1795], 50.00th=[ 1860], 60.00th=[ 1958],
     | 70.00th=[ 2073], 80.00th=[ 2180], 90.00th=[ 2343], 95.00th=[ 2376],
     | 99.00th=[ 2573], 99.50th=[ 2606], 99.90th=[ 2737], 99.95th=[ 2737],
     | 99.99th=[ 2737]
    bw (KB  /s): min= 1953, max=43885, per=100.00%, avg=32378.56, stdev=8798.67
    lat (usec) : 20=0.21%
    lat (msec) : 500=0.21%, 750=0.43%, 1000=0.43%, 2000=61.62%, >=2000=37.10%
  cpu          : usr=0.31%, sys=0.29%, ctx=472, majf=0, minf=30
  IO depths    : 1=0.2%, 2=0.4%, 4=0.9%, 8=1.7%, 16=96.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.8%, 8=0.0%, 16=0.2%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=469/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=1876.0MB, aggrb=31819KB/s, minb=31819KB/s, maxb=31819KB/s, mint=60373msec, maxt=60373msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=30152: Sat Jun 18 00:29:53 2016
  write: io=1900.0MB, bw=32395KB/s, iops=7, runt= 60058msec
    slat (msec): min=78, max=657, avg=126.42, stdev=76.52
    clat (usec): min=12, max=2858.6K, avg=1862880.76, stdev=366179.04
     lat (msec): min=110, max=2954, avg=1989.30, stdev=373.69
    clat percentiles (msec):
     |  1.00th=[  408],  5.00th=[ 1516], 10.00th=[ 1565], 20.00th=[ 1631],
     | 30.00th=[ 1680], 40.00th=[ 1745], 50.00th=[ 1827], 60.00th=[ 1909],
     | 70.00th=[ 1958], 80.00th=[ 2089], 90.00th=[ 2442], 95.00th=[ 2540],
     | 99.00th=[ 2704], 99.50th=[ 2737], 99.90th=[ 2868], 99.95th=[ 2868],
     | 99.99th=[ 2868]
    bw (KB  /s): min= 1949, max=43807, per=100.00%, avg=32751.27, stdev=9183.31
    lat (usec) : 20=0.21%
    lat (msec) : 250=0.42%, 500=0.42%, 750=0.42%, 1000=0.42%, 2000=70.74%
    lat (msec) : >=2000=27.37%
  cpu          : usr=0.30%, sys=0.31%, ctx=477, majf=0, minf=30
  IO depths    : 1=0.2%, 2=0.4%, 4=0.8%, 8=1.7%, 16=96.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.8%, 8=0.0%, 16=0.2%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=475/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=1900.0MB, aggrb=32395KB/s, minb=32395KB/s, maxb=32395KB/s, mint=60058msec, maxt=60058msec
```

# Throughput Read
------------------------ Test 1 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
libaio-filesystem: Laying out IO file(s) (1 file(s) / 5120MB)

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=30871: Sat Jun 18 00:31:51 2016
  read : io=5120.0MB, bw=91381KB/s, iops=22, runt= 57374msec
    slat (usec): min=43555, max=47280, avg=44806.61, stdev=899.40
    clat (usec): min=9, max=696349, avg=667998.13, stdev=44098.76
     lat (msec): min=44, max=743, avg=712.81, stdev=44.11
    clat percentiles (msec):
     |  1.00th=[  537],  5.00th=[  668], 10.00th=[  668], 20.00th=[  668],
     | 30.00th=[  668], 40.00th=[  668], 50.00th=[  676], 60.00th=[  676],
     | 70.00th=[  676], 80.00th=[  676], 90.00th=[  676], 95.00th=[  676],
     | 99.00th=[  685], 99.50th=[  685], 99.90th=[  693], 99.95th=[  701],
     | 99.99th=[  701]
    bw (KB  /s): min= 5512, max=92914, per=99.25%, avg=90695.84, stdev=8368.87
    lat (usec) : 10=0.08%
    lat (msec) : 50=0.08%, 100=0.08%, 250=0.23%, 500=0.47%, 750=99.06%
  cpu          : usr=0.03%, sys=0.92%, ctx=2617, majf=0, minf=63
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=91380KB/s, minb=91380KB/s, maxb=91380KB/s, mint=57374msec, maxt=57374msec
```

------------------------ Test 2 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=31244: Sat Jun 18 00:32:49 2016
  read : io=5120.0MB, bw=91611KB/s, iops=22, runt= 57230msec
    slat (usec): min=43434, max=47352, avg=44694.70, stdev=897.56
    clat (usec): min=10, max=695472, avg=666301.05, stdev=43887.73
     lat (msec): min=45, max=742, avg=711.00, stdev=43.89
    clat percentiles (msec):
     |  1.00th=[  537],  5.00th=[  668], 10.00th=[  668], 20.00th=[  668],
     | 30.00th=[  668], 40.00th=[  668], 50.00th=[  668], 60.00th=[  668],
     | 70.00th=[  676], 80.00th=[  676], 90.00th=[  676], 95.00th=[  676],
     | 99.00th=[  676], 99.50th=[  685], 99.90th=[  693], 99.95th=[  693],
     | 99.99th=[  693]
    bw (KB  /s): min= 5520, max=92914, per=99.26%, avg=90935.75, stdev=8390.49
    lat (usec) : 20=0.08%
    lat (msec) : 50=0.08%, 100=0.08%, 250=0.23%, 500=0.47%, 750=99.06%
  cpu          : usr=0.01%, sys=0.95%, ctx=2669, majf=0, minf=62
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=91610KB/s, minb=91610KB/s, maxb=91610KB/s, mint=57230msec, maxt=57230msec
```

------------------------ Test 3 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=31522: Sat Jun 18 00:33:46 2016
  read : io=5120.0MB, bw=91620KB/s, iops=22, runt= 57224msec
    slat (usec): min=43408, max=47193, avg=44690.38, stdev=893.15
    clat (usec): min=9, max=694444, avg=666244.59, stdev=43794.57
     lat (msec): min=45, max=740, avg=710.94, stdev=43.77
    clat percentiles (msec):
     |  1.00th=[  545],  5.00th=[  668], 10.00th=[  668], 20.00th=[  668],
     | 30.00th=[  668], 40.00th=[  668], 50.00th=[  668], 60.00th=[  668],
     | 70.00th=[  676], 80.00th=[  676], 90.00th=[  676], 95.00th=[  676],
     | 99.00th=[  676], 99.50th=[  685], 99.90th=[  693], 99.95th=[  693],
     | 99.99th=[  693]
    bw (KB  /s): min= 5527, max=93090, per=99.26%, avg=90938.97, stdev=8389.65
    lat (usec) : 10=0.08%
    lat (msec) : 50=0.08%, 100=0.08%, 250=0.23%, 500=0.47%, 750=99.06%
  cpu          : usr=0.06%, sys=0.92%, ctx=2681, majf=0, minf=573
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=91620KB/s, minb=91620KB/s, maxb=91620KB/s, mint=57224msec, maxt=57224msec
```

------------------------ Test 4 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=31525: Sat Jun 18 00:34:44 2016
  read : io=5120.0MB, bw=91620KB/s, iops=22, runt= 57224msec
    slat (usec): min=43458, max=47097, avg=44689.87, stdev=892.46
    clat (usec): min=8, max=695216, avg=666242.10, stdev=43797.84
     lat (msec): min=45, max=741, avg=710.94, stdev=43.78
    clat percentiles (msec):
     |  1.00th=[  537],  5.00th=[  668], 10.00th=[  668], 20.00th=[  668],
     | 30.00th=[  668], 40.00th=[  668], 50.00th=[  668], 60.00th=[  668],
     | 70.00th=[  676], 80.00th=[  676], 90.00th=[  676], 95.00th=[  676],
     | 99.00th=[  676], 99.50th=[  685], 99.90th=[  693], 99.95th=[  693],
     | 99.99th=[  693]
    bw (KB  /s): min= 5527, max=93090, per=99.26%, avg=90945.28, stdev=8389.48
    lat (usec) : 10=0.08%
    lat (msec) : 50=0.08%, 100=0.08%, 250=0.23%, 500=0.47%, 750=99.06%
  cpu          : usr=0.04%, sys=0.93%, ctx=2682, majf=0, minf=573
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=91620KB/s, minb=91620KB/s, maxb=91620KB/s, mint=57224msec, maxt=57224msec
```

------------------------ Test 5 ------------------------
```
libaio-filesystem: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=libaio, iodepth=16
fio-2.8-1-g87a0
Starting 1 process

libaio-filesystem: (groupid=0, jobs=1): err= 0: pid=31528: Sat Jun 18 00:35:41 2016
  read : io=5120.0MB, bw=91622KB/s, iops=22, runt= 57223msec
    slat (usec): min=43431, max=47607, avg=44689.08, stdev=892.96
    clat (usec): min=10, max=696245, avg=666222.16, stdev=43828.20
     lat (msec): min=45, max=743, avg=710.91, stdev=43.82
    clat percentiles (msec):
     |  1.00th=[  537],  5.00th=[  668], 10.00th=[  668], 20.00th=[  668],
     | 30.00th=[  668], 40.00th=[  668], 50.00th=[  668], 60.00th=[  668],
     | 70.00th=[  676], 80.00th=[  676], 90.00th=[  676], 95.00th=[  676],
     | 99.00th=[  676], 99.50th=[  685], 99.90th=[  693], 99.95th=[  693],
     | 99.99th=[  693]
    bw (KB  /s): min= 5512, max=93090, per=99.26%, avg=90940.07, stdev=8389.18
    lat (usec) : 20=0.08%
    lat (msec) : 50=0.08%, 100=0.08%, 250=0.23%, 500=0.47%, 750=99.06%
  cpu          : usr=0.04%, sys=0.92%, ctx=2694, majf=0, minf=573
  IO depths    : 1=0.1%, 2=0.2%, 4=0.3%, 8=0.6%, 16=98.8%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=99.9%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=91621KB/s, minb=91621KB/s, maxb=91621KB/s, mint=57223msec, maxt=57223msec
```
