//
// Created by Ben Gagnon on 11/26/21.
//

#include "swapWithoutThirdVariable.h"

void swapWithoutThirdVariable(int* var1, int* var2){
    *var1 = *var1 + *var2;
    *var2 = *var1 - *var2;
    *var1 = *var1 - *var2;
}
