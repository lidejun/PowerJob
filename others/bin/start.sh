#!/bin/bash
cd `dirname $0`
BIN_DIR=`pwd`
cd ..
DEPLOY_DIR=`pwd`
##进程号ID
PIDFILE=$DEPLOY_DIR/data/powerjob-server.pid
# ensure it exists, otw stop will fail
mkdir -p $(dirname "$PIDFILE")

#如果存在进程则退出
if [ -f $PIDFILE ]; then
  PID=`cat $PIDFILE`
  EXIST_PID=`ps -f -p $PID | grep java`
  if [ -n "$EXIST_PID" ]; then
     echo already running as process $PID.
     exit 0
  fi
  rm "$PIDFILE"
fi

LOGS_DIR=$DEPLOY_DIR/logs
if [ ! -d $LOGS_DIR ]; then
    mkdir $LOGS_DIR
fi
STDOUT_FILE=$LOGS_DIR/stdout.log

JAVA_OPTS="-Dserver.port=7700 -Dspring.profiles.active=product -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true "

JAVA_MEM_OPTS=" -server -Xms512m -Xmx512m -Xmn256m -Xss256k -XX:SurvivorRatio=8 -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseCMSCompactAtFullCollection -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=60 -noverify "

if [ "$JAVA_HOME" != "" ]; then
  JAVA="$JAVA_HOME/bin/java"
else
  JAVA=/appfuruns/jdk1.8.0_181/bin/java
fi

echo -e $"Starting PowerJob Server"
nohup $JAVA $JAVA_OPTS $JAVA_MEM_OPTS -jar powerjob-server-starter-4.0.1.jar > $STDOUT_FILE 2>&1 &

#将进程ID号写入文件
if [ $? -eq 0 ]
then
  if /bin/echo -n $! > "$PIDFILE"
  then
    sleep 1
    echo STARTED
  else
    echo FAILED TO WRITE PID
    exit 1
  fi
else
  echo SERVER DID NOT START
  exit 1
fi
echo "STDOUT: $STDOUT_FILE"
