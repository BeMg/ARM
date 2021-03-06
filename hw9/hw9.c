#include <stdio.h>

#define MAX 200

int main(){
    double ans[MAX]={0};
    double data[MAX][MAX];
    FILE* pfile =  fopen("data.txt","r");
    //input
    for(int i=0; i<MAX; i++){
	for(int j=0; j<MAX; j++){
	    fscanf(pfile,"%lf",&data[i][j]);
	}
    }
    fclose(pfile);
    float temp=0;
    //calculate
    for(int i=0; i<MAX; i++){
	for(int j=0; j<MAX; j++){
	    for(int k=0; k<MAX; k++){
		ans[i]+=data[i][k]*data[j][k];
	    }
	}
    }
    FILE* qfile = fopen("output.txt","w");
    //output
    for(int i=0; i<MAX; i++){
	fprintf(qfile,"%.3lf\n",ans[i]);
    }
    fclose(qfile);
    return 0;
}
