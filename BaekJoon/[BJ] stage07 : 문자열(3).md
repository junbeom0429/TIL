---
scanf() : 스페이스, 엔터로 입력 구분(스페이스 입력불가), 마지막 엔터 포함X  
fgets() : 엔터로 입력 구분(스페이스 입력가능), 마지막 엔터 포함O  
---
![image](/images/BJ_stage07_03.png)
```c
#define _CRT_SECURE_NO_WARNINGS
#define debugN
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
#ifdef debug
	while (1) {
#endif
		char* input = (char*)calloc(1000001, sizeof(char));
		int length = 0;
		int count = 0;


		fgets(input, 1000001, stdin);
		length = strlen(input);
#ifdef debug
		printf("%d\n", length);
#endif
		for (int i = 0; i < length; i++) {
			if (input[i] == ' ') {
				count++;
			}
		}

		if (input[0] == ' ') {
			count--;
		}
#ifdef debug
		else {
			printf("input[0] count-- error\n");
		}
#endif
		
		if (input[length - 2] == ' ') {
			count--;
		}
		
#ifdef debug
		else {
			printf("input[last] count-- error\n");
		}
#endif
		
		printf("%d\n", count + 1);

		free(input);
#ifdef debug
	}
#endif
}
```
