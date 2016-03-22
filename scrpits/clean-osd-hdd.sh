#!/bin/bash

echo "TASK [ Clean osd and disk ] *************************"
ansible osds.hdd -m ping
ansible osds.hdd -a "sudo stop ceph-osd-all"
ansible osds.hdd -a "sudo umount /dev/sdb1"
ansible osds.hdd -a "sudo umount /dev/sdc1"

ansible osds.hdd -m shell -a 'for osd_dir in $(sudo ls /var/lib/ceph/osd); do echo ${osd_dir}; sudo rm -rf /var/lib/ceph/osd/${osd_dir};  done'

OSDS=$(echo $(ansible mons[0] -m shell -a "sudo ceph osd tree | grep -o 'osd\.[0-9]*'") | grep -o 'osd\.[0-9]*')
for OSD in ${OSDS}; do
    ID=$(echo ${OSD} | grep -o "[0-9]*")
    ansible mons[0] -m shell -a "sudo ceph osd out ${ID}"
    ansible mons[0] -m shell -a "sudo ceph osd down ${ID}"
    ansible mons[0] -m shell -a "sudo ceph osd crush remove ${OSD}"
    ansible mons[0] -m shell -a "sudo ceph auth del ${OSD}"
    ansible mons[0] -m shell -a "sudo ceph osd rm ${ID}"
done
