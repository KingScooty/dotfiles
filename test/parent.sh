#!/bin/bash

echo "Via shell script:"
./child.sh -y -n -wut

echo "Now through CI:"
./child.sh $@
