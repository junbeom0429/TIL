chap. 18 Struct
---
어려웠던 부분
---
* 구조체의 순서 바꾸기  
---
문제
---
![image](/images/C_18_q4.jpg)

### 작성 코드 (2/27)
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>

typedef struct node {
	char name[12];
	int kor;
	int eng;
	int math;
	int total;
	int rank;
	int num;

	struct node* next;
} PERSON;

struct node* calcAddress(PERSON* head, int num) {
	PERSON* temp = (PERSON*)malloc(sizeof(PERSON));
	temp = head;
	for (int i = 0; i < num; i++) {
		temp = temp->next;
	}
	return temp;
}

void getAndAppend(PERSON* head, PERSON** tail, int *num) {
	PERSON* inform = (PERSON*)malloc(sizeof(PERSON));
	printf("%d 번째\n학생 이름 : ", (*num + 1));
	scanf("%s", &(inform->name));
	printf("국어 점수 : ");
	scanf("%d", &(inform->kor));
	printf("영어 점수 : ");
	scanf("%d", &(inform->eng));
	printf("수학 점수 : ");
	scanf("%d", &(inform->math));
	printf("---------------\n");
	inform->num = *num;
	inform->total = (inform->kor + inform->eng + inform->math);
	inform->next = NULL;

	PERSON* tempHead = (PERSON*)malloc(sizeof(PERSON));
	tempHead = (*tail)->next;
	tempHead->next = inform;
	(*tail)->next = tempHead->next;

	*num = *num + 1;
}
void putRank(PERSON *head, int num) {
	int n = 1;
	for (int i = 1; i <= num; i++) {
		if ((calcAddress(head, i)->total) == (calcAddress(head, (i + 1))->total)) {
			(calcAddress(head, i)->rank) = n;
		}
		else {
			(calcAddress(head, i)->rank) = n;
			n = n + 1;
		}
	}
}

void insertionSort(PERSON* head, int num) {
	PERSON* rememberI = (PERSON*)malloc(sizeof(PERSON));
	PERSON* rememberJ = (PERSON*)malloc(sizeof(PERSON));

	for (int i = 2; i <= num; i++) {
		for (int j = (i - 1); j > 0; j--) {
			if ((calcAddress(head, i)->total) < (calcAddress(head, j)->total)) {
				
				rememberI->next = calcAddress(head, i);
				rememberJ->next = calcAddress(head, j);

				calcAddress(head, j)->next = calcAddress(head, i)->next;
				calcAddress(head, (j - 1))->next = rememberI->next;
				calcAddress(head, j)->next = rememberJ->next;		
			}
		}
	}
}



int main() {
	PERSON* head = (PERSON*)malloc(sizeof(PERSON));
	head->next = NULL;
	PERSON* tail = (PERSON*)malloc(sizeof(PERSON));
	tail->next = head;

	int num = 0;
	int choice;



	while (1) {
		printf("---------------\n");
		printf("[Menu]\n");
		printf("1.성적 입력\n");
		printf("2.성적 확인\n");
		printf("3.종료\n");
		printf("---------------\n");
		printf("선택(1~3) : ");
		scanf("%d", &choice);
		//printf("---------------\n");

		if (choice == 3) {
			break;
		}
		else if (choice == 1) {
			getAndAppend(head, &tail, &num);
		}
		else if (choice == 2) {
			if (num == 0) {
				printf("성적 입력을 먼저 해주세요\n\n");
			}
			else if (num == 1) {
				printf("--------------------------------\n");
				printf(" 이름  국어 영어 수학 총점 등수\n");
				printf("--------------------------------\n");

				for (int i = 1; i <= num; i++) {
					printf(" %5s  %3d %3d %3d %3d 1등\n",
						calcAddress(head, i)->name,
						calcAddress(head, i)->kor,
						calcAddress(head, i)->eng,
						calcAddress(head, i)->math,
						calcAddress(head, i)->total);
				}
			}
			else if (num >= 2) {
				insertionSort(head, num);
				/*
				for (int i = 1; i <= num; i++) {
					printf(" %5s  %3d %3d %3d %3d %2d등\n",
						calcAddress(head, i)->name,
						calcAddress(head, i)->kor,
						calcAddress(head, i)->eng,
						calcAddress(head, i)->math,
						calcAddress(head, i)->total,
						calcAddress(head, i)->rank);
				}
				*/
				putRank(head, num);

				printf("--------------------------------\n");
				printf(" 이름  국어 영어 수학 총점 등수\n");
				printf("--------------------------------\n");

				for (int i = 1; i <= num; i++) {
					printf(" %5s  %3d %3d %3d %3d %2d등\n",
						calcAddress(head, i)->name,
						calcAddress(head, i)->kor,
						calcAddress(head, i)->eng,
						calcAddress(head, i)->math,
						calcAddress(head, i)->total,
						calcAddress(head, i)->rank);
				}
			}
			
		}
		else {
			printf("다시 입력하세요\n");
			printf("---------------\n");
		}
	}
	/*	PERSON* temp = (PERSON*)malloc(sizeof(PERSON));
			temp = head;
			while (temp->next != NULL) {
				printf("%d", temp->next->eng);
				temp = temp->next;
			}
	*/
}
```
