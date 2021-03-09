배열로 사용시 스택이 초과되어    
malloc을 통해 힙에 생성
```c
#include <stdio.h>
#include <stdlib.h>

void generator(int* result) {
    for (int i = 0; i < 10000; i++) {
        int temp = 0;
        int onesPlace = 0;
        int tensPlace = 0;
        int hundredsPlace = 0;
        int thousandsPlace = 0;

        if (i < 10) {
            temp = i + i;
        }
        else if (i < 100) {
            tensPlace = i / 10;
            onesPlace = i % 10;
            temp = i + tensPlace + onesPlace;
        }
        else if (i < 1000) {
            hundredsPlace = i / 100;
            tensPlace = (i % 100) / 10;
            onesPlace = i % 10;
            temp = i + hundredsPlace + tensPlace + onesPlace;
        }
        else if (i < 10000) {
            thousandsPlace = i / 1000;
            hundredsPlace = (i % 1000) / 100;
            tensPlace = (i % 100) / 10;
            onesPlace = i % 10;
            temp = i + thousandsPlace + hundredsPlace + tensPlace + onesPlace;
        }
        else {
            printf("error\n");
            break;
        }

        if (temp <= 10000) {
            result[temp] = 0;
        }
    }
}

int main() {
    int* result = (int*)calloc(10000, sizeof(int));

    generator(result);

    for (int i = 0; i < 10000; i++) {
        if (result[i] != 0) {
            printf("%d\n", result[i]);
        }
    }

    free(result);
}
```
