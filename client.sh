#!/bin/bash

ip=localhost
port1=10001
myip=`echo 1.3.4`
port2=`echo $myip | nc $ip $port1`
echo type "'help'" to view your options
nc $ip $port2
