## **4th week's team mission**
---
이번주 난관
---
char타입의 *(input + i)와 int타입의 i를 비교해서
동작되지 않는다는 내용을 찾는데
2시간 걸림;;

---
팀미션 내용
---
✔︎ 미션 1
1. 미션 제목
숫자 애너그램 찾기

2. 지시문
‘애너그램’이란 문자를 재배열하여 다른 뜻을 가진 단어로 바꾸는 것을 말합니다. 예를 들면 영어의 ‘tea’와 ‘eat’과 같이, 각 단어를 구성하는 알파벳의 구성은 같지만 뜻은 다른 두 단어를 말합니다. 우리말에는 ‘문전박대’와 ‘대박전문’과 같은 예를 들 수 있습니다. 우리는 문자 대신 숫자를 이용해서 애너그램을 찾는 프로그램을 만들어봅시다. 5자리의 숫자 1쌍이 입력으로 주어지며 애너그램일 경우에는 “True”를 아닐 경우에는 “False”를 출력하도록 합시다. 숫자를 입력받는 부분은 따로 구현하지 않고 프로그램 내부에 배열로 선언하는 것으로 가정하고, 숫자에는 중복이 있을 수 있습니다.

예)
입력값: 12345, 54321 -> 출력값: True
입력값: 14258, 25431 -> 출력값: False
입력값: 11132, 21131 -> 출력값: True

---
작성한 코드
---
```
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{
    char num[10] = { '0','1','2','3','4','5','6','7','8','9' };

    // 입력값 받아서 각 숫자별 몇개가 있는지 산출
    char input[100];
    printf("입력 : ");
    scanf("%s", input);

    int inputNumNums[10];
    int inputIncrement = 0;

    for (int i = 0; i < 10; i++) {
        inputIncrement = 0;
        for (int j = 0; j < strlen(input); j++) {
            if (*(input + j) == num[i]) {
                inputIncrement++;
            }
        }
        inputNumNums[i] = inputIncrement;
    }

    // 비굣값 받아서 각 숫자별 몇개가 있는지 산출
    char comparison[100];
    printf("비굣값 : ");
    scanf("%s", comparison);

    int comparNumNums[10];
    int comparIncrement = 0;

    for (int i = 0; i < 10; i++) {
        comparIncrement = 0;
        for (int j = 0; j < strlen(comparison); j++) {
            if (*(comparison + j) == num[i]) {
                comparIncrement++;
            }
        }
        comparNumNums[i] = comparIncrement;
    }
    
    // 입력값과 비굣값의 각 숫자별 몇개가 있는지 비교후 결과값 산출
    for (int i = 0; i < 10; i++) {
        if (inputNumNums[i] != comparNumNums[i]) {
            printf("false\n");
            break;
        }
        if (i == 9) {
            printf("true");
        }
    }
}

```
