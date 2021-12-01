//
// Created by Ben Gagnon on 11/26/21.
//

#include "checkPalindrome.h"

int checkPalindrome (char* msg)
{
    //initialize pointer for beginning of word
    char *leftptr = msg;
    //initialize point for end of word
    //subtract one to point to the character before '\0'
    int length = strlen(msg);
    char *rightptr = msg + length - 1;

    for (int i = 0; i < length; ++i)
    {
        //return 0 if left and right pointer are not equal
        if (*leftptr != *rightptr)
        {
            printf(msg);
            printf(" is not a palindrome.\n");
            return 0;
        }
        //iterate pointers
        leftptr++;
        rightptr--;
    }
    //return 1 if all characters match
    printf(msg);
    printf(" is a palindrome.\n");
    return 1;
}
