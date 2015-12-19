.set SWI_Write, 0x5
.set SWI_Open, 0x1
.set SWI_Close, 0x2
.set AngelSWI, 0x123456

/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- a string "Hello ARM" --- */
filename:
	.ascii "sort_result.txt\000"

/* ========================= */
/*       TEXT section        */
/* ========================= */
    .section .text
    .global FileOutput
    .type FileOutput,%function

.open_param:
	.word filename
	.word 0x4
	.word 0x8
.write_param:
	.space 4   /* file descriptor */
	.space 4   /* address of the string */
	.space 4   /* length of the string */
.close_param:
	.space 4

FileOutput:
    MOV ip, sp
    STMFD sp!, {r4-r10, fp, ip, lr, pc}
    SUB fp, ip, #4

    MOV r4, r0 /*address of string*/
    MOV r5, r1 /*length of string*/

        /* open a file */
	MOV r0, #SWI_Open
	ADR r1, .open_param
	SWI AngelSWI
	MOV r2, r0                /* r2 is file descriptor */

        /* write "Hello ARM" to a file */
	ADR r1, .write_param
	STR r2, [r1, #0]          /* store file descriptor */

	STR r4, [r1, #4]          /* store the address of string */

	STR r5, [r1, #8]          /* store the length of the string */

	MOV r0, #SWI_Write
	SWI AngelSWI

	/* close a file */
	ADR r1, .close_param
	STR r2, [r1, #0]

	MOV r0, #SWI_Close
	SWI AngelSWI

    LDMEA fp, {r4-r10, fp, sp, pc}
    nop
    .end
