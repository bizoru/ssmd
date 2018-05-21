#!/usr/bin/env bash




if [ -z $1 ] && [ -z $2 ]; then
  echo "Debe ingresar un host para instalar el servicio de metricas"
  exit 1
fi

if [ -z "$(command -v ansible-playbook)" ]; then
   echo "Para provisionar debera instalar previamente ansible-playbook"
   echo "Consulte como instalar ansible-playbook aqui: "
else
  ansible-playbook -u vagrant -i "$1," -e "node_name=$2" --tags "metricbeat" ansible/main.yml
fi
