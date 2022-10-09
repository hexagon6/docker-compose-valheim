#!/bin/bash

# get the process id of valheim_server only if it has been started by start_server.sh script
VHPID=$(ps faux | grep start_server.sh -A1 | tail -n1 | grep valheim_server.x86_64 | awk '{ print $2 }')
PID=${VHPID:-0}

if [ 1 -lt $PID ];
then
  # send CTRL+C to valheim server process to gracefully shut down and avoid loosing world data
  sudo kill -2 $PID
fi

