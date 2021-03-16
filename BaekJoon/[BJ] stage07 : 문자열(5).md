![image01](/images/BJ_stage07_05_01.png)
![image02](/images/BJ_stage07_05_02.png)
```c
#include <stdio.h>
#include <string.h>

int main() {
    char input[101] = { 0,};
    int counter = 0;
    
    scanf("%s", input);
    int length = (int)strlen(input);
    
    for (int i = (length - 1); i >= 0; i--) {
        if (input[i] == '=') {
            if ((i >= 2) && (input[i - 1]) == 'z' && input[i - 2] == 'd') {
                i = i - 2;
                counter++;
            }
            else if ((i >= 1) && ((input[i - 1] == 'c') || (input[i - 1] == 's') || (input[i - 1] == 'z'))) {
                i--;
                counter++;
            }
            else {
                
            }
        }
        else if (input[i] == '-') {
            if ((i >= 1) && ((input[i - 1] == 'c' || input[i - 1] == 'd'))) {
                i--;
                counter++;
            }
            else {
                
            }
        }
        else if (input[i] == 'j') {
            if ((i >= 1) && ((input[i - 1] == 'l' || input[i - 1] == 'n'))) {
                i--;
                counter++;
            }
            else {
                counter++;
            }
        }
        else {
            counter++;
        }
    }
    printf("%d", counter);
}
```
