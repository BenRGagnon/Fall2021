//
// Created by Ben Gagnon on 11/25/21.
//
#include "main.h"
#include "strcpy.h"

char* mystrcpy(char* strDest, const char* strSrc) {

    //check if destination and source are empty
    if (strDest == NULL || strSrc == NULL) {
        return NULL;
    }

    //define pointer to destination
    char *ptr = strDest;

    //copy string until '\0' is encountered
    while (*strSrc != '\0'){
        *strDest = *strSrc;
        strDest++;
        strSrc++;
    }

    //include null character
    *strDest = '\0';

    return ptr;
}

