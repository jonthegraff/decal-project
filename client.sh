#!/bin/bash

ip=localhost
port1=10001
port2=`echo "true" | nc $ip $port1`
echo type "'help'" to view your options
nc $ip $port2
