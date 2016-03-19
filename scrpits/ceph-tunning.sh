#!/bin/bash
# Ceph Tunning init.d file
# autor KaiRen-Bai

for CPUFREQ in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do [ -f $CPUFREQ ] || continue; echo -n performance | sudo tee $CPUFREQ; done

echo "8192" | sudo tee  /sys/block/sda/queue/read_ahead_kb
echo "vm.swappiness = 0" | sudo tee /etc/sysctl.conf
sudo sysctl -p

echo 4194303 | sudo tee  /proc/sys/kernel/pid_max

HOST_NAME=$(hostname)

HOST_NUM=$(echo "$HOST_NAME" | grep -o "[0-9]*")
if [ $HOST_NUM -le 4 ]; then
	echo "deadline" | sudo tee /sys/block/sda/queue/scheduler
	echo "noop" | sudo tee /sys/block/sdb/queue/scheduler
else
	echo "deadline" | sudo tee /sys/block/sda/queue/scheduler
	echo "deadline" | sudo tee /sys/block/sdb/queue/scheduler
fi
