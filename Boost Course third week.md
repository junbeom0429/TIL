## Third week's team mission
---
이번주의 장벽
---
1. char* 동적할당
2. 지역변수를 꺼내서 활용하는 방법

두가지 이해하는데 오래걸렸음!

---
팀미션 내용
---
1. 미션 제목
    학점을 계산해보자!

2. 지시문
    - 학생의 점수로 학점을 구하는 프로그램을 작성하시오.
    - 키보드에서 입력받은 성적 (0 ~ 100 점) 의 유효성을 체크
    - 학점은 배열을 이용하여 초기화 (아래 “학점 테이블” 참조)
    - 학점은 “학점” 과 같이 계산하는데, 반드시 “학점 테이블”을 사용하여 계산하고 학점도 “학점 테이블”의 내용을 출력
    - 성적을 입력하여 계속 학점을 구하며 특별한 문자인 “999” 를 입력하면 프로그램을 종료

     Table 1 - 학점

     Table 2 - 학점 테이블

     유효성 체크: 0 <= 성적 <= 100
    - “120” 입력 -> 성적을 올바르게 입력하세요! (0 ~ 100)



```

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* calculateGrade(int inputScore, const int scores[], const char *grades[]);

int main(void) {
    const int scores[9] = {95, 90, 85, 80, 75, 70, 65, 60, 0};
    const char* grades[9] = {"A+", "A", "B+", "B ", "C+", "C ", "D+", "D ", "F "};
    
    while (1) {
        int inputScore = 0;
        printf ("성적을 입력하세요. (0 ~ 100)\n");
        scanf ("%i", &inputScore);
        
        if (inputScore == 999) {
            printf("학점 프로그램을 종료합니다.\n");
            break;
            
        } else if (inputScore <= 100 && inputScore >= 0) {
            printf("학점은 %s 입니다.\n", calculateGrade(inputScore, scores, grades));
            
        } else {
            printf("** %i 성적을 올바르게 입력하세요. 범위는 0 ~ 100 입니다.\n", inputScore);
           
        }
    }
}



char* calculateGrade(int inputScore, const int scores[], const char *grades[]) {
    char *grade;

    for (int i = 0; ; i++) {
        if (inputScore >= scores[i]) {
            grade = malloc(sizeof(char) * strlen(grades[i]));
            strcpy(grade, grades[i]);
            break;
            
        }
    }
    return grade;

}

```
