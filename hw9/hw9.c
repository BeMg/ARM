#include <stdio.h>

int main(){
    int ans[200]={0};
    int data[200][200];
    FILE* pfile =  fopen("data.txt","r");
    for(int i=0; i<200; i++){
	for(int j=0; j<200; j++){
	    fscanf(pfile,"%d",&data[i][j]);	    
	}
    }
    fclose(pfile);
    for(int i=0; i<200; i++){
	for(int j=0; j<200; j++){
	    ans[i]+=data[i][j];
	}
    }
    FILE* qfile = fopen("output.txt","w");
    for(int i=0; i<200; i++){
	fprintf(qfile,"%d\n",ans[i]);
    }
    fclose(qfile);
    return 0;
}
