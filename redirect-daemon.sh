#!/bin/bash


if [ ! $DECALPORT ] ; then
    echo -n $DECALPORT
fi

kill `lsof -i :10001 | tail -n +2 | sed -e 's,[ \t][ \t]*, ,g' | cut -f2 -d' '` # clears junk on port 10001
nc.traditional -l -p 10001 -e $0 & #wait for more users and recurse when they come

if [ ! $DECAL ] ; then # first time script is executed in a session
    export DECAL=true # makes the above test work
    export DECALPORT=10002 # further connections will start here
    if [ ! -d ~/aber ] ; then # if our directory is not there, make it
	mkdir ~/aber
	mkdir ~/aber/musicfiles
    fi
    ./execute-commands.sh # allow the server-user to enter commands as well
else
    kill `lsof -i :$DECALPORT | tail -n +2 | sed -e 's,[ \t][ \t]*, ,g' | cut -f2 -d' '` # clears junk on DECALPORT
    nc -l -p $DECALPORT | ./execute-commands.sh # space for one user connection
    export DECALPORT=$(expr $DECALPORT + 1) # further users will go on higher ports
fi
