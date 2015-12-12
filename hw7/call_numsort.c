#include <stdio.h>
extern int* NumSort(int, int*);

int main(){
    int a[100];
    int i,j;
    int *result;
    for(i=0,j=100; i<100; i++,j--){
            a[i] = j;
    }
    for(i=0; i<100; i++)
        printf("%d%c",a[i],i==99 ? '\n' : ' ');
    result = NumSort(100,a);
    for(i=0; i<100; i++)
        printf("%d%c",result[i],i==99 ? '\n' : ' ');
    return 0;
}
