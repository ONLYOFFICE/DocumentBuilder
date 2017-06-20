#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

cd "$SCRIPTPATH"

for entry in "./samples"/*
do
echo "run $entry..."
./docbuilder "$entry"
done
