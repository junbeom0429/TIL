문제
---
![image](/images/BJ_stage5_q1.png)
---
### 처음 작성 코드
>insertionsort를 적용하면 O(n^2)가 되므로 시간초과 판정됨
>  

```c
#include <stdio.h>
#include <stdlib.h>

void insertionSort(int* arrr, int length) {
    for(int i = 1; i < length; i++) {
        int remember = arrr[i];
        int a = i - 1;
        while(arrr[a] >= 0 && arrr[a] > remember) {
            arrr[a + 1] = arrr[a];
            arrr[a] = remember;
            a = a - 1;
        }
    }
}

int main() {

    int lengthOfArr;
    scanf("%d", &lengthOfArr);
    int* arr = (int*)malloc(sizeof(int) * lengthOfArr);
    
    for(int i = 0; i < lengthOfArr; i++) {
        scanf("%d", &arr[i]);
    }
    
    insertionSort(arr, lengthOfArr);

    printf("%d %d", arr[0], arr[lengthOfArr - 1]);
  
    free(arr);
}
```
---
### 수정한 코드
>쉽게 구현할 수 있을 때는 쉽게 구현하는 것이 맞는 방법 같다:D
>  
```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int min = 0;
    int max = 0;
    int lengthOfArr;
    
    scanf("%d", &lengthOfArr);
    int* arr = (int*)malloc(sizeof(int) * lengthOfArr);
    
    for(int i = 0; i < lengthOfArr; i++) {
        scanf("%d", &arr[i]);
        if(i == 0) {
            max = arr[i];
            min = arr[i];
        }
        else {
            if(max < arr[i]) {
                max = arr[i];
            }
            if(min > arr[i]) {
                min = arr[i];
            }
        }
        
        
    }
    
    printf("%d %d", min, max);
    
    free(arr);
}
```
