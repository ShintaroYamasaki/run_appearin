#!/bin/bash

if [ -z "$APPEARIN_ID" ]; then
  echo "Token is NOT set."
  exit
fi

####### Appear.in #######
export DISPLAY=:0

# Kill previous process
PID=`ps -x | grep "/usr/lib/firefox/firefox" | grep -v grep | awk '{print $1}'`
echo $PID
if [ ! $PID = "" ]; then
  echo "Killing previous firefox process"
  kill -s SIGTERM $PID	
fi

URL="https://appear.in/${APPEARIN_ID}"
echo $URL

firefox $URL &
