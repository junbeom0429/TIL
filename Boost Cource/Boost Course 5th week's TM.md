## Boost Course 5th week's team mission
---
이번주 난관
---
1. 함수의 인수를 포인터값으로 받는 방법
2. i, j 숫자 계산;;

---
팀미션 내용
---
✔︎ 미션 3.

1. 미션 제목
정렬을 해보자

2. 지시문
여러분은 데이터를 정리하기 위해서 엑셀을 많이 사용하실 것입니다.
게다가, 데이터들을 보기 좋게 하기 위해서 정렬 기능을 많이 사용하실 텐데 간단한 버블 정렬 코드를 배열이 아닌 포인터를 활용하여 완성해 보세요.

---
작성 코드 
---
```c
#include <stdio.h>

int sort(int numOfArr, int *p);
int swap(int *pa, int *pb);

int main()
{
    int n = 7;
    int arr[7] = { 0, 25, 10, 17, 6, 12, 9 };
    sort(n, arr);
    for (int i = 0; i < n; i++)
    {
        printf("%d ", arr[i]);
    }
    return 0;
}

int sort(int numOfArr, int *p)
{
    for (int i = 0; i < (numOfArr - 1); i++)
    {
        for (int j = 0; j < (numOfArr - i - 1); j++)
        {
            if (*(p + j) > *(p + (j + 1)))
            {
                swap((p + j), (p + (j + 1)));
            }
        }
    }
}

int swap(int *pa, int *pb)
{
    int temp;
    temp = *pa;
    *pa = *pb;
    *pb = temp;
}
```
