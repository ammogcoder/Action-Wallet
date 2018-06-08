#!/bin/sh
APPLICATION="Action"
if [ -e ~/.${APPLICATION}/nxt.pid ]; then
    PID=`cat ~/.${APPLICATION}/nxt.pid`
    ps -p $PID > /dev/null
    STATUS=$?
    if [ $STATUS -eq 0 ]; then
        echo "Action server already running"
        exit 1
    fi
fi
DIR=`dirname $0`; cd $DIR
mkdir -p ~/.${APPLICATION}/
DIR=`dirname "$0"`
cd "${DIR}"
if [ -x jre/bin/java ]; then
    JAVA=./jre/bin/java
else
    JAVA=java
fi
nohup ${JAVA} -jar -Dnxt.runtime.mode=desktop action.jar > /dev/null 2>&1 &
echo $! > ~/.${APPLICATION}/nxt.pid
cd - > /dev/null
