
.data
.align 4

    .size Aa, 5
Aa:
    .word 7
    .word 8
    .word 9
    .word 6
    .word 5

.section .text
.global main
.type main,%function

.array:
    .word Aa

main:
    MOV ip, sp
    STMFD sp!, {fp, ip, lr, pc}
    SUB fp, ip, #4

    LDR r2, .array /* array address */
    MOV r3, #5 /* array size */

    STR r2, [sp, #-4]! /* push array address */
    STR r3, [sp, #-4]! /* push array size */

    BL NumSort

    LDMEA fp, {fp, sp, pc}
    nop
    .end
