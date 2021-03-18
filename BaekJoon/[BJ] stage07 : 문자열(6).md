왜 오류가 나는가?????  

33번째줄 j++를 i++로 코딩했었음 :(
---
![image](/images/BJ_stage07_06.png)
```c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>

int main() {
    int iteration = 0;
    int result = 0;
    char input[101] = { 0, };
    char remember[26] = { 0, };

    scanf("%d", &iteration);

    for (int i = 0; i < iteration; i++) {
        for (int j = 0; j < 101; j++) {
            input[j] = '0';
        }
        for (int j = 0; j < 26; j++) {
            remember[j] = '0';
        }
        int awayFrom = 0;
        int rememberFlag = 0;
        int rememberNum = 0;
        
        scanf("%s", input);
        int length = (int)strlen(input);
        
        for (int j = 0; j < length; j++) {
            if (j == 0) {
                rememberFlag++;
            }
            else {
                for (int k = 0; k < 26; k++) {
                    if (input[j] == remember[k]) {
                        if (input[j] == input[j - 1]) {
                            rememberFlag = 0;
                            break;
                        }
                        else {
                            awayFrom++;
                            break;
                        }
                    }
                    else {
                        rememberFlag++;
                    }
                }
            }
            if (awayFrom > 0) {
                break;
            }
            if (rememberFlag != 0) {
                remember[rememberNum] = input[j];
                rememberNum++;
            }
        }
        if (awayFrom == 0) {
            result++;
        }
    }
    printf("%d", result);
}
```
