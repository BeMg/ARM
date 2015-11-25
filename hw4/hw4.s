        .section .text
        .global main
        .type main,%function

main:
        @r0,r1 init
        MOV r0 , #13
        MOV r1 , #17
        @loop begin
loop:
        @check r0,r1 result is r0 - r1
        CMP r0,r1
        @ if r0 - r1 is minus jump to sub
        BMI SUB
        @ r0 > r1
        SUB r0 , r0 , r1
        B CHECK
        @ r0 < r1
SUB:
        SUB r1 , r1 , r0
        @check r0 == r1 if not loop again
CHECK:
        CMP r0 , r1
        BNE loop
        nop
        .end
