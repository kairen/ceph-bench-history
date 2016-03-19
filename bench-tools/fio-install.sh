#!/bin/bash

sudo apt-get -y install librbd-dev zlib1g-dev libaio1 libaio-dev make
git clone git://git.kernel.dk/fio.git && cd fio
./configure
make && sudo make install
