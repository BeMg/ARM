# ARM HW9

##  INTRO

用 SSE 的 intrinsic functions 做下列的事情，愈多愈好。

1. 讀入 data.txt 的資料。

2. 對其進行計算，方法為針對每一行對各行(包括自己)內積，加起來後輸出至output.txt

## COMPILATION

```
gcc -msse2 hw9simd.c
```

##  HOW TO WORK

型態 `__m128d`

對齊 `__attribute__((aligned(64)))`

使用到的 intrinsic functions

1. `_mm_add_pd`

用於讓`__m128d`相加

2. `_mm_mul_pd`

用於讓`__m128d`相乘

## OUTPUT

基於減少誤差，輸出使用

```
printf("%.3lf")
```

## CPU

intel i5-4200H
