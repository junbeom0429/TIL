![image](/images/bjstage4_01.png)
![image](/images/bjstage4_02.png)

### 작성 코드
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	int input;
	int onesPlace;
	int tensPlace;
	int sum;
	int result = 101;
	int sumOnesPlace;
	int sumTensPlace;
	int count = 0;
	int inputTrue;
	scanf("%d", &input);
	inputTrue = input;

	while (inputTrue != result) {
		tensPlace = input / 10;
		onesPlace = input % 10;
		sum = tensPlace + onesPlace;
		sumTensPlace = sum / 10;
		sumOnesPlace = sum % 10;
		result = (onesPlace * 10) + sumOnesPlace;
		count = count + 1;
		input = result;
	}
	printf("%d", count);
}
```
