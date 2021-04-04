## Enumerations
* 열거형은 배열이나 딕셔너리 같은 타입과 다르게 프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가합니다. 그렇기 때문에 딱 정해진 값만 열거형 값에 속할 수 있습니다.  
* 각 열거형이 고유의 타입으로 인정되기 때문에 실수로 버그가 일어날 가능성을 원천 봉쇄할 수 있습니다.  

다음과 같은 경우에 요긴하게 사용됩니다.  
>* 제한된 선택지를 주고 싶을 때
>* 정해진 값 외에는 입력받고 싶지 않을 때
>* 예상된 입력 값이 한정되어 있을 때
---

### 열거형 변수 생성
![image](/images/Enumerations-02-01.png)
---

### 원시 값(Raw Value)
![image](/images/Enumeraions-02-02.png)
![image](/images/Enumeraions-02-03.png)
---

### 항목 순회(CaseIterable 프로토콜)
![image](/images/Enumeraions-02-04.png)
![image](/images/Enumeraions-02-05.png)
