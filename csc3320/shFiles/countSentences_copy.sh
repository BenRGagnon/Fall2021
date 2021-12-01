#!/bin/bash

echo -n "Total number of lines = "
awk -F '.' '{print NF}' myexamfile.txt | awk '{s+=$1} END {print s}'
echo ""
