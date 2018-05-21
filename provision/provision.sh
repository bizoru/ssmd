#!/usr/bin/env bash

if [ -z $1 ] && [ -z $2 ]; then
  echo "Debe ingresar un host para instalar el servicio de metricas"
  exit 1
fi

if [ -z "$(command -v ansible-playbook)" ]; then
   echo "Para provisionar debera instalar previamente ansible-playbook"
   echo "Consulte como instalar ansible-playbook aqui: "
   exit 1
fi

if [ ! -z $3 ]; then
    echo "Provisionando $2 con metricbeat y collectd"
    ansible-playbook -u vagrant -i "$1," -e "node_name=$2" -e "hostname=$2" ansible/main.yml
    exit 0
else
  echo "Provisionando $2 con metricbeat"
  ansible-playbook -u vagrant -i "$1," -e "node_name=$2" --tags "beats" ansible/main.yml
fi
