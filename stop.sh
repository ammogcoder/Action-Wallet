#!/bin/sh
APPLICATION="Action"
DIR=`dirname $0`; cd $DIR
if [ -e ~/.${APPLICATION}/nxt.pid ]; then
    PID=`cat ~/.${APPLICATION}/nxt.pid`
    ps -p $PID > /dev/null
    STATUS=$?
    echo "Stopping Desktop Application. Please wait..."
    while [ $STATUS -eq 0 ]; do
        kill `cat ~/.${APPLICATION}/nxt.pid` > /dev/null
        sleep 5
        ps -p $PID > /dev/null
        STATUS=$?
    done
    rm -f ~/.${APPLICATION}/nxt.pid
    echo "Action server stopped"
fi

