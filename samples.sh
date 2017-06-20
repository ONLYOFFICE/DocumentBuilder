#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

cd "$SCRIPTPATH"

for i in "./samples"/*
do
echo "run $i..."
./docbuilder "$i"
done
