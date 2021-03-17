왜 오류가 나는가?????
---
![image](images/BJ_stage07_06.png)
```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main() {
    int iteration = 0;
    int result = 0;
    scanf("%d", &iteration);
    
    for (int i = 0; i < iteration; i++) {
        char input[101] = { 0,};
        for(int j = 0; j < 100; j++) {
            input[j] = '0';
        }
        
        scanf("%s", input);
//        printf("%c", input[0]);
        int length = (int)strlen(input);
        int awayFrom = 0;
        int rememberFlag = 0;
//        int rememberNum = 0;
        char remember[26] = { 0,};
        for(int j = 0; j < 26; j++) {
            remember[j] = '0';
        }
        
        for (int j = 0; j < length; i++) {
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
                remember[0] = input[j];
                //rememberNum++;
            }
        }
        if (awayFrom == 0) {
            result++;
        }
        
    }
    printf("%d", result);
}

```
