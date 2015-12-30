# ARM HW8

## INTRO

在 NumSort 中呼叫 malloc，再由 Output 將排序完的陣列輸入到檔案中。

## COMPILE

```shell
arm-elf-gcc -g call_numsort.c Numsort.s output.s -o a.out
```

## HOW TO WORK

延續前兩次作業，僅僅做了一些更動，像是用malloc取代宣告的部份，output的部份也遵守寫檔的規範。
