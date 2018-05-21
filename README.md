### SISTEMA MODULAR DE ADQUISICIÓN, GESTIÓN Y VISUALIZACIÓN WEB DE MÉTRICAS DE DESEMPEÑO PARA CENTROS DE CÓMPUTO DE ALTO RENDIMIENTO CASO DE ESTUDIO: CECAD


1. Inicialización de los nodos de prueba
  ```
      cd boxes
      vagrant up
  ```

2. Aprovisionamiento de cada nodo con metricbeat

  ```
    cd provision/ansible
    ./provision.sh 192.168.33.10 nodo-1
    ./provision.sh 192.168.33.11 nodo-2
    ./provision.sh 192.168.33.12 nodo-3
    ./provision.sh 192.168.33.13 nodo-4
   ```
3. Inicialización de elasticsearch y kibana
   ```
   cd elastic
   docker-compose up
   ```
4. Verificación de Kibana, dirigirse a http://localhost:5601, usuario: elastic, password: changeme.

5. Cargar los dashboards de metricbeat en kibana_server
   ```
   ssh vagrant@192.168.33.10
   vagrant@node-1$ metricbeat setup
   ```
6. Ir a http://localhost:5601/goto/c3525e229992b89e50063b9f4480c146 para verificar el    dashboard del host

5. Prueba de estres.
   ```
   (opcinal) rm $HOME/.ssh/known_hosts
   ssh vagrant@192.168.33.10
   vagrant@host$ stress
   ```
   ###### Memoria
   ```
    stress -m 1 --vm-bytes 200MB
   ```

   ###### CPU
   ```
    stress -c 2
   ```

   ###### Disco
   ```
    stress -d 1 --hdd-bytes 200MB

   ```

#### Archivo de Configuración Vagrantfile
El archivod de configuración contiene 4 máquinas cada una con 512 MB de memoria y
2 CPUs asignadas. Existen dos máquinas virtuales corriendo Ubuntu 16.04 y dos máquinas
corriendo CentOS 7.
