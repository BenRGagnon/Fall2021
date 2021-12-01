#include "main.h"

int main() {
    char strSrc[] = "Hello World";
    char strDest[sizeof strSrc];

    printf("%s\n", mystrcpy(strDest, strSrc));

    findStr();

    return 0;
}
