## **4th week's team mission**
---
이번주 난관
---
어찌저찌 동작은 가능하게 만들었으나  
함수를 더 세분화하지 못했고
시간이 너무 많이 걸렸다. 한 5시간?

---
팀미션 내용
---
미션 4
1. 미션 제목
가장 큰 낙하거리 찾기

2. 지시문
상자들이 쌓여있는 방이 있습니다. 방이 오른쪽으로 90도 회전하여 상자들이 중력의 영향을 받아 낙하한다고 할 때, 낙하거리가 가장 큰 상자를 구하여 그 낙하거리를 출력하는 프로그램을 작성해 봅시다.
아래 그림에서 총 26개 상자가 회전 후, 오른쪽 그림과 같은 상태가 됩니다. A상자의 낙하거리가 7로 가장 크므로 7을 출력하면 됩니다. 회전 결과, B 상자의 낙하거리는 6이고, C상자의 낙하거리는 1입니다.
![그림](/images/mission4.png)  
중력은 회전이 완료된 이후에 적용되며, 상자들은 모두 한쪽 벽면에 붙여진 상태로 쌓여 2차원의 형태를 이루며 벽에서 떨어져서 쌓인 상자는 없습니다.
입력으로는 첫 줄에 각 방의 가로 길이 N(2 ≤ N ≤ 100)과 방의 세로 길이 M(2 ≤ N ≤ 100)이 주어지며, 다음 줄에는 N개의 상자들이 쌓여있는 높이 H(0 ≤ H ≤ M)가 주어집니다.
가장 직관적인 방법은 MxN내의 모든 box에 대해서 낙하거리를 계산한 뒤 정렬 알고리즘을 사용하여 최댓값을 찾으면 되는 문제라고 생각할 수 있습니다. 이 방법은 시간 복잡도(Big O)가 얼마나 될 지 먼저 생각해봅시다.
그리고, 이보다 더 효율적인 방법으로 프로그램을 작성해봅시다. 완전한 프로그램을 작성하는 것이 힘들 경우에는 pseudo code로 작성해도 좋습니다.
다만 이 경우에는 최대한 자세히 적어야 합니다. 숫자를 입력받는 부분은 따로 구현하지 않고 프로그램 내부에서 따로 선언하는 것으로 가정합니다.

예)  
입력값: 9 8 // 방의 가로 길이 N, 세로 길이 M  
7 4 2 0 0 6 0 7 0 // 상자들이 쌓여있는 높이  
출력값: 7 // 가장 큰 낙하거리 

---
작성한 코드
---
```

#include <stdio.h>

int fallingHeight(int maxXaxis, int x);

int main()
{
    // 변수 선언
    int maxXaxis = 0;
    int maxYaxis = 0;
    int result = 0;
    int maxResult = 0;
    int switchOne = 0;
    int switchTwo = 0;
    int nums = 0;
            
    // x축 y축 입력 받기
    printf ("X축의 크기를 입력하세요.\n 크기 : ");
    scanf ("%d", &maxXaxis);
    printf ("Y축의 크기를 입력하세요.\n 크기 : ");
    scanf ("%d", &maxYaxis);
    
    // 배열 선언
    int height[maxYaxis];
    int array[maxXaxis][maxYaxis];
    int blockNumsInY[maxYaxis];
    
    // 배열 초기화
    for (int x = 0; x < maxXaxis; x++) {
        for (int y = 0; y < maxYaxis; y++) {
            array[x][y] = 0;
        }
    }
    
    // 블록 높이 입력 받기
    for (int x = 1; x <= maxXaxis; x++) {
        printf("X축 %d번 블록의 높이를 입력하세요.\n 입력범위 : 0 ~ %d\n 높이 : ", x, maxYaxis);
        scanf("%d", &height[(x - 1)]);
    }
    
    // 해당 배열에 블록의 유무 표시
    for (int x = 0; x < maxXaxis; x++) {
        for (int y = 0; y <= (height[x] - 1); y++) {
            array[x][y] = 1;
        }
    }
    
    // Y축 방향에서 본 블록의 갯수 저장
    for (int y = 0; y < maxYaxis; y++) {
        for (int x = 0; x < maxXaxis; x++) {
            if ( array[x][y] == 1 ) {
                nums++;
            }
        }
        blockNumsInY[y] = nums;
        nums = 0;
    }
    
    // 최대 낙하 높이 계산
    for (int y = 0; y < maxYaxis; y++) {
        switchOne = 0;
        for (int x = 0; x < maxXaxis; x++) {
            if ( array[x][y] == 1 ) {
                result = fallingHeight(maxXaxis, x) - blockNumsInY[y];
                switchOne = 1;
                if ( result < maxResult ) {
                    printf("최대 낙하 높이는 %d 입니다.\n", maxResult);
                    switchTwo = 1;
                    break;
                } else if ( y == (maxYaxis - 1)) {
                    printf("최대 낙하 높이는 %d 입니다.\n", result);
                    switchTwo = 1;
                    break;
                } else {
                    maxResult = result;
                }
            }
            if ( switchOne == 1 ) {
                break;
            }
        }
        if ( switchTwo == 1 ) {
            break;
        }
    }
    if (maxResult == 0 && switchTwo == 0) {
        printf("최대 낙하 높이는 0 입니다.\n");
    }
}

// 낙하 높이 계산 함수
int fallingHeight(int maxXaxis, int x) {
    int fall;
    fall = maxXaxis - x;
    return fall;
}


```
