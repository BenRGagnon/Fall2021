#!/bin/bash


echo "Words Letters"
awk -F '.' '{print NF " "  length}' myexamfile.txt | column -t 
echo -n  "Total number of sentences: "
awk -F '.' '{print NF}' myexamfile.txt | awk '{s+=$1} END {print s}'
echo""
