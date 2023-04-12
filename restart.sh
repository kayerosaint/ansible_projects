#!/bin/bash
ping -c 3 10.10.130.11 > /dev/null
if [ $? -eq 0 ]; then
  echo "Connection OK!_$(date "+%Y-%m-%d-%T")" ;
else
  echo "Connection restored!_$(date "+%Y-%m-%d-%T")" ;
  if ! run=`ansible-playbook -i /home/maksim/Documents/ansible/inventory.yml /home/maksim/Documents/ansible/restart_vpn_network.yml`; then echo $run && exit ; fi
fi