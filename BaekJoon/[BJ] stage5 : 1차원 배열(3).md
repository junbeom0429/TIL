### 알게된 부분
---
* 백준 제출 코드블럭에 rewind(stdin); 함수를 사용하니 틀렸다고 출력됨  
입력버퍼를 지우는게 아니라 입력커서를 맨 앞으로 옮기는 명령어라서 그런듯 함(아마도)  
  
>**중요한 점은 틀렸을 시 꼭 코드 문제가 아닐 수 있다는 점을 알게된 것**  
>컴파일러마다 조금씩 차이가 있을 수 있기에 코드가 문제없다고 생각되면  
>1. 입력 또는 출력의 케이스를 구분하여 반례를 찾는다.
>2. 코드 문제 외에 함수나 변수선언을 재확인 한다.  
   
* malloc: 초기화 없어서 memset()함수와 함께 사용해야함  
calloc: 자동으로 '0'으로 초기화 됨  
realloc: 값을 그대로 두고 메모리할당을 다시할 수 있음  
* #ifdefine, #endif <- 편리했음
* stage[i] == *(stage + 1)  

---
### 대표 문제
![image](/images/BJ_stage05_q07.png)
#### 작성 코드
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#define debugN

int main() {
	int numOfCase = 0;
	scanf("%d", &numOfCase);
	float* result = (float*)calloc(numOfCase, sizeof(float));

	for (int i = 0; i < numOfCase; i++) {
		int numOfStudent = 0;
		scanf("%d", &numOfStudent);
		float* score = (float *)calloc(numOfStudent, sizeof(float));

		float sum = 0;
		for (int j = 0; j < numOfStudent; j++) {
			scanf("%f", (score + j));
			sum += *(score + j);
#ifdef debug
			printf("score%d: %f\n", j, *(score + j));
			printf("sum: %f\n", sum);
#endif
		}
#ifdef debug
		for (int j = 0; j < numOfStudent; j++) {
			printf("score%d: %f\n", j, *(score + j));
		}
#endif
		float average = (float) sum / numOfStudent;
#ifdef debug
		printf("average: %f\n", average);
#endif

		int count = 0;
		for (int j = 0; j < numOfStudent; j++) {
			if (*(score + j) > average) {
				count++;
#ifdef debug
				printf("count: %d\n", count);
#endif
			}
#ifdef debug
			printf("j: %d\n", j);
#endif
		}
#ifdef debug
		printf("total count: %d\n", count);
#endif
		result[i] = (float) count / numOfStudent * 100;
#ifdef debug
		printf("result: %f\n", result[i]);
#endif
		free(score);
	}
	for (int k = 0; k < numOfCase; k++) {
		printf("%.3f%%\n", result[k]);
	}
}
```
---
![image](/images/BJ_stage05_03.png)
