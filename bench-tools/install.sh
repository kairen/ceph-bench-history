#!/bin/bash

sudo apt-get update
sudo apt-get install -y librbd-dev zlib1g-dev libaio1 libaio-dev make git iperf python-pip python-dev python-virtualenv
sudo apt-get install -y bonnie++ ioping hdparm iozone3

# Installing swift benchmark
sudo pip install swift swift-bench greenlet

# Installing SwiftStack benchmark
pip install pyzmq==14.0.1 --install-option="--zmq=bundled"
pip install ssbench

git clone git://git.kernel.dk/fio.git && cd fio
./configure
make && sudo make install
