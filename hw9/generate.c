#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    FILE* fptr = fopen("data.txt","w");
    int a,b;
    float c;
    for(int i=0; i<200; i++){
	for(int j=0; j<200; j++){
	    a=rand()%500+1;
	    b=rand()%51+5;
	    c=(float)a / (float)b;
	    fprintf(fptr,"%f%c",c,j==199 ? '\n' : ' ');
	}
    }
    fclose(fptr);
    return 0;
}
