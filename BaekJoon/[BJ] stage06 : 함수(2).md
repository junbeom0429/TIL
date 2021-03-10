![image](/images/BJ_stage06_q3.jpg)
```c
#define _CRT_SECURE_NO_WARNINGS
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
			n = n * 10;
			digits++;
		}
	}
	return digits;
}

void calcPlaces(int input, int* places, int digits) {
	int n = 1;

	for (int i = 0; i < digits; i++) {
		places[i] = (input % (n * 10)) / n;
		n = n * 10;
	}
}

void calcDifference(int* places, int* difference, int digits) {
	if (digits != 1) {
		for (int i = 0; i < (digits - 1); i++) {
			difference[i] = places[i + 1] - places[i];
		}
	}
}

int calcHan(int input, int* difference, int digits) {
	int temp = 1;

	if (input < 100) {
		return 1;
	}
	else {
		for (int i = 0; i < (digits - 2); i++) {
			if (difference[i] != difference[i + 1]) {
				temp = 0;
				break;
			}
		}
		return temp;
	}
}


int main() {
	int result = 0;
	int input = 0;
	scanf("%d", &input);

	if (input < 100) {
		result = input;
		printf("%d", result);
	}
	else {
		for (int i = 100; i <= input; i++) {
			int digits = calcDigits(i);
			int* places = (int*)calloc(digits, sizeof(int));
			int* difference = (int*)calloc(digits, sizeof(int));
			calcPlaces(i, places, digits);
			calcDifference(places, difference, digits);
			result = result + calcHan(i, difference, digits);
			free(places);
			free(difference);
		}

		printf("%d", (result + 99));
	}
}
```
