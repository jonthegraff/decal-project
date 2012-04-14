#!/bin/bash
nc -l -p 10001 -e $0 &
nc -l -p 10002 | server.sh