#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    FILE* fptr = fopen("data.txt","w");
    for(int i=0; i<200; i++){
	for(int j=0; j<200; j++){
	    fprintf(fptr,"%d%c",rand()%100,j==199 ? '\n' : ' ');
	}
    }
    fclose(fptr);
    return 0;
}
