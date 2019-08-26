#!/bin/bash

libvirtd &
process="$(ps -e)"
while [[ $process != *"libvirt"* ]]
do
  sleep 1
done
nova-compute
