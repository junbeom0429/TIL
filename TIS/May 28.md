- May 28
    - 텍스트필드 비밀번호 형식으로 보이기

        [https://nota.tistory.com/12#:~:text=생성된 TextField를 클릭,비밀번호 형식으로 보이게 된다](https://nota.tistory.com/12#:~:text=%EC%83%9D%EC%84%B1%EB%90%9C%20TextField%EB%A5%BC%20%ED%81%B4%EB%A6%AD,%EB%B9%84%EB%B0%80%EB%B2%88%ED%98%B8%20%ED%98%95%EC%8B%9D%EC%9C%BC%EB%A1%9C%20%EB%B3%B4%EC%9D%B4%EA%B2%8C%20%EB%90%9C%EB%8B%A4)

    - 비밀번호 형식으로 헀을 때 오류

        Cannot show Automatic Strong Passwords for app bundleID

        키체인 활성화 하지 못해서 나오는 오류

        해결책 : 

        ```swift
        if #available(iOS 12.0, *) {
            self.textContentType = .oneTimeCode
        }
        ```

        또는 텍스트필드 어트리뷰션에서 

        text input Traits - Content Type 을 One Time Code로 설정

    - lazy var

        [https://baked-corn.tistory.com/45](https://baked-corn.tistory.com/45)

    - .priority

        constraint에 우선순위를 주는 것

        0~1000까지 설정할 수 있으며

        보통 1000, 750, 500, 250 으로 설정한다

        [https://zeddios.tistory.com/380](https://zeddios.tistory.com/380)

    - SnapKit

        [https://www.youtube.com/watch?v=2Gp01Zqy2oA](https://www.youtube.com/watch?v=2Gp01Zqy2oA)
