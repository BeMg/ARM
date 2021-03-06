.section .text
.global NumSort
.type NumSort,%function

NumSort:
    /* function start */
    MOV ip, sp
    STMFD sp!, {r0-r10, fp, ip, lr, pc}
    SUB fp, ip, #4

    LDR r5, [ip], #4 /* get array size */
    LDR r6, [ip], #4 /* get array address */
    LDR r0, [ip], #4

    MOV r9 ,r6
    MOV r10 , r0
    LDMIA r9! , {r1-r5}
    STMIA r10!, {r1-r5}
/*
for(int i=0; i<n; i++){
    for(int j=0; j<n-i; j++){
        if(a[j]>a[j+1])
            swap(a[j],a[j+1]);
    }
}
*/
    MOV r7, #0
    MOV r8, #0
    MOV r7, r5

LOOPi:
    MOV r4, r0
    SUB r7, r7, #1
    MOV r8, r7
LOOPj:
    CMP r8, #0
    BEQ FIN
    SUB r8, r8, #1
    LDR r9, [r4]
    LDR r10, [r4, #4]!
    CMP r10, r9
    BMI SWAP
    B END
SWAP:
    MOV r1, r9
    MOV r9, r10
    MOV r10, r1
END:
    STR r9, [r4, #-4]
    STR r10, [r4]
    CMP r8, #0
    BNE LOOPj
    CMP r7, #0
    BNE LOOPi
/*
*/
FIN:
    MOV r8, r0
    /* function exit */
    LDMEA fp, {r0-r10, fp, sp, pc}
    nop
    .end
