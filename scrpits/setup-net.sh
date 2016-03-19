#!/bin/bash

HOSTS=$(cat /etc/hosts | grep  "ceph-*" | awk '{print $2}')

function config_public_net(){
IP=${1}
PUBLIC_ETH=${2}
echo "
auto lo"
echo "
auto ${PUBLIC_ETH}
iface ${PUBLIC_ETH} inet static
        address ${IP}
        netmask 255.255.255.0
        gateway 10.26.1.254
        dns-nameservers 8.8.8.8
"
}

function config_cluster_net(){
ID=${1}
CLUSTER_ETH=${2}
echo "
auto ${CLUSTER_ETH}
iface ${CLUSTER_ETH} inet static
        address 172.17.0.${ID}
        netmask 255.255.255.0
        mtu 9000
"
}


rm ~/.ssh/known_hosts*

for host in ${HOSTS}; do
    echo "[ ---- ${host} ---- ]"
    scp -o StrictHostKeyChecking=no /etc/hosts ${host}:~/
    ssh -o StrictHostKeyChecking=no ${host} "sudo mv ~/hosts /etc"
    IP=$(ssh -o StrictHostKeyChecking=no ${host} 'echo $(ip route get 8.8.8.8)' | awk '{print $7; exit}')
    PUBLIC_ETH=$(ssh -o StrictHostKeyChecking=no ${host} "ip -4 a | grep ${IP}" | awk '{print $7}')
    config_public_net ${IP} ${PUBLIC_ETH} | ssh -o StrictHostKeyChecking=no ${host} "sudo tee /etc/network/interfaces"
    ID=$(echo ${IP} | grep -o "[0-9]*$")
    CLUSTER_ETH="eth0"
    if echo ${host} | grep -q "ceph-osd*" ; then
	if [ "${PUBLIC_ETH}" == "eth0" ]; then
	    CLUSTER_ETH="eth1"
	fi
        config_cluster_net ${ID} ${CLUSTER_ETH} | ssh -o StrictHostKeyChecking=no ${host} "sudo tee -a /etc/network/interfaces"
    fi
   ssh -o StrictHostKeyChecking=no ${host} "sudo reboot"
done
