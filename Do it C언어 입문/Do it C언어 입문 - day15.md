chap. 14 표준 입력 함수
---
---
어려웠던 부분
---
Q.4
합병병렬 써보려했으나 어려워서 삽입정렬 선택  
정렬 알고리즘 공부가 필요하다!

등수로 정렬하여 출력하는데  
모든 배열을 바꾸지 않고 출력하기위해  
connect배열을 만들어서 몇번째 학생이 몇등인지 연결지어 표현함  
이 부분이 효율적인것인지 다른방법은 없는 것인지 궁금!  

---
연습문제
---
Q.1
```c
/*
사용자에게 세 개의 정수 값을 입력 받아서
평균 값을 출력하는 프로그램을 작성하세요
*/

#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	int a, b, c;
	float result;
	scanf("%d %d %d", &a, &b, &c);
	result = (float) (a + b + c) / 3;
	printf("%.1f", result);
}
```

Q.2
```c
/*
사용자에게 두 개의 문자열을 압력 받은 후에 strcat 함수를 사용하여
두 문자열을 합칩니다. 그리고 합친 문자열을 출력하는 프로그램을 작성하세요.
문자열 입력은 fgets 함수를 사용하세요.
문자열 중간에 enter가 포함되서는 안 됩니다.
*/

#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>

int main() {
	char first[4], second[4];
	char result[7];
	fgets(first, 4, stdin);
	rewind(stdin);
	fgets(second, 4, stdin);
	rewind(stdin);
	//printf("%s\n", first);
	//printf("%s\n", second);
	strcpy(result, first);
	strcat(result, second);
	printf("%s", result);
}
```

Q.3
```c
/*
사용자가 "kim 80.1 186.5 A 105"라고 입력하면 "이름: kim, 몸무게: 80.1kg,
키: 186.5cm, 혈액형 A형, 심박수: 105회"를 출력하도록 작성하세요.
입력은 scanf 함수, 출력은 printf 함수를 사용하세요.
*/

#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	char name[6] = { 0, }, blood = 0;
	float weight = 0, tall = 0;
	int heartRate = 0;

	scanf("%s %f %f %c %d", name, &weight, &tall, &blood, &heartRate);
	printf("이름: %s, 몸무게: %.1f kg, 키: %.1f cm, 혈액형 %c형, 심박수: %d회", name, weight, tall, blood, heartRate);
}
```

Q.4
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>

int main() {
	const int numOfSubject = 3;
	const int numOfStudent = 3;
	char nameOfStudent[3][10] = { 0, };
	int koreanScore[3], englishScore[3], mathScore[3];
	int totalScore[3], totalScoreCopy[3];
	float average[3] = { 0, };
	int rank[3] = { 0, }, connect[3] = { 0, };
	
	// 이름, 국어, 영어, 수학 점수 입력
	for(int i = 0; i < numOfStudent; i++) {
		printf("%d 번째 학생 이름: ", (i + 1));
		scanf("%s", &nameOfStudent[i]);	
		printf("국어 점수: ");
		scanf("%d", &koreanScore[i]);
		printf("영어 점수: ");
		scanf("%d", &englishScore[i]);
		printf("수학 점수: ");
		scanf("%d", &mathScore[i]);
		printf("\n");
	}

	// 총점 산출
	for (int i = 0; i < numOfStudent; i++) {
		totalScore[i] = koreanScore[i] + englishScore[i] + mathScore[i];
		totalScoreCopy[i] = totalScore[i];
	}		

	// 평균 산출
	for (int i = 0; i < numOfStudent; i++) {
		average[i] = (float)totalScore[i] / numOfSubject;
	}

	// 총점 정렬 (insertion_sort)
	for (int i = 1; i < numOfStudent; i++) {
		int remember = totalScoreCopy[i];

		for (int j = (i - 1); j >= 0; j--) {
			if (remember < totalScoreCopy[j]) {
				totalScoreCopy[j + 1] = totalScoreCopy[j];
				totalScoreCopy[j] = remember;
			}
			else {
				break;
			}
		}
	}
				
	// 등수 순서에 따라 출력하기위한 connect값 산출
	for (int i = 0; i < numOfStudent; i++) {
		for (int j = 0; j < numOfStudent; j++ ) {
			if (totalScoreCopy[i] == totalScore[j]) {
				rank[j] = (numOfStudent - i);
				connect[numOfStudent - 1 - i] = j;
			}
		}
	}

	// 결과 출력
	printf("-----------------------------------------\n");
	printf("   이름   국어 영어 수학 총점  평균 등수 \n");
	printf("-----------------------------------------\n");

	for (int i = 0; i < numOfStudent; i++) {
		printf("  %s", nameOfStudent[connect[i]]);
		printf("  %3d", koreanScore[connect[i]]);
		printf("  %3d", englishScore[connect[i]]);
		printf("  %3d", mathScore[connect[i]]);
		printf("  %3d", totalScore[connect[i]]);
		printf("  %5.1f", average[connect[i]]);
		printf("  %2d", rank[connect[i]]);
		printf("\n");
	}
}
```
