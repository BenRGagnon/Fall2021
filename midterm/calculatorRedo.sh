#!/bin/bash

value= "0"

# define regular expressions for calculator
clr="clr"

newCalc='^[0-9]+(.[0-9])? ?[\+\-\*\%\/] ?[0-9]+(.[0-9]+)?$'

contCalc='^[\+\-\*\%\/] ?[0-9]+([0-9]+)?$'


echo "----------"
echo "Calculator"
echo "----------"

while :
do 

read input

# if user inputs clear
if [[ $input =~ $clr ]]   
then
	value= "0"
	echo "cleared" 
elif [[ $input =~ $newCalc ]]
then 
	value= echo "$input" | bc
	echo $value

elif [[ $input =~ $contCalc ]]
then
	value= echo  "${value}$input" 
	echo $value
	bc $value
	echo $value
else  
	echo "Calculation not recognized"
fi

done
