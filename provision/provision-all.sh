#!/bin/#!/usr/bin/env bash

export ANSIBLE_HOST_KEY_CHECKING=False

./provision.sh 192.168.33.10 nodo-1
./provision.sh 192.168.33.11 nodo-2
./provision.sh 192.168.33.12 nodo-3
./provision.sh 192.168.33.13 nodo-4
