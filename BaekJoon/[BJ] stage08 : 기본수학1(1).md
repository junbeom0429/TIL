![image](/images/BJ_stage08_01.png)
```c
#include <stdio.h>

int absolute (int a, int b) {
    int result = 0;
    result = a - b;
    if (result < 0) {
        result = -1 * result;
    }
    return result;
}

int main() {
    int fix = 0;
    int variable = 0;
    int price = 0;
    
    scanf("%d %d %d", &fix, &variable, &price);
    if (price <= variable) {
        printf("%d", -1);
    }
    else {
        int number = fix / absolute(price, variable);
        printf("%d", number + 1);
    }
}

```
