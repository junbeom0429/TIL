![image](/images/BJ_stage08_02.png)
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	int input = 0;
	int result = 0;
	int i = 0;
	int compare = 1;

	scanf("%d", &input);

	while (1) {
		compare = compare + (6 * i);
		if (input <= compare) {
			result = i + 1;
			break;
		}
		i++;
	}

	printf("%d", result);
}
```
