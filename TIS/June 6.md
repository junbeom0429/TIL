- June 6
    - 프로퍼티 감시자 (굿굿!)

        : 게스트 숫자에 따라 스위치활성를 제어하는 코드에서의 프로퍼티 감시자 활용 코드

        ```swift
        var guestNum: Int = 0 { didSet {
                SearchBtnActiveSwitch()
            }}
        ```

        [https://ttuk-ttak.tistory.com/60?category=917080](https://ttuk-ttak.tistory.com/60?category=917080)

    - 네비게이션 제스쳐로 뒤로가기 온/오프
    [https://byeon.is/swift-interactivepopgesturerecognizer-bug/](https://byeon.is/swift-interactivepopgesturerecognizer-bug/)

        ```swift
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        ```

    - dismiss 후 push😰😩😱
    1. @escaping 
    2. delegate 패턴

        [https://stackoverflow.com/questions/24939465/dismiss-modal-then-immediately-push-view-controller/24940161](https://stackoverflow.com/questions/24939465/dismiss-modal-then-immediately-push-view-controller/24940161)
        두 방법 사용해봤으나 동작하지 않음

        예제들과 다른점은 뷰1 과 뷰2의 스토리보드가 다르다는 점 밖에 없는 듯 한데,, 잘 모르겠음

    - swipe to dismiss
    panGestureRecognizor 를 사용하여 presentation이 over full screen 으로 설정되있는 모달창을 dismiss 하는 법

        [https://medium.com/@qbo/dismiss-viewcontrollers-presented-modally-using-swipe-down-923cfa9d22f4](https://medium.com/@qbo/dismiss-viewcontrollers-presented-modally-using-swipe-down-923cfa9d22f4)
