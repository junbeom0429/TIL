---
재귀함수를 통한 power()함수 구성
---
![image](/images/BJ_stage07_04.png)
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int power(int target, int times) {
	if (times == 0) {
		return 1;
	}
	return target * power(target, times - 1);
}

void change(char* input) {
	char temp = input[0];
	input[0] = input[2];
	input[2] = temp;
}

int makeInt(char* input) {
	int result = 0;
	char numbers[9] = { '1','2','3','4','5','6','7','8','9' };
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 9; j++) {
			if (input[i] == numbers[j]) {
				result = result + ((j + 1) * (100 / power(10, i)));
				break;
			}
		}
	}
	return result;
}

int compare(int a, int b) {
	if (a >= b) {
		return a;
	}
	else {
		return b;
	}
}

int main() {
	char first[4] = { 0, };
	char second[4] = { 0, };
	int convertedFirst = 0;
	int convertedSecond = 0;

	scanf("%s", first);
	scanf("%s", second);
	change(first);
	change(second);
	convertedFirst = makeInt(first);
	convertedSecond = makeInt(second);
	
	printf("%d\n", compare(convertedFirst, convertedSecond));
}
```
