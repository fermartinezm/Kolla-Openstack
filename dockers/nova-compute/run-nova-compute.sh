#!/bin/bash

libvirtd &
process="$(ps -e)"
while [[ $process != *"libvirt"* ]]
do
  sleep 3
done
nova-compute &

FILE=/etc/neutron/plugin.ini 
while [ ! -f $FILE ]
do
  sleep 3
done
/usr/share/openvswitch/scripts/ovs-ctl start --system-id=random &
neutron-openvswitch-agent
