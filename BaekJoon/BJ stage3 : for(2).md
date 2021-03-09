어려웠던 부분
---
* `scanf` 엔터뿐만 아니라 스페이스를 입력해도 입력값 받아짐!

---
대표 문제
---
![imange](/images/bjStage3q.png)  

### 작성코드
```c
include <stdio.h>

int main() {
    int a;
    int b;
    int n = 0;
    int arr[10000];
    int brr[10000];
    scanf("%d %d", &a, &b);
    for(int i = 0; i < a; i++) {
         scanf("%d", &arr[i]);
    }
    for(int i = 0; i < a; i++) {        
        if (arr[i] < b) {
            brr[n] = arr[i];
            n++;
        }
    }
    for(int i = 0; i < n; i++) {
        printf("%d ", brr[i]);
    }               
}
```
---
![imange](/images/bjStage3.png)
