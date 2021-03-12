---
이중포인터 메모리 할당과 해제  
---

![image](/images/BJ_stage07_02.png)
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
	int times = 0;
	scanf("%d", &times);
	
	char** result = (char**)calloc(times, (sizeof(char*)));
	for (int i = 0; i < times; i++) {
		result[i] = (char*)calloc(160, (sizeof(char)));
	}

	for (int i = 0; i < times; i++) {
		int repeat = 0;
		char string[20] = { 0, };
		int count = 0;
		scanf("%d", &repeat);
		scanf("%s", &string);
		int strlength = strlen(string);

		for (int j = 0; j < strlength; j++) {
			for (int k = 0; k < repeat; k++) {
				result[i][count] = string[j];
				count++;
			}
		}
	}
	
	for (int i = 0; i < times; i++) {
		printf("%s\n", result[i]);
	}

	for (int i = 0; i < times; i++) {
		free(result[i]);
	}
	free(result);
}
```
