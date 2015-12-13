# 組語作業七

呼叫 NumSort.s 於 call_numsort.c 以達成 sort 的功能。

# 如何實現

NumSort.s 是採用 Bubble sort 為基底，再 call_numsort 中呼叫 NumSort.s

```ARM
extern int NumSort(int,int*)
```

參數第一個是 array size 第二個是 array address
