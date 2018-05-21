#!/usr/bin/env bash

export ANSIBLE_HOST_KEY_CHECKING=False

./provision.sh 192.168.33.10 nodo-1 collectd
./provision.sh 192.168.33.11 nodo-2 collectd
./provision.sh 192.168.33.12 nodo-3 collectd
./provision.sh 192.168.33.13 nodo-4 collectd
