#!/bin/bash

echo "enter command:"

while read command
do
	case $command in
	play ) 
	echo "play"
	;;
	stop ) 
	echo "stop"
	;;
	playlist ) 
	echo "playlist"
	;;
	remove[:space:][0-9][0-9] ) 
	echo "remove" # do something with command
	;;
	fromTo[:space:][0-9][0-9][:space:][0-9][0-9] )
	echo "fromTo"
	;;
	exit)
	break
	;;
	*)
	;;	
	esac

    echo "enter command:"
    echo $command HI
done
