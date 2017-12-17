#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    || exit 1

echo "Via shell script:"
./child.sh -y -n -wut

echo "Now through CI:"
./child.sh $@
