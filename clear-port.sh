#!/bin/bash

kill `lsof -i :10001 | tail -n +2 | sed -e 's,[ \t][ \t]*, ,g' | cut -f2 -d' '`
kill `lsof -i :10002 | tail -n +2 | sed -e 's,[ \t][ \t]*, ,g' | cut -f2 -d' '`