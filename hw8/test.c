#include <stdio.h>
#include <stdlib.h>

int *call(){
    int *temp = malloc(100);
    return temp;
}


int main(){
    int *prt;
    prt = call();
    return 0;
}
