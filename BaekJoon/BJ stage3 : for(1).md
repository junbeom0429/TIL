어려웠던 부분
---
동적할당 개념  
동적할당 할때 무조건 포인터변수에만 할당할 수 있는지 궁금

---
문제
---
![bj_stage3_for](/images/bj_stage3_for.png)

---
작성 코드
---
```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int a;
    scanf("%d", &a);
    
    int *first, *second;
    first = (int *)malloc(sizeof(int) * a);
    second = (int *)malloc(sizeof(int) * a);
    
    for(int i = 0; i < a; i++) {
        scanf("%d %d", (first + i), (second + i));
    }
    for(int i = 0; i < a; i++) {
        printf("%d\n", (*(first + i) + *(second + i)));
        //printf("\n");
    }
    free(first);
    free(second);
}
```
