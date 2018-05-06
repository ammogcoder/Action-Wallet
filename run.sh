#!/bin/sh
if [ -x jre/bin/java ]; then
    JAVA=./jre/bin/java
else
    JAVA=java
fi
${JAVA} -cp classes:lib/*:conf:addons/classes:addons/lib/* nxt.Nxt
java -Xmx640m -cp classes:lib/*:conf nxt.Nxt
