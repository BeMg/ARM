#include <stdio.h>
#include <stdlib.h>

int main()
{
    freopen("data.txt","r",stdin);
    freopen("output.txt","w",stdout);
    int i,j,k;
    double array[200][200];
    for(i = 0; i < 200; i++)
        for(j = 0; j < 200; j++)
            scanf("%lf",&array[i][j]);
    double ans[200] = {0};
    for(i = 0; i < 200; i++)
    {
        for(j = 0;j < 199; j++)
        {
           ans[i] += array[i][j] * array[i][j+1];
        }
    }
    /*for(i = 0; i < 200; i++)
        {
            for(j = 0;j < 200; j++)
            {
                printf("%.2lf ",array[i][j]);
            }
            printf("\n");
        }*/
        for(i = 0; i < 200; i++)
        {
            printf("%.3lf\n",ans[i]);
        }
    return 0;
}
