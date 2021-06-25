- May 27
    - Xcode 코드 정리 단축키 : 컨트롤 + i

    - scrollview 원하는 위치로 자동 스크롤

        [https://ios-development.tistory.com/188](https://ios-development.tistory.com/188)

    - 탭 제스쳐 사용해서 특정위치는 반응 안하게 하기

        [https://www.youtube.com/watch?v=pBG66IYtKlk&list=PLgOlaPUIbynqRzpQBIdEDnjDdkVsjHqxK&index=25](https://www.youtube.com/watch?v=pBG66IYtKlk&list=PLgOlaPUIbynqRzpQBIdEDnjDdkVsjHqxK&index=25)     (1:07:10)

    - 글자입력시 글자수 제한

         [https://www.youtube.com/watch?v=pBG66IYtKlk&list=PLgOlaPUIbynqRzpQBIdEDnjDdkVsjHqxK&index=25](https://www.youtube.com/watch?v=pBG66IYtKlk&list=PLgOlaPUIbynqRzpQBIdEDnjDdkVsjHqxK&index=25)    (1:00:00)

    - alpha, opaque, opacity

        – alpha : 0.0~1.0범위의 값으로, 0.0은 완전하게 투명, 1.0은 완전하게 불투명입니다.

        – isOpaque : view가 투명한지 불투명한지 결정하는 Bool값. true로 설정하면 drawing 시스템이 view를 완전히 불투명하게 처리합니다. => 성능을 향상시킬 수 있음.

        – opacity : 불투명도. 0.0(투명)~1.0(불투명)범위내에 있어야 하며, 해당 범위를 벗어나는 값은 최소값 또는 최대값으로 고정됩니다. 이 속성의 기본값은 1.0이며, alpha와 차이는 alpha는 UIView에, opacity는 CALayer의 프로퍼티라는 것입니다.
