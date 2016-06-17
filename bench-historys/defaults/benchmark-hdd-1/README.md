# benchmark hdd 1
Benchmarking at ```2016-06-17-14:29:51```。Link structure

- [OSD Tree](#osd-tree)
- [PG Map](#pg-map)
- [CRUSH Map](#crush-map)
- [rados object using rados-bench](rados-bench.md)
- [rados block device using rbd-bench](rbd-bench.md)
- [rados block device using fio-rbd](fio-rbd-iops.md)
- [rados block device using fio-libaio](fio-libaio-block-iops.md)
- [rados file system using fio-libaio](fio-libaio-filesystem-iops.md)
- [rados gateway using swift-bench](radosgw-swift-bench.md)
- [rados gateway using cosbench](cosbench/README.md)

## OSD Tree
ceph osd tree command output:
```
ID WEIGHT  TYPE NAME          UP/DOWN REWEIGHT PRIMARY-AFFINITY
-1 3.00000 root default
-2 1.00000     host ceph-osd3
 0 0.50000         osd.0           up  1.00000          1.00000
 1 0.50000         osd.1           up  1.00000          1.00000
-3 1.00000     host ceph-osd4
 2 0.50000         osd.2           up  1.00000          1.00000
 3 0.50000         osd.3           up  1.00000          1.00000
-4 1.00000     host ceph-osd8
 4 0.50000         osd.4           up  1.00000          1.00000
 5 0.50000         osd.5           up  1.00000          1.00000
```

## PG Map
pg stat per osd:
```
pool :  14      | SUM
------------------------
osd.4   12      | 12
osd.5   10      | 10
osd.0   11      | 11
osd.1   13      | 13
osd.2   8       | 8
osd.3   10      | 10
------------------------
SUM :   64      |
```

## CRUSH Map
crush map status:
```
# begin crush map
tunable choose_local_tries 0
tunable choose_local_fallback_tries 0
tunable choose_total_tries 50
tunable chooseleaf_descend_once 1
tunable straw_calc_version 1

# devices
device 0 osd.0
device 1 osd.1
device 2 osd.2
device 3 osd.3
device 4 osd.4
device 5 osd.5

# types
type 0 osd
type 1 host
type 2 chassis
type 3 rack
type 4 row
type 5 pdu
type 6 pod
type 7 room
type 8 datacenter
type 9 region
type 10 root

# buckets
host ceph-osd3 {
	id -2
	alg straw
	hash 0	# rjenkins1
	item osd.0 weight 0.500
	item osd.1 weight 0.500
}
host ceph-osd4 {
	id -3
	alg straw
	hash 0	# rjenkins1
	item osd.2 weight 0.500
	item osd.3 weight 0.500
}
host ceph-osd8 {
	id -4
	alg straw
	hash 0	# rjenkins1
	item osd.4 weight 0.500
	item osd.5 weight 0.500
}

root default {
	id -1
	alg straw
	hash 0	# rjenkins1
	item ceph-osd3 weight 1.000
	item ceph-osd4 weight 1.000
	item ceph-osd8 weight 1.000
}

# rules
rule replicated_ruleset {
	ruleset 0
	type replicated
	min_size 1
	max_size 10
	step take default
	step chooseleaf firstn 0 type host
	step emit
}

# end crush map
```
