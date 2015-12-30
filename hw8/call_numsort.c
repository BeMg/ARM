#include <stdio.h>
#include <string.h>
extern int* NumSort(int, int*);
extern char* FileOutput(char*);

int main(){
    int a[10];
    int i,j;
    int *result;
    char output[100];
    for(i=0,j=9; i<9; i++,j--){
            a[i] = j;
    }
    a[1] = 1;
    a[2] = 1;
    a[5] = 7;
    a[8] = 2;
    for(i=0; i<9; i++)
        printf("%d%c",a[i],i==8 ? '\n' : ' ');
    result = NumSort(9,a);
    int cnt = 0;
    for(i=0; i<9; i++){
        output[cnt++] = result[i]+'0';
        if(i==8)
            output[cnt++] = '\n';
        else
            output[cnt++] = ' ';
    }
    FileOutput(output);
    return 0;
}
