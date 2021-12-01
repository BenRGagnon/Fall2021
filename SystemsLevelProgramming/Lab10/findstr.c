//
// Created by Ben Gagnon on 11/25/21.
//
#include "main.h"
#include "findstr.h"

void findStr(void)
{
    char smallest[20] = {'\0'};
    char largest[20] = {'\0'};
    char temp[20];

    while (1)
    {
        printf("Enter word: ");
        scanf("%s", temp);

        //break if word entered is 4 letters long
        if (strlen(temp) == 4)
        {
            break;
        }

        //check if smallest and largest are null
        if (smallest[0] == NULL) {
            strcpy(smallest, temp);
            if(largest[0] == NULL) {
                strcpy(largest, temp);
            }
        } else {
            //Compare length of new entry with current smallest and largest strings
            int cmpSmall = strcmp(temp,smallest);
            int cmpLarge = strcmp(temp,largest);

            //swap if smaller than current smallest
            if (cmpSmall < 0)
            {
                strcpy(smallest, temp);
            }//else if it is larger that current largest swap
            else if (cmpLarge > 0)
            {
                strcpy(largest,temp);
            }
        }
    }

    printf("Smallest word: %s\n", smallest);
    printf("Largest word: %s\n", largest);
}