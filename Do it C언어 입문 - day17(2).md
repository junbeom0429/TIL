---
어려웠던 부분
---
* 왜 `free(p)`를 실행하면 할당되지 않은 메모리를 해제한다고 경고할까?
* 아래 코드에서 포인터의 자료형은 무엇으로 받아야하나?
```c
short *p;
printf("%hd", *(p + 0));
```

---
연습문제
---
>Q.5  
>short형 정수 값을 30개까지 저장할 수 있는 스택 자료 구조를 구현해 보세요.  
>이때 push와 pop 기능은 꼭 함수로 만들어서 사용해야 합니다.  
>[문제 원본](https://blog.naver.com/tipsware/220876184007)  

### 작성 코드
```c
#include <stdio.h>
#include <stdlib.h>

void makeArr(short **q, int n) {
    *q = (short *)malloc(sizeof(short) * n);
}

void initializeArr(short **w, int n) {
    for(int i = 0; i < n; i++) {
        *(w + i) = 0;
    }
}

void push(short **e, short v, int *ep, int max) {
        *(e + *ep) = (short *) v;
        *ep = *ep + 1;
}

short pop(short **r, int *ep) {
    if(*ep == 0) {
        printf("꺼낼 값이 없습니다\n\n");
    } else {
        *(r + *ep) = 0;
        *ep = *ep - 1;
    }
    return (short) *(r + *ep);
}

void showStack(short **t, int *ep) {
    int i = *ep - 1;
    for(; i >= 0; i--) {
        printf("[00%d] %hd\n", i, (short) *(t + i));
    }
    printf("\n");
}

int main() {
    short *p;
    int sizeOfStack;
    short value;
    int choice = 0;
    int endPoint = 0;
    printf("Stack 크기 : ");
    scanf("%d", &sizeOfStack);
    printf("\n");
    
    makeArr(&p, sizeOfStack);
    initializeArr(&p, sizeOfStack);
    
    while(choice != 9) {
        printf("1. Stack에 값 넣기\n");
        printf("2. Stack에서 값 꺼내기\n");
        printf("3. Stack에 저장된 값 확인\n");
        printf("9. 프로그램 종료\n\n");
        printf("원하시는 작업 번호를 선택하세요\n");
        printf("선택 : ");
        scanf("%d", &choice);
        printf("\n");
        
        switch(choice) {
            case 1:
                if(endPoint >= sizeOfStack) {
                    printf("저장할 공간이 없습니다\n\n");
                } else {
                    printf("저장할 값을 입력하세요 : ");
                    scanf("%hd", &value);
                    printf("\n");
                    push(&p, value, &endPoint, sizeOfStack);
                }
                break;
            case 2:
                printf("꺼낸 값 : %hd\n\n", pop(&p, &endPoint));
                break;
            case 3:
                showStack(&p, &endPoint);
                break;
            case 9:
                printf("프로그램을 종료합니다\n");
                break;
            default:
                printf("번호의 범위를 넘어섰습니다\n번호를 다시 입력해주세요\n\n");
        }
    }
    //free(p);
}
```
