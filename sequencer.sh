#!/bin/bash

if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` [call-id] [filename]"
  exit 0
fi

awk -f src/SIPHawk.awk -v callID=$1 $2 > /tmp/testFile
awk -f src/tester.awk -v ipAddrs=$(awk -f src/SIPSequencer.awk /tmp/testFile) /tmp/testFile > /tmp/mscText
./dep/mscgen-0.20/bin/mscgen -i /tmp/mscText -T png -o out.png

