#!/bin/bash

glance-registry &
sleep 5
glance-api
