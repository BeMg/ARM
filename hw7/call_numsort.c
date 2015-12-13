#include <stdio.h>
extern int* NumSort(int, int*);

int main(){
    int a[10];
    int i,j;
    int *result;
    for(i=0,j=10; i<10; i++,j--){
            a[i] = j;
    }
    for(i=0; i<10; i++)
        printf("%d%c",a[i],i==9 ? '\n' : ' ');
    result = NumSort(10,a);
    for(i=0; i<10; i++)
        printf("%d%c",result[i],i==9 ? '\n' : ' ');
    return 0;
}
