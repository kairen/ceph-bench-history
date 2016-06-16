# benchmark 1
Benchmarking at ```2016-06-16-14:29:51```。Link structure

- [OSD Tree](#osd-tree)
- [PG Map](#pg-map)
- [CRUSH Map](#crush-map)
- [rados object using rados-bench](rados-bench.md)
- [rados block device using rbd-bench](rbd-bench.md)
- [rados block device using fio-rbd](fio-rbd-iops.md)
- [rados block device using fio-libaio](fio-libaio-block-iops.md)
- [rados file system using fio-libaio](fio-libaio-filesystem-iops.md)
- [rados gateway using swift-bench](radosgw-swift-bench.md)
- [rados gateway using cosbench](cosbench-swift.md)

## OSD Tree
ceph osd tree command output:
```
ID WEIGHT  TYPE NAME           UP/DOWN REWEIGHT PRIMARY-AFFINITY
-4       0 host ceph-osd3
-1 1.70398 root default
-2 0.42599     host ceph-osd1
 0 0.21300         osd.0            up  1.00000          1.00000
 3 0.21300         osd.3            up  1.00000          1.00000
-3 0.42599     host ceph-osd2
 1 0.21300         osd.1            up  1.00000          1.00000
 4 0.21300         osd.4            up  1.00000          1.00000
-5 0.42599     host ceph-osd9
 2 0.21300         osd.2            up  1.00000          1.00000
 6 0.21300         osd.6            up  1.00000          1.00000
-6 0.42599     host ceph-osd10
 5 0.21300         osd.5            up  1.00000          1.00000
 7 0.21300         osd.7            up  1.00000          1.00000
```

## PG Map
pg stat per osd:
```
pool :  1       | SUM
------------------------
osd.4   7       | 7
osd.5   5       | 5
osd.6   9       | 9
osd.7   12      | 12
osd.0   8       | 8
osd.1   7       | 7
osd.2   11      | 11
osd.3   5       | 5
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
device 6 osd.6
device 7 osd.7

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
host ceph-osd1 {
	id -2		# do not change unnecessarily
	alg straw
	hash 0	# rjenkins1
	item osd.0 weight 0.213
	item osd.3 weight 0.213
}
host ceph-osd2 {
	id -3		# do not change unnecessarily
	alg straw
	hash 0	# rjenkins1
	item osd.1 weight 0.213
	item osd.4 weight 0.213
}
host ceph-osd3 {
	id -4		# do not change unnecessarily
	alg straw
	hash 0	# rjenkins1
}
host ceph-osd9 {
	id -5		# do not change unnecessarily
	alg straw
	hash 0	# rjenkins1
	item osd.2 weight 0.213
	item osd.6 weight 0.213
}
host ceph-osd10 {
	id -6		# do not change unnecessarily
	# weight 0.317
	alg straw
	hash 0	# rjenkins1
	item osd.5 weight 0.213
	item osd.7 weight 0.213
}
root default {
	id -1		# do not change unnecessarily
	alg straw
	hash 0	# rjenkins1
	item ceph-osd1 weight 0.426
	item ceph-osd2 weight 0.426
	item ceph-osd9 weight 0.426
	item ceph-osd10 weight 0.426
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
