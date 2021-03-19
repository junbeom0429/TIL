![image](/images/BJ_stage08_01.png)
```c
//
//  main.c
//  BJ_stage08_01
//
//  Created by JB on 2021/03/19.
//

#include <stdio.h>
int abs(int a, int b) {
    int result = 0;
    result = a - b;
    if (result < 0) {
        result = -1 * result;
    }
    else {
        
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
        int number = fix / (price - variable);
    }
    
    
    
}
// 손익분기점이 존재하지 않는 경우
// price가 variable 보다 작거나 같을 경우
```
