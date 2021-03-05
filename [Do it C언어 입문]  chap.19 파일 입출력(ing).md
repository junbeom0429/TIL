### 어려웠던 부분
---
* 지역변수(함수 포함) 안에의 malloc은 지역변수가 끝나는 순간  
없어지기에 free()할 필요가 없다!
* 연결리스트 free() 방법


---
![image](/images/C_19_q5.jpeg)  
---
### 작성 코드
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

void getAndAppend(PERSON* head, int* num) {
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
	tempHead = head;
	while (tempHead->next != NULL) {
		tempHead = tempHead->next;
	}
	tempHead->next = inform;

	*num = *num + 1;
}

void putRank(PERSON* head, int num) {
	int n = 1;
	for (int i = 1; i <= (num); i++) {
		if (i != num &&
			(calcAddress(head, i)->total) == (calcAddress(head, (i + 1))->total)) {
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

void printScores(PERSON* head, int num) {
	if (num == 0) {
		printf("\n성적 입력을 먼저 해주세요\n\n");
	}
	else if (num == 1) {
		printf("---------------------------------------\n");
		printf("   이름   국어  영어  수학  총점  등수\n");
		printf("---------------------------------------\n");
		printf(" %8s %4d  %4d  %4d  %4d   1등\n",
			calcAddress(head, 1)->name,
			calcAddress(head, 1)->kor,
			calcAddress(head, 1)->eng,
			calcAddress(head, 1)->math,
			calcAddress(head, 1)->total);

		printf("---------------------------------------\n");
	}
	else {
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

void printMenu(int* choice) {
	printf("---------------\n");
	printf("[Menu]\n");
	printf("1.성적 입력\n");
	printf("2.성적 확인\n");
	printf("3.종료\n");
	printf("---------------\n");
	printf("선택(1~3) : ");
	scanf("%d", choice);
	printf("---------------\n");
	rewind(stdin);
}

void saveData(PERSON* head) {
	PERSON* temp = (PERSON*)malloc(sizeof(PERSON));
	temp = head;

	FILE* data = fopen("data.dat", "ab+");
	if (NULL != data) {
		if (1 == fwrite(temp->next, sizeof(PERSON), 1, data)) {
			fclose(data);
		}
		else {
			printf("fwirte error");
		}
	}
	else {
		printf("fopen error");
	}	
}

void saveSortedData(PERSON* head) {
	PERSON* temp = (PERSON*)malloc(sizeof(PERSON));
	temp = head;

	FILE* data = fopen("data.dat", "wb+");
	if (NULL != data) {
		while (temp->next != NULL) {
			if (1 == fwrite(temp->next, sizeof(PERSON), 1, data)) {
				temp = temp->next;
			}
			else {
				printf("fwirte error");
			}
		}
		fclose(data);
	}
	else {
		printf("fopen error");
	}
}

void saveVariable(int num) {
	FILE* variable = fopen("variable.dat", "wb+");
	if (NULL != variable) {
		if (1 == fwrite(&num, sizeof(int), 1, variable)) {
			fclose(variable);
		}
		else {
			printf("fwirte error");
		}
	}
	else {
		printf("fopen error");
	}
}

void loadVariable(int* num) {
	FILE* variable = fopen("variable.dat", "ab+");
	if (NULL != variable) {
		fseek(variable, 0, SEEK_SET);
		if (1 == fread(num, sizeof(int), 1, variable)) {
			fclose(variable);
		}
		else {
			printf("fread error");
		}
	}
	else {
		printf("fopen error");
	}
}

void loadData(PERSON* head, int num) {
	if (num == 0) {
		
	}
	else {
		PERSON* temp = (PERSON*)malloc(sizeof(PERSON));
		temp = head;

		FILE* data = fopen("data.dat", "ab+");
		if (NULL != data) {
			fseek(data, 0, SEEK_SET);
			for (int i = 1; i <= num; i++) {
				PERSON* inform = (PERSON*)malloc(sizeof(PERSON));
				if (1 == fread(inform, sizeof(PERSON), 1, data)) {
					temp->next = inform;
					temp->next->next = NULL;
					temp = temp->next;
				}
				else {
					printf("fread error");
				}
			}
			fclose(data);
		}
		else {
			printf("fopen error");
		}
	}
}

int main() {
	int num = 0;
	int choice = 0;

	loadVariable(&num);
	PERSON* head = (PERSON*)malloc(sizeof(PERSON));
	head->next = NULL;

	loadData(head, num);

	while (1) {
		printMenu(&choice);

		if (choice == 3) {
			rewind(stdin);
			break;
		}
		else if (choice == 1) {
			rewind(stdin);
			getAndAppend(head, &num);
			saveVariable(num);
			saveData(head);
		}
		else if (choice == 2) {
			rewind(stdin);
			printScores(head, num);
			saveSortedData(head);
			choice = 0;
		}
		else {
			rewind(stdin);
			printf("\n다시 입력하세요\n\n");
			choice = 0;
		}
	}

	PERSON* freeTemp;
	while (head != NULL) {
		freeTemp = head->next;
		free(head);
		head = freeTemp;
	}
	freeTemp = NULL;
}
```
