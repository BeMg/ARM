# HW6

使用 bubble sort 於 NumSort.s 並寫一個 hw6_test.s 測試正確性。

## HOW TO WORK

將預定的五個數字放在 .array 呼叫 NumSort 將其 sort
 由小到大, 最後 `MOV` 給 r8。

## HOW TO COMPILE

```linux
arm-elf-gcc -g hw6_test.s NumSort.s -o hw6.exe
```
