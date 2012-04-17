#!/bin/bash

if [ ! $DECAL ] ; then # first time script is executed in a session
    export DECAL=true # makes the above test work
    export DECALPORT=10002 # further connections will start here
    if [ ! -d ~/aber ] ; then # if our directory is not there, make it
	mkdir ~/aber
	mkdir ~/aber/musicfiles
    fi
fi
kill `lsof -i :$DECALPORT | tail -n +2 | sed -e 's,[ \t][ \t]*, ,g' | cut -f2 -d' '` 2>/dev/null # clears junk on DECALPORT
nc -d -l $DECALPORT | ./execute-commands.sh & # space for one user connection
kill `lsof -i :10001 | tail -n +2 | sed -e 's,[ \t][ \t]*, ,g' | cut -f2 -d' '` 2>/dev/null # clears junk on port 10001
clientresp=`echo $DECALPORT | nc -l 10001` #wait for more users
export DECALPORT=$(expr $DECALPORT + 1) # further users will go on higher ports
if [ $clientresp ]; then
    $0
fi