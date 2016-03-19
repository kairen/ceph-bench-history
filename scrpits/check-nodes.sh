#!/bin/bash


HOSTS=$(cat /etc/hosts | grep  "ceph*" | awk '{print $2}')

for host in ${HOSTS}; do
    scp /etc/hosts ${host}:~/
    ssh ${host} "sudo mv ~/hosts /etc"
done
