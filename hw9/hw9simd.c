#include <stdio.h>
#include <string.h>

#include "xmmintrin.h"
#include "mmintrin.h"
#include "emmintrin.h"

#define MAX 200

int main() {
    //Because use double type, let match 64 in memory.
    double data[MAX][MAX] __attribute__((aligned(64)));
    //input
    double ANS[200];
    int cnt = 0;
    freopen("data.txt","r",stdin);
    freopen("output.txt","w",stdout);
    for(int i=0; i<MAX; i++) {
        for(int j=0; j<MAX; j++) {
            scanf("%lf",&data[i][j]);
        }
    }
    __m128d *m_row1,*m_row2;
    for(int i=0; i<MAX; i++) {
        double ans[2]__attribute__ ((aligned(64)))= {0};
        //Claim variable to store ans.
        __m128d *m_ans = (__m128d*) ans;
        for(int j=0; j<MAX; j++) {
            //Two variable to be the calculating thing.
            m_row1 = (__m128d*)data[i];
            m_row2 = (__m128d*)data[j];
            //mulit them and add.
            for(int k=0; k<MAX/2; k++) {
                *m_ans = _mm_add_pd(_mm_mul_pd(m_row1[k],m_row2[k]),*m_ans);
            }
        }
        ANS[cnt++] = ans[0]+ans[1];
    }
    for(int i=0; i<200; i++) {
        printf("%.3lf\n",ANS[i]);
    }
    return 0;
}
