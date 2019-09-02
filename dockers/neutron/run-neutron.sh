#!/bin/bash

FILE=/start_services
while [ ! -f $FILE ]
do
  sleep 3
done
/usr/share/openvswitch/scripts/ovs-ctl start --system-id=random &
neutron-openvswitch-agent &
neutron-metadata-agent &
neutron-dhcp-agent &
#neutron-l3-agent &
neutron-server

#bash
