#!/bin/bash

sudo apt-get update
sudo apt-get install -y librbd-dev zlib1g-dev libaio1 libaio-dev make git iperf python-pip python-dev python-virtualenv

# Installing swift benchmark
sudo pip install swift swift-bench

# Installing SwiftStack benchmark
virtualenv ./ssbench-env
./ssbench-env/bin/pip install pyzmq==14.0.1 --install-option="--zmq=bundled"
./ssbench-env/bin/pip install ssbench

git clone git://git.kernel.dk/fio.git && cd fio
./configure
make && sudo make install
