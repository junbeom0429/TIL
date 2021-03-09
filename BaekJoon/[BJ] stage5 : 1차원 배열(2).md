### 6번 문제 고전중
![image](/images/BJ_stage05_q6.png)
### 현재 코드
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
	int numOfTest = 0;
	int count = 0;

	scanf("%d", &numOfTest);

	char* test = (char*)malloc(sizeof(char[80]) * numOfTest);
	int* result = (int*)malloc(sizeof(int) * numOfTest);
	memset(test, 0, sizeof(char[80]) * numOfTest);
	memset(result, 0, sizeof(int) * numOfTest);

	for (int i = 0; i < numOfTest; i++) {
		scanf("%s", &test[i]);
	}

	for (int i = 0; i < numOfTest; i++) {
		count = 0;
		for (int j = 0; test[j] != '0'; j++) {
			if (test[j] == 'O') {
				count++;
				result[i] = result[i] + count;
			}
			else if (test[j] == 'X') {
				count = 0;
			}
		}
	}

	for (int i = 0; i < numOfTest; i++) {
		printf("%d\n", result[i]);
	}
}
```
![image](/images/BJ_stage05_02.png)
