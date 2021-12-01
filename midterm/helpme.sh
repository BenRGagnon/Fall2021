#!/bin/bash

echo -n "Enter a command: "
read input
input=$(echo "$input" | tr a-z A-Z)

if [ "$(sed -n "/^$input(1)/,/$input(1)$/p" 'mandatabase.txt' | more)" ]
then
sed -n "/^$input(1)/,/$input(1)/p" 'mandatabase.txt' | more
else
echo "Sorry. I cannot help you."
fi

