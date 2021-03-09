chap. 16 메모리 할당
---
어려웠던 부분
---
```
char *******p;
*(p + i) == 6차원

char **p;
*(p + i) == 1차원
```

---
연습문제
---
Q6
아래는 3차원 배열이다.  
포인터를 사용하여 3차원 포인터와 malloc함수를 사용하여
메모리를 할당하도록 코드를 구성하세요.
```c
char p[1][2][3];
```

### 작성코드
```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    char ***p = (char ***)malloc(sizeof(char **) * 2);
    
    for(int i = 0; i < 2; i++) {
        *(p + i) = (char**)malloc(sizeof(char *) * 3);        
        for(int j = 0; j < 3; i++) {
            *(*(p + i) + j) = (char *)malloc(sizeof(char) * 4);
        }
    }
    
    for(int i = 0; i < 2; i++) {
        for(int j =0; j < 3; j++) {
            free(*(*(p + i) + j));
        }
        free(*(p + i));
    }
    free(p);
}
```
