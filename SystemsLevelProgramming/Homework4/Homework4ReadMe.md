# Homework 4 Read Me

This program drives four separate script examples. 

## Check Password

This script checks for a password's strength. The password is checked for lower case
letters, upper case letters and numbers. For each of these missing, 20 points
are added to the deduction for each category. 
At the same time we check if the current char is the next consecutive character. 
If this is true, we add 20 points to the deduction.

At the end, if there is more than 30 points in deductions, the password is marked
as not safe and suggests resetting.

## Check Palindrome

This script checks whether a character array is a palindrome by using a pointer
to the first and last characters. It iterates through the array forwards and backwards, 
breaking if the characters are different. 

## Dialing Code

This script loads a custom struct loaded with country names and integer country codes.
If the input matches a stored country code, that country's name is returned.

## Swap Without Third Variable

This script swaps two integer variables without using a third. It stores the combination
of var1 and var2 in var1. This value minus var2 is stored in var2. Finally, var1 var2 is
subtracted from var1. 
 
