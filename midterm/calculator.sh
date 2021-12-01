#!/bin/bash

echo "------------"
echo "Enter Choice"
echo "------------"
echo "1. Addition"
echo "2. Subtraction" 
echo "3. Multiplication"
echo "4. Division"
echo "5. Modulus"
read choice

echo "Enter Two Numbers: "
read a 
read b

case $choice in 
	1) result=`echo $a + $b | bc`
	;;
	2) result=`echo $a - $b | bc`
	;;
	3) result=`echo $a \* $b | bc`
	;;
	4) result=`echo $a / $b | bc`
	;;
	5) result=`echo $a % $b | bc`
	;;
esac
echo "Result = $result"

