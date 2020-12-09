#!/bin/bash
  
# turn on bash's job control
set -m
  
chmod +x /opt/start.sh
./opt/start.sh &
  
chmod +x /opt/setup.sh
./opt/setup.sh
    

fg %1