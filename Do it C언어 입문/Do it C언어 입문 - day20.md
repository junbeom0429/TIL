chap. 18 Struct
---
### 18-5 구조체를 활용한 연결리스트
---
```c
#include <stdio.h>
#include <stdlib.h>

typedef struct node {
  int number;
  struct node *p_next;
} NODE;

void addNumber(NODE **pp_head, NODE **pp_tail, int data) {
  if(NULL != *pp_head) {
  (*pp_tail)->p_next = (NODE *)malloc(sizeof(NODE));
  *pp_tail = (*pp_tail)->p_next;
  } else {
  *pp_head = (NODE *)malloc(sizeof(NODE));
  *pp_tail = *pp_head;
  }
  
  (*pp_tail)->number = data;
  (*pp_tail)->p_next = NULL;
}  
