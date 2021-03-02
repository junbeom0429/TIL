![image](/images/C_19_q5.jpeg)  
---
### 작성 코드
```c

```
---
### chap.18 성적 입력 프로그램 코드
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>

typedef struct node {
	char name[9];
	int kor;
	int eng;
	int math;
	int total;
	int rank;
	struct node* next;
} PERSON;

PERSON* calcAddress(PERSON* head, int num) {
	PERSON* temp = (PERSON*)malloc(sizeof(PERSON));
	
	temp = head;
	for (int i = 0; i < num; i++) {
		temp = temp->next;
	}
	return temp;
}

void getAndAppend(PERSON* head, PERSON** tail, int *num) {
	PERSON* inform = (PERSON*)malloc(sizeof(PERSON));
	
	while (1) {
		printf("%d 번째\n학생 이름 : ", (*num + 1));
		if (scanf_s("%s", inform->name, (sizeof(inform->name))) == 0) {
			rewind(stdin);
			printf("다시 입력하세요\n");
		}
		else {
			rewind(stdin);
			break;
		}
	}
	while (1) {
		printf("국어 점수 : ");
		scanf("%d", &(inform->kor));
		if (inform->kor >= 0 && inform->kor <= 100) {
			rewind(stdin);
			break;
		}
		else {
			rewind(stdin);
			printf("다시 입력하세요\n");
		}
	}
	while (1) {
		printf("영어 점수 : ");
		scanf("%d", &(inform->eng));
		if (inform->kor >= 0 && inform->kor <= 100) {
			rewind(stdin);
			break;
		}
		else {
			rewind(stdin);
			printf("다시 입력하세요\n");
		}
	}
	while (1) {
		printf("수학 점수 : ");
		scanf("%d", &(inform->math));
		if (inform->kor >= 0 && inform->kor <= 100) {
			rewind(stdin);
			break;
		}
		else {
			rewind(stdin);
			printf("다시 입력하세요\n");
		}
	}
	printf("---------------\n");

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
	for (int i = 1; i <= (num); i++) {
		if (i != num &&
			(calcAddress(head, i)->total) == (calcAddress(head, (i + 1))->total)) {
			(calcAddress(head, i)->rank) = n;
		}
		else {
			(calcAddress(head, i )->rank) = n;
			n = n + 1;
		}
	}
}

void insertionSort(PERSON* head, int num) {
	PERSON* rememberI = (PERSON*)malloc(sizeof(PERSON));
	PERSON* rememberJ = (PERSON*)malloc(sizeof(PERSON));
	
	for (int i = 2; i <= num; i++) {
		rememberI->next = calcAddress(head, i);
		for (int j = (i - 1); j > 0; j--) {
			if ((rememberI->next->total) > (calcAddress(head, j)->total)) {
				calcAddress(head, j)->next = calcAddress(head, (j + 1))->next;
				rememberI->next->next = calcAddress(head, j);
				calcAddress(head, (j - 1))->next = rememberI->next;
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
		printf("---------------\n");

		if (choice == 3) {
			rewind(stdin);
			break;
		}
		else if (choice == 1) {
			rewind(stdin);
			getAndAppend(head, &tail, &num);
		}
		else if (choice == 2) {
			rewind(stdin);
			if (num == 0) {
				printf("\n성적 입력을 먼저 해주세요\n\n");
				choice = 0;
			}
			else if (num == 1) {
				printf("---------------------------------------\n");
				printf("   이름   국어  영어  수학  총점  등수\n");
				printf("---------------------------------------\n");

				for (int i = 1; i <= num; i++) {
					printf(" %8s %4d  %4d  %4d  %4d   1등\n",
						calcAddress(head, i)->name,
						calcAddress(head, i)->kor,
						calcAddress(head, i)->eng,
						calcAddress(head, i)->math,
						calcAddress(head, i)->total);
				}
				printf("---------------------------------------\n");
			}
			else if (num >= 2) {
				insertionSort(head, num);
				putRank(head, num);
				
				printf("---------------------------------------\n");
				printf("   이름   국어  영어  수학  총점  등수\n");
				printf("---------------------------------------\n");

				for (int i = 1; i <= num; i++) {
					printf(" %8s %4d  %4d  %4d  %4d  %2d등\n",
						calcAddress(head, i)->name,
						calcAddress(head, i)->kor,
						calcAddress(head, i)->eng,
						calcAddress(head, i)->math,
						calcAddress(head, i)->total,
						calcAddress(head, i)->rank);
				}
				printf("---------------------------------------\n");
			}
		}
		else {
			rewind(stdin);
			printf("\n다시 입력하세요\n\n");
			choice = 0;
		}
	}
}
```
