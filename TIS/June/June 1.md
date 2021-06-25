- June 1
    - 네비게이션 아이템 수정

        [https://moonibot.tistory.com/31](https://moonibot.tistory.com/31)

    - 사진어플에 접근하기

        [https://zeddios.tistory.com/1126](https://zeddios.tistory.com/1126)

        -info.plist

        [https://pythonq.com/so/ios/22695](https://pythonq.com/so/ios/22695)

    - 프로필이미지 수정가능한뷰로 이동해서 바로 선택하기

        [https://silver-g-0114.tistory.com/44](https://silver-g-0114.tistory.com/44)

    - 유저디폴트

    - 유저디폴트 사진저장

        [https://ellordnet.tistory.com/155](https://ellordnet.tistory.com/155)

    - viewWillAppear을 통해 뷰컨트롤러 업데이트

        viewDidLoad는 초기 한번이지만

        viewVillAppear은 다른 화면 갔다가 다시 뷰로왔을때 동작하는 것을 이용

    - 키보드 리턴키 누르면 키보드 사라지게하기

        textFieldDelegate - shouldReturn() 사용

        ```swift
        extension PersonalInformViewController: UITextFieldDelegate {
            func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                textField.resignFirstResponder()
                return true
            }
        }
        ```
