# Boost Course 6th week's team mission
---
## 어려웠던 점
---
* 왜 free()함수는 사용하지 않는가??  

---
## 문제
---
>✔︎ 미션 4 : 뒤에서 k번째 노드는 무엇일까요?  
>연결리스트가 하나 주어졌을 때 해당 연결 리스트의 뒤에서 k번째 노드의 값은 무엇일지 알아낼 수 있을까요?  
>예를 들어, 9->8->4->14->5 라는 리스트가 주어질 때  
>뒤에서 2번째 노드를 출력하라고 하면 14가 출력이 되어야 합니다. 

---
### 작성 코드
```c
#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int data;
    struct node* next;
} Node;

void append(Node* head, int data) {
    // 연결할 새로운 item 구조체 생성
    Node* item = (Node*)malloc(sizeof(Node));
    item->data = data;
    item->next = NULL;
    
    // 임시의 temp 구조체 만들어서 head를 받아서
    // 넣을 위치를 계산 후 그 자리에 item 구조체 연결
    Node* temp = (Node*)malloc(sizeof(Node));
    temp = head;
    while(temp->next != NULL) {
         temp = temp->next;
    }
    temp->next = item;
}

int getLastNode (Node* head, int k) {
    // 총 몇번 구조체가 연결되었는지 count변수에 저장
    Node* temp = (Node*)malloc(sizeof(Node));
    temp = head;
    int count = 0;
    while(temp->next != NULL) {
        temp = temp->next;
        count++;
    }
    
    // (앞에서 몇번째인지 나태내는 수) = (구조체가 연결된 개수) - (뒤에서 몇번째인지 나타내는 수)
    // 의 결과값 만큼 반복하여 해당 위치의 data값 추출
    temp = head; // temp를 head로 초기화(처음부터 다시 카운트하기 위하여)
    for(int i = 0; i <= (count - k); i++) {
        temp = temp->next;
    }
    int result;
    result = temp->data;
    
    return result;
}

void printList(Node* head) {
    while(head->next != NULL) {
        printf("%d ", head->next->data);
        head = head->next;
    }
}

int main() {
    Node* head = (Node*)malloc(sizeof(Node));
    append(head, 9);
    append(head, 8);
    append(head, 4);
    append(head, 14);
    append(head, 5);

    printList(head);

    printf("\n%dth last node is %d\n", 2, getLastNode(head, 2));
}
```
