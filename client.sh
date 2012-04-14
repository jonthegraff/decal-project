#!/bin/bash

ip=localhost
port1=10001
port2=`nc $ip $port1`
wait 4
nc $ip $port2 &
echo type "'help'" to view your options
fg