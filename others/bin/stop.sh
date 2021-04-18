#!/bin/bash
cd `dirname $0`
BIN_DIR=`pwd`
cd ..
DEPLOY_DIR=`pwd`
##进程号ID
PIDFILE=$DEPLOY_DIR/data/powerjob-server.pid
# ensure it exists, otw stop will fail
mkdir -p $(dirname "$PIDFILE")

if [ ! -f "$PIDFILE" ]
then
  echo "PowerJob Server Can't Stop (could not find file $PIDFILE)"
else
  echo -e $"Stopping PowerJob Server"
  PID=$(cat "$PIDFILE")
  EXIST_PID=`ps -f -p $PID | grep java`
  if [ -n "$EXIST_PID" ]; then
    echo "kill $PID ..."
    kill $PID > /dev/null 2>&1
  fi

  COUNT=0
  while [ $COUNT -lt 1 ]; do
    sleep 1
    COUNT=1
    PID_EXIST=`ps -f -p $PID | grep java`
    if [ -n "$PID_EXIST" ]; then
      COUNT=0
      break
    fi
  done
  rm "$PIDFILE"
  echo "Stopped"
fi
exit 0
