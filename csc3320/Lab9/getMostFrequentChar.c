#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

int main ()
{
    FILE *file = fopen("./test.txt", "r");
    if (file == NULL) return 0;;

    char character;
    char *code;
    int *frequency;
    int count = 0;
    int max = 0;
    int maxIndex = 0;
    
    fseek(file, 0, SEEK_END);
    long f_size = ftell(file);
    code = malloc(f_size);
    frequency = malloc(f_size);

    while ((character = tolower(fgetc(file))) != EOF)
    {
        for (int i = 0; i < count; i++)
        {
            if (character == code[i])
            {
                frequency[i]++;
                break;
            }
            code[count] = character;
            frequency[count++]++;
        }
    }

    for (int i = 0; i < count; i++)
    {
        int freq = frequency[i];
        if (freq > code[maxIndex])
        {
            maxIndex = i;
        }
        
    }
        printf("The most frequent letter is '%c'. It appeared %d times.", code[maxIndex], frequency[maxIndex]);
        return 0;

}
