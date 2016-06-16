# rados block device using fio-rbd

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
--rbdname="block-device" --bs="4k" --rw="write" \
--runtime="20" --iodepth="16" --group_reporting \
--name="fio-rbd"
```

IOPs Read：
```sh
$ fio --direct="1" --ioengine="rbd" --clientname="admin" --pool="bench" \
--rbdname="block-device" --bs="4k" --rw="read" --numjobs="1" \
--runtime="20" --iodepth="16" --group_reporting \
--name="fio-rbd"
```

Throughput Write and read 指令：
```sh
$ fio --direct="1" --ioengine="rbd" --clientname="admin" --pool="bench" \
--rbdname="block-device" --bs="4M" --rw="write" --group_reporting \
--runtime="60" --iodepth="16" --size="5G" \
--name="fio-rbd"
```

### WRITE
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2048KB/0KB /s] [0/512/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=20886: Thu Jun 16 17:57:32 2016
  write: io=48448KB, bw=2420.6KB/s, iops=605, runt= 20015msec
    slat (usec): min=0, max=29, avg= 2.02, stdev= 1.88
    clat (msec): min=12, max=222, avg=26.40, stdev=21.52
     lat (msec): min=12, max=222, avg=26.40, stdev=21.52
    clat percentiles (msec):
     |  1.00th=[   14],  5.00th=[   16], 10.00th=[   17], 20.00th=[   18],
     | 30.00th=[   19], 40.00th=[   21], 50.00th=[   22], 60.00th=[   29],
     | 70.00th=[   30], 80.00th=[   31], 90.00th=[   34], 95.00th=[   39],
     | 99.00th=[  204], 99.50th=[  210], 99.90th=[  223], 99.95th=[  223],
     | 99.99th=[  223]
    bw (KB  /s): min= 1167, max= 3913, per=100.00%, avg=2436.55, stdev=771.17
    lat (msec) : 20=39.07%, 50=59.08%, 100=0.66%, 250=1.19%
  cpu          : usr=0.31%, sys=0.04%, ctx=840, majf=0, minf=14
  IO depths    : 1=6.3%, 2=12.5%, 4=25.0%, 8=50.0%, 16=6.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.1%, 8=0.0%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12112/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=48448KB, aggrb=2420KB/s, minb=2420KB/s, maxb=2420KB/s, mint=20015msec, maxt=20015msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2112KB/0KB /s] [0/528/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=27614: Thu Jun 16 18:01:10 2016
  write: io=49408KB, bw=2470.2KB/s, iops=617, runt= 20002msec
    slat (usec): min=0, max=29, avg= 1.99, stdev= 1.95
    clat (msec): min=12, max=221, avg=25.87, stdev=19.88
     lat (msec): min=12, max=221, avg=25.87, stdev=19.88
    clat percentiles (msec):
     |  1.00th=[   13],  5.00th=[   16], 10.00th=[   17], 20.00th=[   18],
     | 30.00th=[   19], 40.00th=[   21], 50.00th=[   22], 60.00th=[   29],
     | 70.00th=[   30], 80.00th=[   31], 90.00th=[   33], 95.00th=[   37],
     | 99.00th=[  196], 99.50th=[  212], 99.90th=[  223], 99.95th=[  223],
     | 99.99th=[  223]
    bw (KB  /s): min= 1366, max= 3555, per=100.00%, avg=2482.26, stdev=687.19
    lat (msec) : 20=39.09%, 50=59.87%, 250=1.04%
  cpu          : usr=0.26%, sys=0.09%, ctx=859, majf=0, minf=14
  IO depths    : 1=6.3%, 2=12.5%, 4=25.0%, 8=50.0%, 16=6.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.1%, 8=0.0%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12352/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=49408KB, aggrb=2470KB/s, minb=2470KB/s, maxb=2470KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2112KB/0KB /s] [0/528/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=28709: Thu Jun 16 18:01:43 2016
  write: io=48320KB, bw=2414.9KB/s, iops=603, runt= 20010msec
    slat (usec): min=0, max=32, avg= 2.04, stdev= 1.94
    clat (msec): min=12, max=222, avg=26.46, stdev=22.59
     lat (msec): min=12, max=222, avg=26.46, stdev=22.59
    clat percentiles (msec):
     |  1.00th=[   14],  5.00th=[   16], 10.00th=[   17], 20.00th=[   18],
     | 30.00th=[   19], 40.00th=[   20], 50.00th=[   22], 60.00th=[   29],
     | 70.00th=[   30], 80.00th=[   31], 90.00th=[   34], 95.00th=[   38],
     | 99.00th=[  204], 99.50th=[  212], 99.90th=[  223], 99.95th=[  223],
     | 99.99th=[  223]
    bw (KB  /s): min= 1340, max= 3928, per=100.00%, avg=2436.24, stdev=761.37
    lat (msec) : 20=42.30%, 50=55.98%, 100=0.40%, 250=1.32%
  cpu          : usr=0.29%, sys=0.06%, ctx=841, majf=0, minf=14
  IO depths    : 1=6.3%, 2=12.5%, 4=25.0%, 8=50.0%, 16=6.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.1%, 8=0.0%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12080/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=48320KB, aggrb=2414KB/s, minb=2414KB/s, maxb=2414KB/s, mint=20010msec, maxt=20010msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/1920KB/0KB /s] [0/480/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=30189: Thu Jun 16 18:02:30 2016
  write: io=48768KB, bw=2437.7KB/s, iops=609, runt= 20011msec
    slat (usec): min=0, max=26, avg= 2.03, stdev= 1.86
    clat (msec): min=10, max=221, avg=26.22, stdev=20.13
     lat (msec): min=10, max=221, avg=26.22, stdev=20.13
    clat percentiles (msec):
     |  1.00th=[   13],  5.00th=[   15], 10.00th=[   17], 20.00th=[   18],
     | 30.00th=[   19], 40.00th=[   21], 50.00th=[   22], 60.00th=[   29],
     | 70.00th=[   31], 80.00th=[   32], 90.00th=[   35], 95.00th=[   38],
     | 99.00th=[  202], 99.50th=[  208], 99.90th=[  223], 99.95th=[  223],
     | 99.99th=[  223]
    bw (KB  /s): min= 1285, max= 3840, per=100.00%, avg=2442.74, stdev=702.34
    lat (msec) : 20=38.41%, 50=60.15%, 100=0.39%, 250=1.05%
  cpu          : usr=0.27%, sys=0.09%, ctx=834, majf=0, minf=14
  IO depths    : 1=6.2%, 2=12.5%, 4=25.0%, 8=50.0%, 16=6.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.1%, 8=0.0%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12192/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=48768KB, aggrb=2437KB/s, minb=2437KB/s, maxb=2437KB/s, mint=20011msec, maxt=20011msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/2048KB/0KB /s] [0/512/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=31107: Thu Jun 16 18:02:58 2016
  write: io=48384KB, bw=2416.6KB/s, iops=604, runt= 20026msec
    slat (usec): min=0, max=1534, avg= 2.24, stdev=18.37
    clat (msec): min=13, max=222, avg=26.45, stdev=22.50
     lat (msec): min=13, max=222, avg=26.45, stdev=22.50
    clat percentiles (msec):
     |  1.00th=[   15],  5.00th=[   16], 10.00th=[   17], 20.00th=[   18],
     | 30.00th=[   19], 40.00th=[   20], 50.00th=[   22], 60.00th=[   29],
     | 70.00th=[   30], 80.00th=[   31], 90.00th=[   33], 95.00th=[   38],
     | 99.00th=[  202], 99.50th=[  221], 99.90th=[  223], 99.95th=[  223],
     | 99.99th=[  223]
    bw (KB  /s): min= 1285, max= 3646, per=100.00%, avg=2427.45, stdev=771.32
    lat (msec) : 20=42.33%, 50=55.82%, 100=0.53%, 250=1.32%
  cpu          : usr=0.25%, sys=0.09%, ctx=824, majf=0, minf=14
  IO depths    : 1=6.2%, 2=12.5%, 4=25.0%, 8=50.0%, 16=6.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.1%, 8=0.0%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12096/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=48384KB, aggrb=2416KB/s, minb=2416KB/s, maxb=2416KB/s, mint=20026msec, maxt=20026msec
```

### READ
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [20331KB/0KB/0KB /s] [5082/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=1341: Thu Jun 16 18:21:54 2016
  read : io=462648KB, bw=23130KB/s, iops=5782, runt= 20002msec
    slat (usec): min=0, max=114, avg= 1.34, stdev= 1.58
    clat (usec): min=7, max=30791, avg=2740.20, stdev=1135.47
     lat (usec): min=23, max=30793, avg=2741.54, stdev=1135.46
    clat percentiles (usec):
     |  1.00th=[  175],  5.00th=[  241], 10.00th=[ 2040], 20.00th=[ 2384],
     | 30.00th=[ 2576], 40.00th=[ 2704], 50.00th=[ 2832], 60.00th=[ 2896],
     | 70.00th=[ 3024], 80.00th=[ 3184], 90.00th=[ 3664], 95.00th=[ 4128],
     | 99.00th=[ 5664], 99.50th=[ 6688], 99.90th=[ 9152], 99.95th=[11456],
     | 99.99th=[29568]
    bw (KB  /s): min=16392, max=61131, per=100.00%, avg=23187.64, stdev=7895.55
    lat (usec) : 10=0.01%, 20=0.01%, 50=0.81%, 100=0.04%, 250=4.92%
    lat (usec) : 500=3.86%, 750=0.06%, 1000=0.01%
    lat (msec) : 2=0.13%, 4=84.00%, 10=6.10%, 20=0.06%, 50=0.01%
  cpu          : usr=1.70%, sys=0.75%, ctx=7816, majf=0, minf=16
  IO depths    : 1=6.2%, 2=12.4%, 4=24.8%, 8=49.7%, 16=7.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.2%, 8=0.1%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=115662/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=462648KB, aggrb=23130KB/s, minb=23130KB/s, maxb=23130KB/s, mint=20002msec, maxt=20002msec

Disk stats (read/write):
  sda: ios=2/0, merge=0/0, ticks=24/0, in_queue=24, util=0.12%
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [20587KB/0KB/0KB /s] [5146/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=2339: Thu Jun 16 18:22:26 2016
  read : io=463104KB, bw=23152KB/s, iops=5787, runt= 20003msec
    slat (usec): min=0, max=212, avg= 1.29, stdev= 1.65
    clat (usec): min=5, max=13901, avg=2738.22, stdev=1068.54
     lat (usec): min=23, max=13905, avg=2739.52, stdev=1068.53
    clat percentiles (usec):
     |  1.00th=[  181],  5.00th=[  239], 10.00th=[ 2096], 20.00th=[ 2416],
     | 30.00th=[ 2576], 40.00th=[ 2704], 50.00th=[ 2800], 60.00th=[ 2896],
     | 70.00th=[ 2992], 80.00th=[ 3216], 90.00th=[ 3664], 95.00th=[ 4192],
     | 99.00th=[ 5600], 99.50th=[ 6496], 99.90th=[ 8640], 99.95th=[ 9152],
     | 99.99th=[13888]
    bw (KB  /s): min=15514, max=66416, per=100.00%, avg=23215.67, stdev=8253.12
    lat (usec) : 10=0.01%, 20=0.01%, 50=0.76%, 100=0.07%, 250=4.93%
    lat (usec) : 500=3.85%, 750=0.04%, 1000=0.01%
    lat (msec) : 2=0.08%, 4=83.88%, 10=6.32%, 20=0.04%
  cpu          : usr=1.73%, sys=0.63%, ctx=7813, majf=0, minf=16
  IO depths    : 1=6.2%, 2=12.4%, 4=24.8%, 8=49.7%, 16=7.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.2%, 8=0.1%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=115776/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=463104KB, aggrb=23151KB/s, minb=23151KB/s, maxb=23151KB/s, mint=20003msec, maxt=20003msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [20992KB/0KB/0KB /s] [5248/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=3481: Thu Jun 16 18:23:01 2016
  read : io=462388KB, bw=23118KB/s, iops=5779, runt= 20001msec
    slat (usec): min=0, max=280, avg= 1.28, stdev= 1.70
    clat (usec): min=25, max=13034, avg=2742.19, stdev=1089.33
     lat (usec): min=28, max=13044, avg=2743.47, stdev=1089.35
    clat percentiles (usec):
     |  1.00th=[  195],  5.00th=[  235], 10.00th=[ 2064], 20.00th=[ 2384],
     | 30.00th=[ 2544], 40.00th=[ 2704], 50.00th=[ 2832], 60.00th=[ 2928],
     | 70.00th=[ 3024], 80.00th=[ 3216], 90.00th=[ 3760], 95.00th=[ 4192],
     | 99.00th=[ 5664], 99.50th=[ 6560], 99.90th=[ 9024], 99.95th=[ 9536],
     | 99.99th=[12992]
    bw (KB  /s): min=16606, max=68504, per=100.00%, avg=23210.28, stdev=8435.23
    lat (usec) : 50=0.92%, 100=0.01%, 250=6.16%, 500=2.62%, 750=0.01%
    lat (usec) : 1000=0.03%
    lat (msec) : 2=0.07%, 4=83.00%, 10=7.16%, 20=0.03%
  cpu          : usr=1.59%, sys=0.79%, ctx=7616, majf=0, minf=16
  IO depths    : 1=6.2%, 2=12.4%, 4=24.8%, 8=49.6%, 16=7.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.2%, 8=0.0%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=115597/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=462388KB, aggrb=23118KB/s, minb=23118KB/s, maxb=23118KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [20715KB/0KB/0KB /s] [5178/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=6699: Thu Jun 16 18:24:43 2016
  read : io=460540KB, bw=23024KB/s, iops=5755, runt= 20003msec
    slat (usec): min=0, max=2899, avg= 1.37, stdev= 8.71
    clat (usec): min=21, max=10192, avg=2752.32, stdev=1080.64
     lat (usec): min=22, max=10199, avg=2753.69, stdev=1080.61
    clat percentiles (usec):
     |  1.00th=[  167],  5.00th=[  243], 10.00th=[ 2064], 20.00th=[ 2448],
     | 30.00th=[ 2608], 40.00th=[ 2736], 50.00th=[ 2832], 60.00th=[ 2896],
     | 70.00th=[ 2992], 80.00th=[ 3184], 90.00th=[ 3664], 95.00th=[ 4192],
     | 99.00th=[ 5856], 99.50th=[ 6816], 99.90th=[ 8768], 99.95th=[ 9280],
     | 99.99th=[10176]
    bw (KB  /s): min=15936, max=64888, per=100.00%, avg=23059.05, stdev=8146.23
    lat (usec) : 50=0.94%, 100=0.02%, 250=4.58%, 500=4.01%, 750=0.12%
    lat (usec) : 1000=0.03%
    lat (msec) : 2=0.11%, 4=83.64%, 10=6.52%, 20=0.03%
  cpu          : usr=1.81%, sys=0.64%, ctx=7560, majf=0, minf=16
  IO depths    : 1=6.2%, 2=12.4%, 4=24.8%, 8=49.5%, 16=7.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.2%, 8=0.0%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=115135/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=460540KB, aggrb=23023KB/s, minb=23023KB/s, maxb=23023KB/s, mint=20003msec, maxt=20003msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [21356KB/0KB/0KB /s] [5339/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=7696: Thu Jun 16 18:25:14 2016
  read : io=455892KB, bw=22791KB/s, iops=5697, runt= 20003msec
    slat (usec): min=0, max=3931, avg= 1.34, stdev=11.72
    clat (usec): min=20, max=13787, avg=2780.36, stdev=1128.08
     lat (usec): min=21, max=13799, avg=2781.71, stdev=1128.08
    clat percentiles (usec):
     |  1.00th=[  173],  5.00th=[  233], 10.00th=[ 2040], 20.00th=[ 2480],
     | 30.00th=[ 2608], 40.00th=[ 2736], 50.00th=[ 2832], 60.00th=[ 2928],
     | 70.00th=[ 3024], 80.00th=[ 3248], 90.00th=[ 3760], 95.00th=[ 4320],
     | 99.00th=[ 6112], 99.50th=[ 7200], 99.90th=[ 9152], 99.95th=[11200],
     | 99.99th=[13760]
    bw (KB  /s): min=15360, max=65389, per=100.00%, avg=22833.62, stdev=8296.51
    lat (usec) : 50=0.92%, 100=0.01%, 250=6.20%, 500=2.63%, 750=0.03%
    lat (usec) : 1000=0.04%
    lat (msec) : 2=0.13%, 4=82.72%, 10=7.27%, 20=0.06%
  cpu          : usr=1.85%, sys=0.58%, ctx=7476, majf=0, minf=16
  IO depths    : 1=6.2%, 2=12.4%, 4=24.8%, 8=49.6%, 16=7.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=94.2%, 8=0.1%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=113973/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=455892KB, aggrb=22791KB/s, minb=22791KB/s, maxb=22791KB/s, mint=20003msec, maxt=20003msec
```

### READ-WRITE
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [M(1)] [100.0% done] [1548KB/1392KB/0KB /s] [387/348/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=8863: Thu Jun 16 18:25:49 2016
  read : io=36188KB, bw=1809.3KB/s, iops=452, runt= 20002msec
    slat (usec): min=0, max=23, avg= 2.01, stdev= 2.09
    clat (usec): min=16, max=214210, avg=10035.41, stdev=15496.16
     lat (usec): min=20, max=214218, avg=10037.43, stdev=15496.16
    clat percentiles (usec):
     |  1.00th=[   40],  5.00th=[  159], 10.00th=[  350], 20.00th=[  748],
     | 30.00th=[  940], 40.00th=[ 1096], 50.00th=[ 1288], 60.00th=[11200],
     | 70.00th=[15936], 80.00th=[19328], 90.00th=[28544], 95.00th=[30592],
     | 99.00th=[43264], 99.50th=[48896], 99.90th=[209920], 99.95th=[214016],
     | 99.99th=[214016]
    bw (KB  /s): min=  782, max= 3410, per=100.00%, avg=1818.66, stdev=627.55
  write: io=35736KB, bw=1786.7KB/s, iops=446, runt= 20002msec
    slat (usec): min=0, max=111, avg= 2.25, stdev= 2.45
    clat (msec): min=7, max=215, avg=25.59, stdev=22.57
     lat (msec): min=7, max=215, avg=25.59, stdev=22.57
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   13], 10.00th=[   15], 20.00th=[   16],
     | 30.00th=[   18], 40.00th=[   20], 50.00th=[   21], 60.00th=[   28],
     | 70.00th=[   29], 80.00th=[   31], 90.00th=[   33], 95.00th=[   40],
     | 99.00th=[  206], 99.50th=[  210], 99.90th=[  217], 99.95th=[  217],
     | 99.99th=[  217]
    bw (KB  /s): min=  702, max= 2978, per=100.00%, avg=1796.71, stdev=587.66
    lat (usec) : 20=0.01%, 50=1.55%, 100=0.41%, 250=1.82%, 500=3.09%
    lat (usec) : 750=3.34%, 1000=6.72%
    lat (msec) : 2=11.77%, 4=0.21%, 10=1.42%, 20=35.10%, 50=33.55%
    lat (msec) : 100=0.21%, 250=0.80%
  cpu          : usr=0.46%, sys=0.20%, ctx=1842, majf=0, minf=15
  IO depths    : 1=4.4%, 2=8.9%, 4=19.0%, 8=57.1%, 16=10.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.4%, 8=1.6%, 16=5.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=9047/w=8934/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=36188KB, aggrb=1809KB/s, minb=1809KB/s, maxb=1809KB/s, mint=20002msec, maxt=20002msec
  WRITE: io=35736KB, aggrb=1786KB/s, minb=1786KB/s, maxb=1786KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [M(1)] [100.0% done] [1560KB/1476KB/0KB /s] [390/369/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=9961: Thu Jun 16 18:26:23 2016
  read : io=36724KB, bw=1835.7KB/s, iops=458, runt= 20006msec
    slat (usec): min=0, max=26, avg= 2.08, stdev= 2.01
    clat (usec): min=14, max=204587, avg=10334.69, stdev=13595.12
     lat (usec): min=18, max=204595, avg=10336.77, stdev=13595.03
    clat percentiles (usec):
     |  1.00th=[   42],  5.00th=[  121], 10.00th=[  342], 20.00th=[  748],
     | 30.00th=[  964], 40.00th=[ 1112], 50.00th=[ 1304], 60.00th=[13632],
     | 70.00th=[17280], 80.00th=[19840], 90.00th=[28288], 95.00th=[30080],
     | 99.00th=[39680], 99.50th=[46848], 99.90th=[201728], 99.95th=[203776],
     | 99.99th=[203776]
    bw (KB  /s): min=  866, max= 3227, per=100.00%, avg=1838.23, stdev=613.85
  write: io=36312KB, bw=1815.6KB/s, iops=453, runt= 20006msec
    slat (usec): min=0, max=43, avg= 2.33, stdev= 2.09
    clat (msec): min=8, max=206, avg=24.74, stdev=17.56
     lat (msec): min=8, max=206, avg=24.74, stdev=17.56
    clat percentiles (msec):
     |  1.00th=[   11],  5.00th=[   14], 10.00th=[   15], 20.00th=[   17],
     | 30.00th=[   18], 40.00th=[   20], 50.00th=[   21], 60.00th=[   28],
     | 70.00th=[   29], 80.00th=[   30], 90.00th=[   33], 95.00th=[   40],
     | 99.00th=[   67], 99.50th=[  202], 99.90th=[  206], 99.95th=[  206],
     | 99.99th=[  206]
    bw (KB  /s): min=  783, max= 3013, per=100.00%, avg=1817.97, stdev=564.88
    lat (usec) : 20=0.02%, 50=1.86%, 100=0.47%, 250=1.65%, 500=3.16%
    lat (usec) : 750=2.92%, 1000=6.29%
    lat (msec) : 2=11.29%, 4=0.19%, 10=1.03%, 20=36.45%, 50=33.71%
    lat (msec) : 100=0.53%, 250=0.44%
  cpu          : usr=0.42%, sys=0.25%, ctx=1804, majf=0, minf=15
  IO depths    : 1=4.5%, 2=9.0%, 4=19.2%, 8=56.7%, 16=10.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.4%, 8=1.5%, 16=5.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=9181/w=9078/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=36724KB, aggrb=1835KB/s, minb=1835KB/s, maxb=1835KB/s, mint=20006msec, maxt=20006msec
  WRITE: io=36312KB, aggrb=1815KB/s, minb=1815KB/s, maxb=1815KB/s, mint=20006msec, maxt=20006msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [M(1)] [100.0% done] [1472KB/1456KB/0KB /s] [368/364/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=17533: Thu Jun 16 18:30:26 2016
  read : io=36372KB, bw=1817.7KB/s, iops=454, runt= 20011msec
    slat (usec): min=0, max=46, avg= 2.07, stdev= 2.17
    clat (usec): min=15, max=213534, avg=10197.27, stdev=15786.17
     lat (usec): min=20, max=213536, avg=10199.34, stdev=15786.11
    clat percentiles (usec):
     |  1.00th=[   41],  5.00th=[  135], 10.00th=[  334], 20.00th=[  756],
     | 30.00th=[  956], 40.00th=[ 1128], 50.00th=[ 1336], 60.00th=[11456],
     | 70.00th=[16512], 80.00th=[19584], 90.00th=[28032], 95.00th=[29824],
     | 99.00th=[38656], 99.50th=[48896], 99.90th=[207872], 99.95th=[214016],
     | 99.99th=[214016]
    bw (KB  /s): min=  914, max= 3134, per=100.00%, avg=1833.37, stdev=625.75
  write: io=35972KB, bw=1797.7KB/s, iops=449, runt= 20011msec
    slat (usec): min=0, max=36, avg= 2.27, stdev= 2.10
    clat (msec): min=8, max=215, avg=25.22, stdev=21.67
     lat (msec): min=8, max=215, avg=25.22, stdev=21.67
    clat percentiles (msec):
     |  1.00th=[   10],  5.00th=[   13], 10.00th=[   15], 20.00th=[   16],
     | 30.00th=[   18], 40.00th=[   19], 50.00th=[   21], 60.00th=[   27],
     | 70.00th=[   29], 80.00th=[   30], 90.00th=[   33], 95.00th=[   39],
     | 99.00th=[  194], 99.50th=[  204], 99.90th=[  215], 99.95th=[  215],
     | 99.99th=[  215]
    bw (KB  /s): min=  795, max= 3064, per=100.00%, avg=1810.39, stdev=586.48
    lat (usec) : 20=0.01%, 50=1.71%, 100=0.51%, 250=1.65%, 500=3.28%
    lat (usec) : 750=2.87%, 1000=6.57%
    lat (msec) : 2=11.47%, 4=0.09%, 10=1.53%, 20=36.34%, 50=32.70%
    lat (msec) : 100=0.48%, 250=0.80%
  cpu          : usr=0.46%, sys=0.20%, ctx=1907, majf=0, minf=15
  IO depths    : 1=4.5%, 2=9.0%, 4=19.0%, 8=56.9%, 16=10.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.4%, 8=1.6%, 16=5.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=9093/w=8993/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=36372KB, aggrb=1817KB/s, minb=1817KB/s, maxb=1817KB/s, mint=20011msec, maxt=20011msec
  WRITE: io=35972KB, aggrb=1797KB/s, minb=1797KB/s, maxb=1797KB/s, mint=20011msec, maxt=20011msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [M(1)] [100.0% done] [1464KB/1492KB/0KB /s] [366/373/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=18520: Thu Jun 16 18:30:56 2016
  read : io=35628KB, bw=1781.4KB/s, iops=445, runt= 20001msec
    slat (usec): min=0, max=29, avg= 1.97, stdev= 2.12
    clat (usec): min=24, max=222700, avg=10400.65, stdev=16209.43
     lat (usec): min=29, max=222703, avg=10402.62, stdev=16209.39
    clat percentiles (usec):
     |  1.00th=[   40],  5.00th=[  215], 10.00th=[  398], 20.00th=[  788],
     | 30.00th=[  964], 40.00th=[ 1096], 50.00th=[ 1288], 60.00th=[12608],
     | 70.00th=[16768], 80.00th=[19584], 90.00th=[28032], 95.00th=[30848],
     | 99.00th=[41216], 99.50th=[52480], 99.90th=[214016], 99.95th=[218112],
     | 99.99th=[222208]
    bw (KB  /s): min=  876, max= 2946, per=100.00%, avg=1790.97, stdev=590.31
  write: io=35124KB, bw=1756.2KB/s, iops=439, runt= 20001msec
    slat (usec): min=0, max=28, avg= 2.16, stdev= 2.06
    clat (msec): min=8, max=224, avg=25.82, stdev=22.46
     lat (msec): min=8, max=224, avg=25.83, stdev=22.46
    clat percentiles (msec):
     |  1.00th=[   11],  5.00th=[   15], 10.00th=[   16], 20.00th=[   17],
     | 30.00th=[   18], 40.00th=[   20], 50.00th=[   21], 60.00th=[   28],
     | 70.00th=[   29], 80.00th=[   31], 90.00th=[   34], 95.00th=[   39],
     | 99.00th=[  198], 99.50th=[  215], 99.90th=[  225], 99.95th=[  225],
     | 99.99th=[  225]
    bw (KB  /s): min=  955, max= 2648, per=100.00%, avg=1772.11, stdev=542.18
    lat (usec) : 50=1.28%, 100=0.33%, 250=1.31%, 500=3.34%, 750=3.04%
    lat (usec) : 1000=6.86%
    lat (msec) : 2=12.23%, 4=0.18%, 10=0.92%, 20=36.43%, 50=32.73%
    lat (msec) : 100=0.54%, 250=0.81%
  cpu          : usr=0.42%, sys=0.21%, ctx=1842, majf=0, minf=15
  IO depths    : 1=4.5%, 2=8.9%, 4=19.0%, 8=57.4%, 16=10.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.2%, 8=1.7%, 16=5.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8907/w=8781/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=35628KB, aggrb=1781KB/s, minb=1781KB/s, maxb=1781KB/s, mint=20001msec, maxt=20001msec
  WRITE: io=35124KB, aggrb=1756KB/s, minb=1756KB/s, maxb=1756KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=rw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [M(1)] [100.0% done] [1444KB/1328KB/0KB /s] [361/332/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=20290: Thu Jun 16 18:31:52 2016
  read : io=35992KB, bw=1797.2KB/s, iops=449, runt= 20018msec
    slat (usec): min=0, max=302, avg= 2.03, stdev= 3.81
    clat (usec): min=13, max=222649, avg=10544.68, stdev=16633.47
     lat (usec): min=16, max=222677, avg=10546.71, stdev=16633.46
    clat percentiles (usec):
     |  1.00th=[   41],  5.00th=[  139], 10.00th=[  382], 20.00th=[  780],
     | 30.00th=[  948], 40.00th=[ 1096], 50.00th=[ 1288], 60.00th=[12608],
     | 70.00th=[16768], 80.00th=[19584], 90.00th=[28032], 95.00th=[30080],
     | 99.00th=[45824], 99.50th=[65280], 99.90th=[214016], 99.95th=[214016],
     | 99.99th=[222208]
    bw (KB  /s): min=  910, max= 3129, per=100.00%, avg=1807.82, stdev=519.22
  write: io=35516KB, bw=1774.3KB/s, iops=443, runt= 20018msec
    slat (usec): min=0, max=35, avg= 2.19, stdev= 2.01
    clat (msec): min=8, max=224, avg=25.31, stdev=22.00
     lat (msec): min=8, max=224, avg=25.32, stdev=22.00
    clat percentiles (msec):
     |  1.00th=[   11],  5.00th=[   13], 10.00th=[   15], 20.00th=[   16],
     | 30.00th=[   18], 40.00th=[   19], 50.00th=[   21], 60.00th=[   27],
     | 70.00th=[   29], 80.00th=[   30], 90.00th=[   32], 95.00th=[   40],
     | 99.00th=[  200], 99.50th=[  206], 99.90th=[  225], 99.95th=[  225],
     | 99.99th=[  225]
    bw (KB  /s): min=  768, max= 2760, per=100.00%, avg=1783.21, stdev=497.94
    lat (usec) : 20=0.01%, 50=1.66%, 100=0.58%, 250=1.38%, 500=2.72%
    lat (usec) : 750=3.08%, 1000=7.52%
    lat (msec) : 2=10.92%, 4=0.16%, 10=0.81%, 20=37.00%, 50=32.44%
    lat (msec) : 100=0.90%, 250=0.81%
  cpu          : usr=0.43%, sys=0.21%, ctx=1810, majf=0, minf=15
  IO depths    : 1=4.5%, 2=9.0%, 4=19.4%, 8=56.7%, 16=10.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.4%, 8=1.5%, 16=5.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=8998/w=8879/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=35992KB, aggrb=1797KB/s, minb=1797KB/s, maxb=1797KB/s, mint=20018msec, maxt=20018msec
  WRITE: io=35516KB, aggrb=1774KB/s, minb=1774KB/s, maxb=1774KB/s, mint=20018msec, maxt=20018msec
```

### RAND-WRITE
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/2548KB/0KB /s] [0/637/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=21574: Thu Jun 16 18:32:32 2016
  write: io=54864KB, bw=2737.2KB/s, iops=684, runt= 20038msec
    slat (usec): min=0, max=1039, avg= 2.38, stdev= 9.32
    clat (msec): min=4, max=379, avg=23.33, stdev=18.22
     lat (msec): min=4, max=379, avg=23.34, stdev=18.22
    clat percentiles (msec):
     |  1.00th=[    7],  5.00th=[    9], 10.00th=[   11], 20.00th=[   13],
     | 30.00th=[   18], 40.00th=[   19], 50.00th=[   20], 60.00th=[   22],
     | 70.00th=[   26], 80.00th=[   30], 90.00th=[   37], 95.00th=[   43],
     | 99.00th=[   87], 99.50th=[  121], 99.90th=[  265], 99.95th=[  285],
     | 99.99th=[  347]
    bw (KB  /s): min= 1351, max= 3265, per=100.00%, avg=2773.50, stdev=497.18
    lat (msec) : 10=9.89%, 20=41.46%, 50=45.49%, 100=2.42%, 250=0.63%
    lat (msec) : 500=0.12%
  cpu          : usr=0.32%, sys=0.23%, ctx=1322, majf=0, minf=15
  IO depths    : 1=2.1%, 2=6.2%, 4=19.7%, 8=62.9%, 16=9.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.4%, 8=1.8%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=13716/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=54864KB, aggrb=2737KB/s, minb=2737KB/s, maxb=2737KB/s, mint=20038msec, maxt=20038msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/3028KB/0KB /s] [0/757/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=22719: Thu Jun 16 18:33:08 2016
  write: io=53400KB, bw=2669.3KB/s, iops=667, runt= 20006msec
    slat (usec): min=0, max=134, avg= 2.43, stdev= 2.94
    clat (msec): min=5, max=455, avg=23.94, stdev=24.63
     lat (msec): min=5, max=455, avg=23.94, stdev=24.63
    clat percentiles (msec):
     |  1.00th=[    8],  5.00th=[    9], 10.00th=[   11], 20.00th=[   13],
     | 30.00th=[   18], 40.00th=[   19], 50.00th=[   20], 60.00th=[   22],
     | 70.00th=[   27], 80.00th=[   30], 90.00th=[   37], 95.00th=[   42],
     | 99.00th=[   93], 99.50th=[  235], 99.90th=[  429], 99.95th=[  433],
     | 99.99th=[  433]
    bw (KB  /s): min=  701, max= 3280, per=100.00%, avg=2678.50, stdev=606.05
    lat (msec) : 10=9.42%, 20=41.79%, 50=46.55%, 100=1.31%, 250=0.60%
    lat (msec) : 500=0.33%
  cpu          : usr=0.33%, sys=0.21%, ctx=1296, majf=0, minf=15
  IO depths    : 1=2.0%, 2=6.1%, 4=19.8%, 8=63.0%, 16=9.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.4%, 8=1.7%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=13350/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=53400KB, aggrb=2669KB/s, minb=2669KB/s, maxb=2669KB/s, mint=20006msec, maxt=20006msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/2861KB/0KB /s] [0/715/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=23901: Thu Jun 16 18:33:45 2016
  write: io=53608KB, bw=2678.7KB/s, iops=669, runt= 20013msec
    slat (usec): min=0, max=44, avg= 2.22, stdev= 2.17
    clat (msec): min=5, max=507, avg=23.85, stdev=22.39
     lat (msec): min=5, max=507, avg=23.86, stdev=22.39
    clat percentiles (msec):
     |  1.00th=[    8],  5.00th=[    9], 10.00th=[   11], 20.00th=[   13],
     | 30.00th=[   19], 40.00th=[   20], 50.00th=[   21], 60.00th=[   22],
     | 70.00th=[   26], 80.00th=[   30], 90.00th=[   37], 95.00th=[   43],
     | 99.00th=[  112], 99.50th=[  198], 99.90th=[  334], 99.95th=[  347],
     | 99.99th=[  367]
    bw (KB  /s): min=  693, max= 3324, per=100.00%, avg=2688.23, stdev=550.16
    lat (msec) : 10=8.58%, 20=41.43%, 50=47.40%, 100=1.48%, 250=0.88%
    lat (msec) : 500=0.22%, 750=0.01%
  cpu          : usr=0.31%, sys=0.22%, ctx=1271, majf=0, minf=15
  IO depths    : 1=1.9%, 2=6.0%, 4=20.1%, 8=62.9%, 16=9.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.4%, 8=1.7%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=13402/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=53608KB, aggrb=2678KB/s, minb=2678KB/s, maxb=2678KB/s, mint=20013msec, maxt=20013msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/1144KB/0KB /s] [0/286/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=25268: Thu Jun 16 18:34:27 2016
  write: io=51728KB, bw=2583.8KB/s, iops=645, runt= 20021msec
    slat (usec): min=0, max=712, avg= 2.60, stdev= 7.26
    clat (msec): min=4, max=487, avg=24.73, stdev=27.17
     lat (msec): min=4, max=487, avg=24.73, stdev=27.17
    clat percentiles (msec):
     |  1.00th=[    7],  5.00th=[    9], 10.00th=[   10], 20.00th=[   12],
     | 30.00th=[   18], 40.00th=[   19], 50.00th=[   21], 60.00th=[   23],
     | 70.00th=[   27], 80.00th=[   31], 90.00th=[   38], 95.00th=[   45],
     | 99.00th=[  131], 99.50th=[  215], 99.90th=[  465], 99.95th=[  478],
     | 99.99th=[  486]
    bw (KB  /s): min=  532, max= 3247, per=100.00%, avg=2641.50, stdev=621.07
    lat (msec) : 10=10.25%, 20=39.50%, 50=46.95%, 100=2.01%, 250=1.04%
    lat (msec) : 500=0.25%
  cpu          : usr=0.37%, sys=0.16%, ctx=1294, majf=0, minf=15
  IO depths    : 1=1.9%, 2=5.9%, 4=19.1%, 8=63.8%, 16=9.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.3%, 8=2.0%, 16=5.7%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=12932/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=51728KB, aggrb=2583KB/s, minb=2583KB/s, maxb=2583KB/s, mint=20021msec, maxt=20021msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=randwrite, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [w(1)] [100.0% done] [0KB/3088KB/0KB /s] [0/772/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=26254: Thu Jun 16 18:34:58 2016
  write: io=53384KB, bw=2666.1KB/s, iops=666, runt= 20017msec
    slat (usec): min=0, max=1971, avg= 2.43, stdev=17.31
    clat (msec): min=4, max=475, avg=23.95, stdev=24.79
     lat (msec): min=4, max=475, avg=23.96, stdev=24.79
    clat percentiles (msec):
     |  1.00th=[    7],  5.00th=[    9], 10.00th=[   11], 20.00th=[   13],
     | 30.00th=[   18], 40.00th=[   20], 50.00th=[   21], 60.00th=[   23],
     | 70.00th=[   26], 80.00th=[   31], 90.00th=[   37], 95.00th=[   42],
     | 99.00th=[   70], 99.50th=[  165], 99.90th=[  412], 99.95th=[  433],
     | 99.99th=[  474]
    bw (KB  /s): min=  571, max= 3368, per=100.00%, avg=2703.92, stdev=585.33
    lat (msec) : 10=9.67%, 20=39.11%, 50=48.61%, 100=1.82%, 250=0.51%
    lat (msec) : 500=0.27%
  cpu          : usr=0.34%, sys=0.18%, ctx=1280, majf=0, minf=15
  IO depths    : 1=2.1%, 2=6.3%, 4=19.5%, 8=63.0%, 16=9.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.4%, 8=1.9%, 16=5.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=13346/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=53384KB, aggrb=2666KB/s, minb=2666KB/s, maxb=2666KB/s, mint=20017msec, maxt=20017msec
```

### RAND-READ
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [r(1)] [100.0% done] [29800KB/0KB/0KB /s] [7450/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=27941: Thu Jun 16 18:35:51 2016
  read : io=575508KB, bw=28773KB/s, iops=7193, runt= 20002msec
    slat (usec): min=0, max=2387, avg= 1.36, stdev= 6.61
    clat (usec): min=1092, max=18033, avg=2195.26, stdev=922.07
     lat (usec): min=1093, max=18034, avg=2196.62, stdev=922.06
    clat percentiles (usec):
     |  1.00th=[ 1416],  5.00th=[ 1560], 10.00th=[ 1640], 20.00th=[ 1736],
     | 30.00th=[ 1800], 40.00th=[ 1848], 50.00th=[ 1896], 60.00th=[ 1976],
     | 70.00th=[ 2160], 80.00th=[ 2448], 90.00th=[ 3120], 95.00th=[ 3600],
     | 99.00th=[ 6240], 99.50th=[ 7776], 99.90th=[10560], 99.95th=[12224],
     | 99.99th=[16320]
    bw (KB  /s): min=22896, max=33149, per=100.00%, avg=28858.15, stdev=3166.06
    lat (msec) : 2=62.64%, 4=34.15%, 10=3.06%, 20=0.15%
  cpu          : usr=2.84%, sys=0.71%, ctx=11996, majf=0, minf=17
  IO depths    : 1=3.1%, 2=9.4%, 4=24.2%, 8=54.9%, 16=8.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.7%, 8=0.2%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=143877/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=575508KB, aggrb=28772KB/s, minb=28772KB/s, maxb=28772KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [r(1)] [100.0% done] [28151KB/0KB/0KB /s] [7037/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=29067: Thu Jun 16 18:36:27 2016
  read : io=571616KB, bw=28579KB/s, iops=7144, runt= 20001msec
    slat (usec): min=0, max=1208, avg= 1.35, stdev= 3.63
    clat (usec): min=980, max=15443, avg=2210.31, stdev=937.72
     lat (usec): min=981, max=15444, avg=2211.66, stdev=937.72
    clat percentiles (usec):
     |  1.00th=[ 1384],  5.00th=[ 1528], 10.00th=[ 1608], 20.00th=[ 1704],
     | 30.00th=[ 1784], 40.00th=[ 1848], 50.00th=[ 1912], 60.00th=[ 1992],
     | 70.00th=[ 2192], 80.00th=[ 2480], 90.00th=[ 3120], 95.00th=[ 3696],
     | 99.00th=[ 6368], 99.50th=[ 7968], 99.90th=[10176], 99.95th=[11456],
     | 99.99th=[13248]
    bw (KB  /s): min=23064, max=32119, per=99.89%, avg=28546.49, stdev=2876.38
    lat (usec) : 1000=0.01%
    lat (msec) : 2=60.31%, 4=35.93%, 10=3.65%, 20=0.11%
  cpu          : usr=2.52%, sys=1.05%, ctx=12048, majf=0, minf=17
  IO depths    : 1=3.1%, 2=9.2%, 4=24.2%, 8=55.2%, 16=8.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.7%, 8=0.3%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=142904/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=571616KB, aggrb=28579KB/s, minb=28579KB/s, maxb=28579KB/s, mint=20001msec, maxt=20001msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [r(1)] [100.0% done] [30933KB/0KB/0KB /s] [7733/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=29990: Thu Jun 16 18:36:55 2016
  read : io=575776KB, bw=28786KB/s, iops=7196, runt= 20002msec
    slat (usec): min=0, max=179, avg= 1.31, stdev= 1.63
    clat (usec): min=791, max=17688, avg=2194.94, stdev=930.76
     lat (usec): min=797, max=17688, avg=2196.24, stdev=930.75
    clat percentiles (usec):
     |  1.00th=[ 1368],  5.00th=[ 1512], 10.00th=[ 1592], 20.00th=[ 1688],
     | 30.00th=[ 1784], 40.00th=[ 1848], 50.00th=[ 1912], 60.00th=[ 1992],
     | 70.00th=[ 2192], 80.00th=[ 2480], 90.00th=[ 3120], 95.00th=[ 3632],
     | 99.00th=[ 6368], 99.50th=[ 7840], 99.90th=[11456], 99.95th=[11968],
     | 99.99th=[15040]
    bw (KB  /s): min=23104, max=35704, per=100.00%, avg=28886.05, stdev=3237.99
    lat (usec) : 1000=0.01%
    lat (msec) : 2=60.41%, 4=36.31%, 10=3.16%, 20=0.12%
  cpu          : usr=2.46%, sys=1.06%, ctx=12219, majf=0, minf=17
  IO depths    : 1=3.1%, 2=9.2%, 4=24.1%, 8=55.2%, 16=8.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.7%, 8=0.3%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=143944/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=575776KB, aggrb=28785KB/s, minb=28785KB/s, maxb=28785KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [r(1)] [100.0% done] [26112KB/0KB/0KB /s] [6528/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=30880: Thu Jun 16 18:37:24 2016
  read : io=576312KB, bw=28813KB/s, iops=7203, runt= 20002msec
    slat (usec): min=0, max=757, avg= 1.29, stdev= 2.85
    clat (usec): min=709, max=20416, avg=2192.70, stdev=950.87
     lat (usec): min=713, max=20416, avg=2193.99, stdev=950.89
    clat percentiles (usec):
     |  1.00th=[ 1368],  5.00th=[ 1512], 10.00th=[ 1592], 20.00th=[ 1688],
     | 30.00th=[ 1768], 40.00th=[ 1832], 50.00th=[ 1912], 60.00th=[ 1992],
     | 70.00th=[ 2192], 80.00th=[ 2480], 90.00th=[ 3120], 95.00th=[ 3664],
     | 99.00th=[ 6432], 99.50th=[ 7712], 99.90th=[10560], 99.95th=[11712],
     | 99.99th=[19584]
    bw (KB  /s): min=22602, max=35449, per=99.98%, avg=28807.00, stdev=3196.14
    lat (usec) : 750=0.01%, 1000=0.01%
    lat (msec) : 2=60.83%, 4=35.74%, 10=3.30%, 20=0.13%, 50=0.01%
  cpu          : usr=2.56%, sys=0.95%, ctx=12226, majf=0, minf=17
  IO depths    : 1=3.1%, 2=9.2%, 4=24.2%, 8=55.2%, 16=8.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.7%, 8=0.2%, 16=6.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=144078/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=576312KB, aggrb=28812KB/s, minb=28812KB/s, maxb=28812KB/s, mint=20002msec, maxt=20002msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=randread, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [r(1)] [100.0% done] [27036KB/0KB/0KB /s] [6759/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=32061: Thu Jun 16 18:38:01 2016
  read : io=564992KB, bw=28247KB/s, iops=7061, runt= 20002msec
    slat (usec): min=0, max=1018, avg= 1.33, stdev= 3.28
    clat (usec): min=904, max=24678, avg=2236.95, stdev=941.90
     lat (usec): min=905, max=24679, avg=2238.28, stdev=941.86
    clat percentiles (usec):
     |  1.00th=[ 1416],  5.00th=[ 1560], 10.00th=[ 1640], 20.00th=[ 1752],
     | 30.00th=[ 1816], 40.00th=[ 1880], 50.00th=[ 1944], 60.00th=[ 2040],
     | 70.00th=[ 2256], 80.00th=[ 2512], 90.00th=[ 3120], 95.00th=[ 3696],
     | 99.00th=[ 6368], 99.50th=[ 7968], 99.90th=[10816], 99.95th=[11712],
     | 99.99th=[21632]
    bw (KB  /s): min=21568, max=32507, per=99.89%, avg=28215.10, stdev=3016.23
    lat (usec) : 1000=0.01%
    lat (msec) : 2=56.98%, 4=39.59%, 10=3.31%, 20=0.12%, 50=0.01%
  cpu          : usr=2.55%, sys=0.97%, ctx=11798, majf=0, minf=17
  IO depths    : 1=3.3%, 2=9.5%, 4=24.3%, 8=54.6%, 16=8.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.8%, 8=0.2%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=141248/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=564992KB, aggrb=28246KB/s, minb=28246KB/s, maxb=28246KB/s, mint=20002msec, maxt=20002msec
```

### RAND-READ-WRITE
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [m(1)] [100.0% done] [2132KB/2128KB/0KB /s] [533/532/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=2555: Thu Jun 16 18:39:33 2016
  read : io=42932KB, bw=2146.7KB/s, iops=536, runt= 20005msec
    slat (usec): min=0, max=1098, avg= 2.31, stdev=11.10
    clat (usec): min=634, max=206323, avg=8019.38, stdev=9122.96
     lat (usec): min=641, max=206337, avg=8021.70, stdev=9123.11
    clat percentiles (usec):
     |  1.00th=[ 1020],  5.00th=[ 1272], 10.00th=[ 1512], 20.00th=[ 1896],
     | 30.00th=[ 2192], 40.00th=[ 2448], 50.00th=[ 2960], 60.00th=[ 7712],
     | 70.00th=[10560], 80.00th=[13760], 90.00th=[20096], 95.00th=[23936],
     | 99.00th=[32384], 99.50th=[36096], 99.90th=[89600], 99.95th=[102912],
     | 99.99th=[205824]
    bw (KB  /s): min= 1556, max= 2661, per=100.00%, avg=2146.95, stdev=210.30
  write: io=42796KB, bw=2139.3KB/s, iops=534, runt= 20005msec
    slat (usec): min=0, max=325, avg= 2.49, stdev= 5.53
    clat (msec): min=4, max=222, avg=21.80, stdev=12.77
     lat (msec): min=4, max=222, avg=21.80, stdev=12.77
    clat percentiles (msec):
     |  1.00th=[    7],  5.00th=[    9], 10.00th=[   11], 20.00th=[   13],
     | 30.00th=[   15], 40.00th=[   19], 50.00th=[   21], 60.00th=[   23],
     | 70.00th=[   26], 80.00th=[   30], 90.00th=[   35], 95.00th=[   39],
     | 99.00th=[   51], 99.50th=[   67], 99.90th=[  206], 99.95th=[  206],
     | 99.99th=[  221]
    bw (KB  /s): min= 1405, max= 2513, per=99.96%, avg=2138.21, stdev=204.02
    lat (usec) : 750=0.01%, 1000=0.40%
    lat (msec) : 2=11.59%, 4=14.81%, 10=12.17%, 20=30.77%, 50=29.67%
    lat (msec) : 100=0.40%, 250=0.19%
  cpu          : usr=0.68%, sys=0.25%, ctx=2723, majf=0, minf=16
  IO depths    : 1=1.6%, 2=5.0%, 4=16.5%, 8=65.4%, 16=11.5%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.3%, 8=2.7%, 16=5.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=10733/w=10699/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=42932KB, aggrb=2146KB/s, minb=2146KB/s, maxb=2146KB/s, mint=20005msec, maxt=20005msec
  WRITE: io=42796KB, aggrb=2139KB/s, minb=2139KB/s, maxb=2139KB/s, mint=20005msec, maxt=20005msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [m(1)] [100.0% done] [2196KB/2292KB/0KB /s] [549/573/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=3616: Thu Jun 16 18:40:06 2016
  read : io=43464KB, bw=2164.7KB/s, iops=541, runt= 20079msec
    slat (usec): min=0, max=196, avg= 2.23, stdev= 3.11
    clat (usec): min=702, max=229880, avg=7994.61, stdev=8963.24
     lat (usec): min=704, max=229882, avg=7996.84, stdev=8963.25
    clat percentiles (usec):
     |  1.00th=[ 1080],  5.00th=[ 1336], 10.00th=[ 1544], 20.00th=[ 1912],
     | 30.00th=[ 2224], 40.00th=[ 2480], 50.00th=[ 3024], 60.00th=[ 7968],
     | 70.00th=[10688], 80.00th=[13760], 90.00th=[19840], 95.00th=[23168],
     | 99.00th=[30336], 99.50th=[32384], 99.90th=[46336], 99.95th=[136192],
     | 99.99th=[207872]
    bw (KB  /s): min= 1407, max= 2910, per=100.00%, avg=2176.03, stdev=281.50
  write: io=43436KB, bw=2163.3KB/s, iops=540, runt= 20079msec
    slat (usec): min=0, max=1868, avg= 2.59, stdev=18.29
    clat (msec): min=4, max=266, avg=21.43, stdev=14.07
     lat (msec): min=4, max=266, avg=21.43, stdev=14.07
    clat percentiles (msec):
     |  1.00th=[    7],  5.00th=[    9], 10.00th=[   11], 20.00th=[   13],
     | 30.00th=[   15], 40.00th=[   18], 50.00th=[   20], 60.00th=[   22],
     | 70.00th=[   25], 80.00th=[   29], 90.00th=[   34], 95.00th=[   38],
     | 99.00th=[   50], 99.50th=[   58], 99.90th=[  233], 99.95th=[  255],
     | 99.99th=[  265]
    bw (KB  /s): min= 1344, max= 2552, per=100.00%, avg=2170.05, stdev=236.56
    lat (usec) : 750=0.01%, 1000=0.27%
    lat (msec) : 2=11.28%, 4=14.86%, 10=12.65%, 20=32.45%, 50=28.00%
    lat (msec) : 100=0.30%, 250=0.14%, 500=0.03%
  cpu          : usr=0.63%, sys=0.30%, ctx=2712, majf=0, minf=16
  IO depths    : 1=1.5%, 2=5.0%, 4=16.7%, 8=65.6%, 16=11.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.2%, 8=2.7%, 16=5.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=10866/w=10859/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=43464KB, aggrb=2164KB/s, minb=2164KB/s, maxb=2164KB/s, mint=20079msec, maxt=20079msec
  WRITE: io=43436KB, aggrb=2163KB/s, minb=2163KB/s, maxb=2163KB/s, mint=20079msec, maxt=20079msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [m(1)] [100.0% done] [2164KB/2264KB/0KB /s] [541/566/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=5202: Thu Jun 16 18:40:56 2016
  read : io=42692KB, bw=2133.7KB/s, iops=533, runt= 20009msec
    slat (usec): min=0, max=220, avg= 2.29, stdev= 4.57
    clat (usec): min=699, max=347292, avg=8214.75, stdev=10875.45
     lat (usec): min=701, max=347294, avg=8217.04, stdev=10875.49
    clat percentiles (usec):
     |  1.00th=[ 1080],  5.00th=[ 1352], 10.00th=[ 1544], 20.00th=[ 1880],
     | 30.00th=[ 2160], 40.00th=[ 2448], 50.00th=[ 2992], 60.00th=[ 7904],
     | 70.00th=[10432], 80.00th=[13888], 90.00th=[20096], 95.00th=[24192],
     | 99.00th=[33024], 99.50th=[34560], 99.90th=[113152], 99.95th=[207872],
     | 99.99th=[305152]
    bw (KB  /s): min=  984, max= 2624, per=99.95%, avg=2131.87, stdev=332.67
  write: io=42544KB, bw=2126.3KB/s, iops=531, runt= 20009msec
    slat (usec): min=0, max=3464, avg= 3.02, stdev=36.03
    clat (msec): min=4, max=291, avg=21.77, stdev=14.61
     lat (msec): min=4, max=291, avg=21.77, stdev=14.61
    clat percentiles (msec):
     |  1.00th=[    7],  5.00th=[    9], 10.00th=[   10], 20.00th=[   13],
     | 30.00th=[   15], 40.00th=[   19], 50.00th=[   21], 60.00th=[   23],
     | 70.00th=[   26], 80.00th=[   30], 90.00th=[   35], 95.00th=[   38],
     | 99.00th=[   50], 99.50th=[   58], 99.90th=[  262], 99.95th=[  265],
     | 99.99th=[  293]
    bw (KB  /s): min= 1039, max= 2574, per=100.00%, avg=2128.05, stdev=292.23
    lat (usec) : 750=0.01%, 1000=0.24%
    lat (msec) : 2=11.76%, 4=14.29%, 10=13.58%, 20=30.12%, 50=29.47%
    lat (msec) : 100=0.31%, 250=0.15%, 500=0.08%
  cpu          : usr=0.65%, sys=0.26%, ctx=2624, majf=0, minf=16
  IO depths    : 1=1.5%, 2=4.8%, 4=16.6%, 8=65.8%, 16=11.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.2%, 8=2.6%, 16=5.2%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=10673/w=10636/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=42692KB, aggrb=2133KB/s, minb=2133KB/s, maxb=2133KB/s, mint=20009msec, maxt=20009msec
  WRITE: io=42544KB, aggrb=2126KB/s, minb=2126KB/s, maxb=2126KB/s, mint=20009msec, maxt=20009msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [m(1)] [100.0% done] [1644KB/1708KB/0KB /s] [411/427/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=6270: Thu Jun 16 18:41:29 2016
  read : io=42716KB, bw=2134.6KB/s, iops=533, runt= 20012msec
    slat (usec): min=0, max=227, avg= 2.20, stdev= 3.53
    clat (usec): min=781, max=325146, avg=8343.92, stdev=11569.17
     lat (usec): min=787, max=325148, avg=8346.12, stdev=11569.21
    clat percentiles (usec):
     |  1.00th=[ 1032],  5.00th=[ 1288], 10.00th=[ 1512], 20.00th=[ 1848],
     | 30.00th=[ 2192], 40.00th=[ 2448], 50.00th=[ 3056], 60.00th=[ 7904],
     | 70.00th=[10432], 80.00th=[13632], 90.00th=[19840], 95.00th=[24448],
     | 99.00th=[33024], 99.50th=[39168], 99.90th=[193536], 99.95th=[193536],
     | 99.99th=[207872]
    bw (KB  /s): min= 1288, max= 2726, per=99.92%, avg=2132.28, stdev=340.77
  write: io=42584KB, bw=2127.1KB/s, iops=531, runt= 20012msec
    slat (usec): min=0, max=185, avg= 2.44, stdev= 3.57
    clat (msec): min=4, max=219, avg=21.63, stdev=13.72
     lat (msec): min=4, max=219, avg=21.63, stdev=13.72
    clat percentiles (msec):
     |  1.00th=[    7],  5.00th=[    9], 10.00th=[   10], 20.00th=[   13],
     | 30.00th=[   15], 40.00th=[   18], 50.00th=[   20], 60.00th=[   22],
     | 70.00th=[   26], 80.00th=[   30], 90.00th=[   36], 95.00th=[   40],
     | 99.00th=[   53], 99.50th=[   62], 99.90th=[  208], 99.95th=[  208],
     | 99.99th=[  208]
    bw (KB  /s): min= 1224, max= 2561, per=100.00%, avg=2127.18, stdev=302.77
    lat (usec) : 1000=0.38%
    lat (msec) : 2=11.86%, 4=14.21%, 10=12.76%, 20=32.40%, 50=27.58%
    lat (msec) : 100=0.51%, 250=0.30%, 500=0.01%
  cpu          : usr=0.71%, sys=0.23%, ctx=2637, majf=0, minf=16
  IO depths    : 1=1.4%, 2=4.8%, 4=16.5%, 8=65.7%, 16=11.6%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.3%, 8=2.7%, 16=5.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=10679/w=10646/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=42716KB, aggrb=2134KB/s, minb=2134KB/s, maxb=2134KB/s, mint=20012msec, maxt=20012msec
  WRITE: io=42584KB, aggrb=2127KB/s, minb=2127KB/s, maxb=2127KB/s, mint=20012msec, maxt=20012msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=randrw, bs=4K-4K/4K-4K/4K-4K, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=0): [m(1)] [0.8% done] [1668KB/1644KB/0KB /s] [417/411/0 iops] [eta 42m:39s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=7416: Thu Jun 16 18:42:05 2016
  read : io=42736KB, bw=2134.2KB/s, iops=533, runt= 20017msec
    slat (usec): min=0, max=1764, avg= 2.31, stdev=17.20
    clat (usec): min=648, max=205479, avg=8141.48, stdev=9969.25
     lat (usec): min=653, max=205481, avg=8143.79, stdev=9969.36
    clat percentiles (usec):
     |  1.00th=[ 1048],  5.00th=[ 1304], 10.00th=[ 1512], 20.00th=[ 1864],
     | 30.00th=[ 2192], 40.00th=[ 2480], 50.00th=[ 2928], 60.00th=[ 7968],
     | 70.00th=[10432], 80.00th=[13888], 90.00th=[19840], 95.00th=[23680],
     | 99.00th=[30592], 99.50th=[32640], 99.90th=[129536], 99.95th=[177152],
     | 99.99th=[203776]
    bw (KB  /s): min= 1092, max= 2730, per=100.00%, avg=2134.77, stdev=315.51
  write: io=42588KB, bw=2127.7KB/s, iops=531, runt= 20017msec
    slat (usec): min=0, max=141, avg= 2.39, stdev= 2.78
    clat (msec): min=4, max=231, avg=21.82, stdev=14.71
     lat (msec): min=4, max=231, avg=21.83, stdev=14.71
    clat percentiles (msec):
     |  1.00th=[    7],  5.00th=[    9], 10.00th=[   11], 20.00th=[   13],
     | 30.00th=[   15], 40.00th=[   19], 50.00th=[   20], 60.00th=[   23],
     | 70.00th=[   26], 80.00th=[   30], 90.00th=[   35], 95.00th=[   38],
     | 99.00th=[   50], 99.50th=[   67], 99.90th=[  206], 99.95th=[  227],
     | 99.99th=[  231]
    bw (KB  /s): min= 1153, max= 2419, per=100.00%, avg=2127.77, stdev=278.11
    lat (usec) : 750=0.01%, 1000=0.35%
    lat (msec) : 2=11.59%, 4=14.62%, 10=12.02%, 20=31.99%, 50=28.84%
    lat (msec) : 100=0.29%, 250=0.30%
  cpu          : usr=0.59%, sys=0.32%, ctx=2720, majf=0, minf=16
  IO depths    : 1=1.6%, 2=5.0%, 4=16.6%, 8=65.4%, 16=11.4%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.3%, 8=2.6%, 16=5.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=10684/w=10647/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=42736KB, aggrb=2134KB/s, minb=2134KB/s, maxb=2134KB/s, mint=20017msec, maxt=20017msec
  WRITE: io=42588KB, aggrb=2127KB/s, minb=2127KB/s, maxb=2127KB/s, mint=20017msec, maxt=20017msec
```

# Throughput Write
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [98.0% done] [0KB/124.0MB/0KB /s] [0/31/0 iops] [eta 00m:01s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=16078: Thu Jun 16 20:30:40 2016
  write: io=5120.0MB, bw=107595KB/s, iops=26, runt= 48728msec
    slat (usec): min=192, max=12814, avg=1086.75, stdev=1389.77
    clat (msec): min=226, max=1487, avg=601.04, stdev=181.89
     lat (msec): min=226, max=1487, avg=602.12, stdev=181.88
    clat percentiles (msec):
     |  1.00th=[  265],  5.00th=[  367], 10.00th=[  412], 20.00th=[  478],
     | 30.00th=[  519], 40.00th=[  537], 50.00th=[  553], 60.00th=[  586],
     | 70.00th=[  619], 80.00th=[  734], 90.00th=[  865], 95.00th=[ 1004],
     | 99.00th=[ 1172], 99.50th=[ 1221], 99.90th=[ 1401], 99.95th=[ 1483],
     | 99.99th=[ 1483]
    bw (KB  /s): min= 6532, max=164152, per=98.87%, avg=106380.38, stdev=20559.75
    lat (msec) : 250=0.31%, 500=25.16%, 750=56.25%, 1000=13.28%, 2000=5.00%
  cpu          : usr=2.00%, sys=0.07%, ctx=409, majf=0, minf=14
  IO depths    : 1=2.3%, 2=7.2%, 4=21.9%, 8=59.4%, 16=9.3%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.0%, 8=1.1%, 16=5.9%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1280/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=5120.0MB, aggrb=107594KB/s, minb=107594KB/s, maxb=107594KB/s, mint=48728msec, maxt=48728msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/124.0MB/0KB /s] [0/31/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=18062: Thu Jun 16 20:31:46 2016
  write: io=5120.0MB, bw=106950KB/s, iops=26, runt= 49022msec
    slat (usec): min=194, max=16203, avg=1155.91, stdev=1494.97
    clat (msec): min=214, max=1497, avg=602.82, stdev=175.41
     lat (msec): min=215, max=1497, avg=603.98, stdev=175.39
    clat percentiles (msec):
     |  1.00th=[  310],  5.00th=[  388], 10.00th=[  433], 20.00th=[  502],
     | 30.00th=[  523], 40.00th=[  545], 50.00th=[  562], 60.00th=[  586],
     | 70.00th=[  611], 80.00th=[  635], 90.00th=[  898], 95.00th=[  971],
     | 99.00th=[ 1156], 99.50th=[ 1205], 99.90th=[ 1500], 99.95th=[ 1500],
     | 99.99th=[ 1500]
    bw (KB  /s): min= 6360, max=216847, per=99.59%, avg=106512.57, stdev=25902.56
    lat (msec) : 250=0.23%, 500=19.45%, 750=64.14%, 1000=12.03%, 2000=4.14%
  cpu          : usr=2.06%, sys=0.03%, ctx=432, majf=0, minf=14
  IO depths    : 1=2.3%, 2=8.0%, 4=23.0%, 8=57.7%, 16=9.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.3%, 8=0.6%, 16=6.2%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1280/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=5120.0MB, aggrb=106949KB/s, minb=106949KB/s, maxb=106949KB/s, mint=49022msec, maxt=49022msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/128.0MB/0KB /s] [0/32/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=19818: Thu Jun 16 20:32:44 2016
  write: io=5120.0MB, bw=107024KB/s, iops=26, runt= 48988msec
    slat (usec): min=193, max=19425, avg=1178.67, stdev=1625.27
    clat (msec): min=271, max=1473, avg=602.24, stdev=194.73
     lat (msec): min=272, max=1474, avg=603.42, stdev=194.79
    clat percentiles (msec):
     |  1.00th=[  314],  5.00th=[  347], 10.00th=[  383], 20.00th=[  445],
     | 30.00th=[  486], 40.00th=[  523], 50.00th=[  570], 60.00th=[  619],
     | 70.00th=[  635], 80.00th=[  734], 90.00th=[  865], 95.00th=[  988],
     | 99.00th=[ 1188], 99.50th=[ 1303], 99.90th=[ 1467], 99.95th=[ 1467],
     | 99.99th=[ 1467]
    bw (KB  /s): min= 6491, max=210250, per=100.00%, avg=107104.31, stdev=23534.48
    lat (msec) : 500=32.66%, 750=48.52%, 1000=14.38%, 2000=4.45%
  cpu          : usr=2.07%, sys=0.04%, ctx=429, majf=0, minf=14
  IO depths    : 1=2.0%, 2=6.9%, 4=21.3%, 8=60.7%, 16=9.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.8%, 8=1.0%, 16=6.2%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1280/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=5120.0MB, aggrb=107023KB/s, minb=107023KB/s, maxb=107023KB/s, mint=48988msec, maxt=48988msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=0): [W(1)] [100.0% done] [0KB/112.0MB/0KB /s] [0/28/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=21832: Thu Jun 16 20:33:50 2016
  write: io=5120.0MB, bw=107181KB/s, iops=26, runt= 48916msec
    slat (usec): min=174, max=28035, avg=1155.53, stdev=1783.19
    clat (msec): min=243, max=1772, avg=602.17, stdev=198.43
     lat (msec): min=244, max=1773, avg=603.32, stdev=198.47
    clat percentiles (msec):
     |  1.00th=[  289],  5.00th=[  355], 10.00th=[  408], 20.00th=[  465],
     | 30.00th=[  494], 40.00th=[  529], 50.00th=[  553], 60.00th=[  594],
     | 70.00th=[  619], 80.00th=[  725], 90.00th=[  914], 95.00th=[ 1012],
     | 99.00th=[ 1254], 99.50th=[ 1385], 99.90th=[ 1778], 99.95th=[ 1778],
     | 99.99th=[ 1778]
    bw (KB  /s): min= 6511, max=157538, per=98.67%, avg=105759.57, stdev=22553.12
    lat (msec) : 250=0.16%, 500=31.02%, 750=50.23%, 1000=13.12%, 2000=5.47%
  cpu          : usr=2.03%, sys=0.07%, ctx=411, majf=0, minf=14
  IO depths    : 1=2.1%, 2=6.7%, 4=21.5%, 8=60.0%, 16=9.7%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.0%, 8=0.9%, 16=6.1%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1280/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=5120.0MB, aggrb=107181KB/s, minb=107181KB/s, maxb=107181KB/s, mint=48916msec, maxt=48916msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=write, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [W(1)] [100.0% done] [0KB/116.0MB/0KB /s] [0/29/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=25463: Thu Jun 16 20:35:49 2016
  write: io=5120.0MB, bw=108281KB/s, iops=26, runt= 48419msec
    slat (usec): min=192, max=20744, avg=1134.68, stdev=1609.90
    clat (msec): min=164, max=1511, avg=596.02, stdev=182.76
     lat (msec): min=164, max=1512, avg=597.16, stdev=182.81
    clat percentiles (msec):
     |  1.00th=[  293],  5.00th=[  355], 10.00th=[  379], 20.00th=[  474],
     | 30.00th=[  515], 40.00th=[  537], 50.00th=[  553], 60.00th=[  594],
     | 70.00th=[  619], 80.00th=[  701], 90.00th=[  881], 95.00th=[  979],
     | 99.00th=[ 1106], 99.50th=[ 1188], 99.90th=[ 1450], 99.95th=[ 1516],
     | 99.99th=[ 1516]
    bw (KB  /s): min= 6511, max=210051, per=98.78%, avg=106954.92, stdev=25037.23
    lat (msec) : 250=0.23%, 500=26.56%, 750=55.16%, 1000=13.91%, 2000=4.14%
  cpu          : usr=2.10%, sys=0.02%, ctx=405, majf=0, minf=14
  IO depths    : 1=2.2%, 2=7.0%, 4=21.6%, 8=60.1%, 16=9.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=92.9%, 8=1.1%, 16=6.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=1280/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
  WRITE: io=5120.0MB, aggrb=108281KB/s, minb=108281KB/s, maxb=108281KB/s, mint=48419msec, maxt=48419msec
```

# Throughput Read
------------------------ Test 1 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [99.93MB/0KB/0KB /s] [24/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=27456: Thu Jun 16 20:36:53 2016
  read : io=5120.0MB, bw=113074KB/s, iops=27, runt= 46367msec
    slat (usec): min=0, max=49, avg= 2.55, stdev= 4.82
    clat (msec): min=207, max=1382, avg=577.90, stdev=172.95
     lat (msec): min=207, max=1382, avg=577.90, stdev=172.95
    clat percentiles (msec):
     |  1.00th=[  371],  5.00th=[  424], 10.00th=[  449], 20.00th=[  474],
     | 30.00th=[  494], 40.00th=[  519], 50.00th=[  529], 60.00th=[  545],
     | 70.00th=[  553], 80.00th=[  594], 90.00th=[  930], 95.00th=[  996],
     | 99.00th=[ 1074], 99.50th=[ 1090], 99.90th=[ 1369], 99.95th=[ 1385],
     | 99.99th=[ 1385]
    bw (KB  /s): min= 6895, max=137350, per=98.68%, avg=111583.11, stdev=16846.85
    lat (msec) : 250=0.39%, 500=32.73%, 750=51.80%, 1000=10.23%, 2000=4.84%
  cpu          : usr=0.02%, sys=0.00%, ctx=124, majf=0, minf=16
  IO depths    : 1=2.0%, 2=7.2%, 4=26.2%, 8=57.5%, 16=7.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.2%, 8=0.1%, 16=6.7%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=113073KB/s, minb=113073KB/s, maxb=113073KB/s, mint=46367msec, maxt=46367msec
```

------------------------ Test 2 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [99.62MB/0KB/0KB /s] [24/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=29443: Thu Jun 16 20:38:00 2016
  read : io=5120.0MB, bw=113313KB/s, iops=27, runt= 46269msec
    slat (usec): min=0, max=573, avg= 3.03, stdev=16.59
    clat (msec): min=337, max=1431, avg=577.92, stdev=173.22
     lat (msec): min=337, max=1431, avg=577.93, stdev=173.22
    clat percentiles (msec):
     |  1.00th=[  400],  5.00th=[  420], 10.00th=[  445], 20.00th=[  478],
     | 30.00th=[  494], 40.00th=[  506], 50.00th=[  523], 60.00th=[  545],
     | 70.00th=[  562], 80.00th=[  586], 90.00th=[  930], 95.00th=[  996],
     | 99.00th=[ 1057], 99.50th=[ 1074], 99.90th=[ 1401], 99.95th=[ 1434],
     | 99.99th=[ 1434]
    bw (KB  /s): min=57503, max=129262, per=99.32%, avg=112545.14, stdev=10428.46
    lat (msec) : 500=36.33%, 750=47.81%, 1000=11.25%, 2000=4.61%
  cpu          : usr=0.03%, sys=0.00%, ctx=126, majf=0, minf=16
  IO depths    : 1=1.8%, 2=6.9%, 4=26.0%, 8=58.1%, 16=7.2%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.2%, 8=0.0%, 16=6.8%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=113313KB/s, minb=113313KB/s, maxb=113313KB/s, mint=46269msec, maxt=46269msec
```

------------------------ Test 3 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [97.9% done] [112.0MB/0KB/0KB /s] [28/0/0 iops] [eta 00m:01s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=31727: Thu Jun 16 20:39:16 2016
  read : io=5120.0MB, bw=112983KB/s, iops=27, runt= 46404msec
    slat (usec): min=0, max=32, avg= 2.45, stdev= 4.35
    clat (msec): min=395, max=1492, avg=578.61, stdev=161.11
     lat (msec): min=395, max=1492, avg=578.62, stdev=161.11
    clat percentiles (msec):
     |  1.00th=[  412],  5.00th=[  445], 10.00th=[  465], 20.00th=[  482],
     | 30.00th=[  502], 40.00th=[  529], 50.00th=[  537], 60.00th=[  553],
     | 70.00th=[  562], 80.00th=[  578], 90.00th=[  914], 95.00th=[  996],
     | 99.00th=[ 1090], 99.50th=[ 1123], 99.90th=[ 1450], 99.95th=[ 1500],
     | 99.99th=[ 1500]
    bw (KB  /s): min=56626, max=128250, per=98.75%, avg=111575.31, stdev=10942.35
    lat (msec) : 500=29.92%, 750=58.12%, 1000=7.19%, 2000=4.77%
  cpu          : usr=0.02%, sys=0.01%, ctx=115, majf=0, minf=16
  IO depths    : 1=2.1%, 2=8.3%, 4=26.6%, 8=56.0%, 16=7.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.4%, 8=0.0%, 16=6.6%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=112983KB/s, minb=112983KB/s, maxb=112983KB/s, mint=46404msec, maxt=46404msec
```

------------------------ Test 4 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [119.1MB/0KB/0KB /s] [29/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=1469: Thu Jun 16 20:40:28 2016
  read : io=5120.0MB, bw=112820KB/s, iops=27, runt= 46471msec
    slat (usec): min=0, max=252, avg= 2.57, stdev= 8.31
    clat (msec): min=392, max=1637, avg=580.07, stdev=148.75
     lat (msec): min=392, max=1637, avg=580.07, stdev=148.75
    clat percentiles (msec):
     |  1.00th=[  400],  5.00th=[  420], 10.00th=[  465], 20.00th=[  494],
     | 30.00th=[  515], 40.00th=[  529], 50.00th=[  545], 60.00th=[  562],
     | 70.00th=[  586], 80.00th=[  586], 90.00th=[  840], 95.00th=[  971],
     | 99.00th=[ 1074], 99.50th=[ 1090], 99.90th=[ 1106], 99.95th=[ 1631],
     | 99.99th=[ 1631]
    bw (KB  /s): min= 7275, max=128463, per=98.75%, avg=111412.53, stdev=14349.64
    lat (msec) : 500=22.11%, 750=66.88%, 1000=6.72%, 2000=4.30%
  cpu          : usr=0.01%, sys=0.01%, ctx=109, majf=0, minf=16
  IO depths    : 1=2.6%, 2=8.7%, 4=26.3%, 8=55.5%, 16=6.9%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.5%, 8=0.0%, 16=6.5%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=112820KB/s, minb=112820KB/s, maxb=112820KB/s, mint=46471msec, maxt=46471msec
```

------------------------ Test 5 ------------------------
```
fio-rbd: (g=0): rw=read, bs=4M-4M/4M-4M/4M-4M, ioengine=rbd, iodepth=16
fio-2.8-1-g87a0
Starting 1 process
rbd engine: RBD version: 0.1.10
Jobs: 1 (f=1): [R(1)] [100.0% done] [115.1MB/0KB/0KB /s] [28/0/0 iops] [eta 00m:00s]
fio-rbd: (groupid=0, jobs=1): err= 0: pid=3310: Thu Jun 16 20:41:30 2016
  read : io=5120.0MB, bw=112981KB/s, iops=27, runt= 46405msec
    slat (usec): min=0, max=51, avg= 2.48, stdev= 5.00
    clat (msec): min=303, max=1334, avg=578.34, stdev=167.90
     lat (msec): min=303, max=1334, avg=578.35, stdev=167.90
    clat percentiles (msec):
     |  1.00th=[  338],  5.00th=[  424], 10.00th=[  449], 20.00th=[  490],
     | 30.00th=[  506], 40.00th=[  519], 50.00th=[  529], 60.00th=[  537],
     | 70.00th=[  553], 80.00th=[  586], 90.00th=[  914], 95.00th=[ 1004],
     | 99.00th=[ 1074], 99.50th=[ 1106], 99.90th=[ 1336], 99.95th=[ 1336],
     | 99.99th=[ 1336]
    bw (KB  /s): min=49349, max=137515, per=99.29%, avg=112182.51, stdev=11978.68
    lat (msec) : 500=28.05%, 750=57.73%, 1000=9.06%, 2000=5.16%
  cpu          : usr=0.02%, sys=0.01%, ctx=121, majf=0, minf=16
  IO depths    : 1=2.0%, 2=7.7%, 4=26.2%, 8=57.0%, 16=7.1%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=93.3%, 8=0.0%, 16=6.7%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=1280/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
   READ: io=5120.0MB, aggrb=112980KB/s, minb=112980KB/s, maxb=112980KB/s, mint=46405msec, maxt=46405msec
```
