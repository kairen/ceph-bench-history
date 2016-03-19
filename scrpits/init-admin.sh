#!/bin/bash

ssh ceph-mon1 "sudo ceph auth get-or-create client.admin" | ssh ceph-admin "sudo tee /etc/ceph/ceph.client.admin.keyring"
ssh ceph-admin "sudo chmod 777 /etc/ceph/ceph.client.admin.keyring"
