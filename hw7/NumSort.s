.section .text
.global NumSort
.type NumSort,%function

.section .data
.type result,%object

.size result,100

.result:
    .space 100

NumSort:
    /* function start */
    MOV ip, sp
    STMFD sp!, {r0-r10, fp, ip, lr, pc}
    SUB fp, ip, #4

    MOV r5, r0 /* get array size */
    MOV r6, r1 /* get array address */

    MOV r8, #100
    LDR r6, .result
    MOV r7, r6
LOOP:
    LDR r6, [r1], #4
    MOV r9, r6
    LDR r6, [r9], #4
    MOV r6, r9
    SUB r8, r8, #1
    CMP r8, #0
    BNE LOOP
    MOV r6, r7

/*
for(int i=0; i<n; i++){
    for(int j=0; j<n-i; j++){
        if(a[j]>a[j+1])
            swap(a[j],a[j+1]);
    }
}
*/

FIN:
    MOV r0, r6
    /* function exit */
    LDMEA fp, {r0-r10, fp, sp, pc}
    nop
    .end
