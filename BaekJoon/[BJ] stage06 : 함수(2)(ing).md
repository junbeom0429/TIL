![image](/images/BJ_stage06_q3.jpg)
```c
#include <stdio.h>
#include <stdlib.h>

int calcDigits(int input) {
	int n = 10;
	int digits = 1;
	while (1) {
		if (input < n) {
			break;
		}
		else {
			n * 10;
			digits++;
		}
	}
	return digits;
}

int han(int input) {
	int digits = calcDigits(input);
	int* places = (int*)calloc(digits, sizeof(int));

	for (int i = 1; i <= digits; i++) {

	}
}

int main() {
	int input = 0;
	scanf("%d", &input);

	printf("%d", han(input));
}
```
