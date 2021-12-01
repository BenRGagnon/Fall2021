//
// Created by Ben Gagnon on 11/26/21.
//

#include "dialingCode.h"
char* searchByCode(void){

    //initialize data structure for country codes
    const struct dialing_code country_codes[] =
            {{"Argentina", 54}, {"Bangladesh", 880}, {"Brazil", 55},
             {"Burma (Myanmar)", 95}, {"China", 86}, {"Colombia", 57},
             {"Congo, Dem. Rep. of", 243}, {"Egypt", 20}, {"Ethiopia", 251},
             {"France", 33}, {"Germany", 49}, {"India", 91}, {"Indonesia", 62},
             {"Iran", 98}, {"Italy", 39}, {"Japan", 81}, {"Mexico", 52},
             {"Nigeria", 234}, {"Pakistan", 92}, {"Philippines", 63},
             {"Poland", 48}, {"Russia", 7}, {"South Africa", 27},
             {"South Korea", 82}, {"Spain", 34}, {"Sudan", 249},
             {"Thailand", 66}, {"Turkey", 90}, {"Ukraine", 380},
             {"United Kingdom", 44}, {"United States", 1}, {"Vietnam", 84}};

    //Initialize, prompt, and read user input
    int code;
    printf("Enter a country code: ");
    scanf("%d", &code);

    //Find number of items in the structure
    int length = sizeof country_codes / sizeof country_codes[0];

    //Initialize variable for found country
    char* country = NULL;

    //Loop through structure
    for (int i = 0; i < length; i++) {
        //Assign country and break loop if matching code is found
        if (country_codes[i].code == code){
            country = country_codes[i].country;
            break;
        }
    }

    //Print results
    //If country is not null, a result was found
    if (country){
        printf(country);
        printf("\n");
    } else {
        printf("Country not found for entered code.\n");
    }
}



