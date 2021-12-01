//
// Created by Ben Gagnon on 11/25/21.
//

#include "checkPasswd.h"

void checkPasswd (char* password)
{
    //initialize deduction variable and find length of password
    int deduction = 0;
    int length = (int)strlen(password);

    //initialize metrics for password strength
    //When we encounter one of these metrics, we increment
    //If the value is 0 at the end of the password, we deduct
    int hasLowerCase = 0;
    int hasUpperCase = 0;
    int hasNumbers = 0;
    //This defaults to true. If we encounter consecutive chars we
    //will set to 0. Deductions will be made at the end if the value
    //is still 0.
    int doesntHaveConsecutiveChar = 1;
    char previousChar = '\0';

    for (char *ptr = password; ptr < (password + length); ptr++) {

        //check if character is uppercase
        if (isupper(*ptr))
        {
            //increment hasUpperCase. Only the first one matters
            hasUpperCase++;
        }

        //check if character is lowercase
        if (islower(*ptr))
        {
            hasLowerCase++;
        }

        //check if character is number
        if (isdigit(*ptr))
        {
            hasNumbers++;
        }

        //check if current character matches the previous
        if (previousChar + 1 == *ptr)
        {
            doesntHaveConsecutiveChar = 0;
        }
        previousChar = *ptr;
    }

    //Calculate total deduction
    //If hasUpperCase is 0
    if (!hasUpperCase)
    {
        printf("Doesn't have upper case character\n");
        deduction = deduction + 20;
    }
    //If hasLowerCase is 0
    if (!hasLowerCase)
    {
        printf("Doesn't have lower case letter\n");
        deduction = deduction + 20;
    }
    //If hasNumbers is 0
    if (!hasNumbers)
    {
        printf("Doesn't have a number\n");
        deduction = deduction + 20;
    }
    //If !doesntHaveConsecutiveChars
    if (!doesntHaveConsecutiveChar)
    {
        printf("Has consecutive characters\n");
        deduction = deduction + 20;
    }


    //If the total deduction is greater than 30,
    //print that the password is unsafe

    printf("Deduction = %d\n", deduction);
    if (deduction > 30)
    {
        printf("The password is unsafe! Please reset.\n");
    } else
    {
        printf("The password is safe.\n");
    }
}
