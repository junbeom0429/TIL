![image](/images/BJ_stage07_q2.jpg)
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
	int length = 0;
	int result = 0;

	scanf("%d", &length);

	char* string = (char*)calloc((length + 1), sizeof(char));
	scanf("%s", string);

	for (int i = 0; i < length; i++) {
		if (string[i] == '0') {
			result += 0;
		}
		else if (string[i] == '1') {
			result += 1;
		}
		else if (string[i] == '2') {
			result += 2;
		}
		else if (string[i] == '3') {
			result += 3;
		}
		else if (string[i] == '4') {
			result += 4;
		}
		else if (string[i] == '5') {
			result += 5;
		}
		else if (string[i] == '6') {
			result += 6;
		}
		else if (string[i] == '7') {
			result += 7;
		}
		else if (string[i] == '8') {
			result += 8;
		}
		else if (string[i] == '9') {
			result += 9;
		}
	}

	printf("%d", result);
}
```
