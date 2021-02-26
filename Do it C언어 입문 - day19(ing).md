chap. 18 Struct
---
어려웠던 부분
---

---
문제
---
![image](/images/C_18_q4.jpg)

### 작성 코드
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

typedef struct node {
	char name[12];
	int kor;
	int eng;
	int math;
	int total;
	int rank;

	struct node* next;
} PERSON;

void getAndAppend(PERSON *head, int num) {
	PERSON* inform = (PERSON *)malloc(sizeof(PERSON));
	printf("%d 번째\n 학생 이름 : ", num);
	scanf("%s", &(inform->name));
	printf("국어 점수 : ");
	scanf("%d", &(inform->kor));
	printf("영어 점수 : ");
	scanf("%d", &(inform->eng));
	printf("수학 점수 : ");
	scanf("%d", &(inform->math));

	PERSON* temp = (PERSON*)malloc(sizeof(PERSON));
	temp = head;

	temp->next = inform;
}

int main() {
	PERSON *head = (PERSON*)malloc(sizeof(PERSON));
	head->next = NULL;

	int num = 0;

	getAndAppend(head, num);

	printf("%s", head->next->name);
}
```
