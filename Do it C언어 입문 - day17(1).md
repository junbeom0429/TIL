chap. 17 다차원 포인터
---
어려웠던 부분
---
* scanf로 unsigned char 변수에 직접 정수를 받을 수 없다는 것을 몰라서 헤맴(이유는 아직도 모름)  
*  

---
문제
---
2차원 배열로 연령별 윗몸 일으키기 횟수 관리하기  

---
작성 코드
---
```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int ageGroup;
    int numOfPersons;
    int numOfSitUp;
    int temp = 0;
    
    // 연령층 입력
    printf("최고량자의 연령층이 50대라면 5를 입력하세요!\n");
    printf("최고령자의 연령층 : ");
    scanf("%d", &ageGroup);
    
    // 메모리 할당
    int **p = (int **)malloc(sizeof(int *) * ageGroup);
    float *average = (float *)malloc(sizeof(float) * ageGroup);
    
    // 인원수 입력
    for(int i = 0; i < ageGroup; i++) {
        printf("%d0대의 윗몸 일으키기 횟수\n", (i + 1));
        printf("이 연령대는 몇 명 입니까? : ");
        scanf("%d", (int *) &numOfPersons);
        
        *(p + i) = (int *)malloc(sizeof(int) * numOfPersons);
        
        // 각 인원별 윗몸일으키기 횟수 입력
        for(int j = 0; j < numOfPersons; j++) {
            printf("%dth : ", (j + 1));
            scanf("%d", &numOfSitUp);
            *(*(p + i) + j) = numOfSitUp;
        }
        
        // 연령층별 평균값 산출
        for(int k = 0; k < numOfPersons; k++) {
            temp = temp + *(*(p + i) + k);
        }
        if(numOfPersons == 0) {
            *(average + i) = 0;
        } else {
        *(average + i) = (float) temp / numOfPersons;
        }
        temp = 0;
        
        // 메모리 해제
        for(int i = 0; i < numOfPersons; i++) {
            free(*(p + i));
        }
    }
    // 평균값 출력
    printf("연령별 평균 윗몸 일으키기 횟수\n");
    for(int l = 0; l < ageGroup; l++) {
    printf("%d0대 : %6.2f\n", (l + 1), *(average + l));        
    }
    
    // 메모리 해제
    free(p);
    free(average);
}

```
