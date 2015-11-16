/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- variable in matrix A --- */

	.size Aa, 12
Aa:
	.word 1
	.word 2
    .word 3

	.size Ab, 12
Ab:
	.word 3
	.word 2
    .word 1

/* --- variable in matrix B --- */

	.size Ba, 8
Ba:
	.word 2
	.word 3

	.size Bb, 8
Bb:
	.word 1
	.word 2

	.size Bc, 8
Bc:
	.word 5
	.word 6

/* --- variable in matrix C --- */

    .size Ca, 8
Ca:
    .word 1
    .word 2

    .size Cb, 8
Cb:
    .word 3
    .word 4

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function

.matrixA:
	.word Aa
	.word Ab

.matrixB:
	.word Ba
	.word Bb
    .word Bc

.matrixC:
    .word Ca
    .word Cb


main:
    /*matrixA first row mul matrixB first column */
    /*And store in r7*/
	MOV r0 ,#0
    LDR r1, .matrixA
    LDR r2, .matrixB
    MOV r6, #0
    LDR r3, [r1], #4
    LDR r4, [r2], #8
    MUL r5, r3, r4
    ADD r6, r6, r5
    LDR r3, [r1] , #4
    LDR r4, [r2] , #8
    MUL r5, r3, r4
    ADD r6, r6, r5
    LDR r3, [r1], #4
    LDR r4, [r2], #8
    MUL r5, r3, r4
    ADD r7, r6, r5

    /*matrixA first row mul matrixB second column */
    /*And store in r8*/
    LDR r1, .matrixA
    LDR r2, .matrixB
    MOV r6, #0
    LDR r3, [r1], #4
    LDR r4, [r2,#4]!
    MUL r5, r3, r4
    ADD r6, r6, r5
    LDR r3, [r1] , #4
    LDR r4, [r2,#8]!
    MUL r5, r3, r4
    ADD r6, r6, r5
    LDR r3, [r1], #4
    LDR r4, [r2,#8]!
    MUL r5, r3, r4
    ADD r8, r6, r5

    /*matrixA second row mul matrixB first column */
    /*And store in r9*/
    LDR r1, .matrixA
    LDR r2, .matrixB
    MOV r6, #0
    LDR r3, [r1,#12]!
    LDR r4, [r2], #8
    MUL r5, r3, r4
    ADD r6, r6, r5
    LDR r3, [r1,#4]!
    LDR r4, [r2], #8
    MUL r5, r3, r4
    ADD r6, r6, r5
    LDR r3, [r1,#4]!
    LDR r4, [r2], #8
    MUL r5, r3, r4
    ADD r9, r6, r5

    /*matrixA second row mul matrixB second column */
    /*And store in r10*/
    LDR r1, .matrixA
    LDR r2, .matrixB
    MOV r6, #0
    LDR r3, [r1,#12]!
    LDR r4, [r2,#4]!
    MUL r5, r3, r4
    ADD r6, r6, r5
    LDR r3, [r1,#4]!
    LDR r4, [r2,#8]!
    MUL r5, r3, r4
    ADD r6, r6, r5
    LDR r3, [r1,#4]!
    LDR r4, [r2,#8]!
    MUL r5, r3, r4
    ADD r10, r6, r5

    /*matrixC + matrixA mul matrixB */

    LDR r3, .matrixC

    @ r7 + C[1,1]
    MOV r2, #0
    LDR r2, [r3],#4
    ADD r7, r7, r2
    STR r7, [r0,#0]
    @ D[1,1] = r7

    @ r8 + C[1,2]
    MOV r2, #0
    LDR r2, [r3],#4
    ADD r8, r8, r2
    STR r8, [r0,#4]
    @D[1,2] = r8

    @ r9 + C[2,1]
    MOV r2, #0
    LDR r2, [r3],#4
    ADD r9, r9, r2
    STR r9, [r0,#8]
    @ D[2,1] = r9

    @ r10 + C[2,2]
    MOV r2, #0
    LDR r2, [r3],#4
    ADD r10, r10, r2
    STR r10, [r0,#12]
    @ D[2,2] = r10

    nop
    .end
