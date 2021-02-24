# 코드해석
---
✔︎ 샘플미션 : 2개의 리스트 합치기  
A 부서와 B 부서에서 보내는 연결리스트는 모두 오름차순으로 정렬되어 있는 상태이며  
A 부서에서 보내온 리스트와 B 부서에서 보내온 리스트의 길이는 다를 수 있습니다.  
입력값: 정렬된 2개의 연결리스트  
출력값: 정렬된 리스트가 출력  

>ex)  
>A부서에서 보내온 연결리스트가 2->6->9->10  
>B부서에서 보내온 연결리스트가 1->5->7->8->11 이라면  
>여러분이 만들 연결리스트는 1->2->5->6->7->8->9->10->11 이 되어야 합니다.  

---
### 정답 예시 코드
```c
#include <stdio.h>
#include <stdlib.h>

/* 구조체 선언 */
typedef struct node {
    int data;
    struct node* next; // 다음 변수를 가리키는 포인터
}ListNode;

/* 합치는 함수 */
ListNode* mergeTwoLists(ListNode* l1, ListNode* l2) {
    // 리스트를 시작하는 헤드포인터에 ListNode구조체 크기 만큼의 메모리 할당
    ListNode* head = (ListNode *)malloc(sizeof(ListNode));
    
    // head구조체는 변하면 안되므로 pt구조체를 만들어 head를 받음
    ListNode* pt = head;
    
    l1 = l1->next;
    l2 = l2->next;
    
    // 둘다 next에 NULL값이 아닌 경우에 동작되어 pt에 크기를 비교하여 연결
    // 이런 비교가 가능한 이유는 두 리스트가 오름차순으로 정렬되었다는 전제가 있기 때문임
    while (l1!=NULL && l2!=NULL) {
        if (l1->data <= l2->data) {
            pt->next = l1;
            l1 = l1->next;
        } else {
            pt->next = l2;
            l2 = l2->next;
        }
        pt = pt->next;
    }
    
    // 두 리스트간 비교가 끝난 후 나머지가 존재하는 리스트를 그대로 pt에 연결(두 리스트가 정렬되있기 때문에 가능)
    if (l1 != NULL)
        pt->next = l1;
    if (l2 != NULL)
        pt->next = l2;
    return head;
}

/* 리스트에 변수 붙이기 함수 */
void append(ListNode* l, int data) {
    // 새로운 item구조체 생성
    ListNode* item = (ListNode*)malloc(sizeof(ListNode));
    item->data = data;
    item->next = NULL;
    
    // 임시의 temp구조체 생성하여 l구조체를 받아 연결리스트 끝에 위에서 만든 item
    ListNode* temp = (ListNode*)malloc(sizeof(ListNode));    
    temp = l;
    while(temp->next != NULL) {
        temp=temp->next;
    }
    temp->next = item;
}

/* 정렬된 리스트 출력 */
void printList(ListNode* l) {
    while(l->next != NULL) {
        printf("%d ", l->next->data);
        l = l->next;
    }
    printf("\n");
}

/* 메인 함수 */
int main() {
    ListNode* listA = (ListNode*)malloc(sizeof(ListNode));
    ListNode* listB = (ListNode*)malloc(sizeof(ListNode));

    append(listA, 2);
    append(listA, 6);
    append(listA, 9);
    append(listA, 10);
    printList(listA);

    append(listB, 1);
    append(listB, 5);
    append(listB, 7);
    append(listB, 8);
    append(listB, 11);
    printList(listB);

    ListNode* result = mergeTwoLists(listA, listB);
    printList(result);
}
```
