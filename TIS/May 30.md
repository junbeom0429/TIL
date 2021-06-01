- May 30
    - dismiss 한 뒤 바로 present 하는법(?)

        [https://developer-fury.tistory.com/56](https://developer-fury.tistory.com/56)

        [https://toygift7.tistory.com/152](https://toygift7.tistory.com/152)

    - 테이블뷰
        - 헤더뷰,푸터뷰 추가 : view를 드래그앤드롭하면됨
        - 섹션 고정 안되게하기 : 테이블뷰 어트리뷰션에서 스타일을 grouped로

            ![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5fb9743a-79af-4455-9b31-8dd7963708de/Screen_Shot_2021-05-30_at_7.03.35_PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5fb9743a-79af-4455-9b31-8dd7963708de/Screen_Shot_2021-05-30_at_7.03.35_PM.png)

        - 섹션 추가해서 데이터 담기

            [https://calmone.tistory.com/entry/iOS-UIKit-in-Swift-4-section으로-나누어진-UITableView-만들기](https://calmone.tistory.com/entry/iOS-UIKit-in-Swift-4-section%EC%9C%BC%EB%A1%9C-%EB%82%98%EB%88%84%EC%96%B4%EC%A7%84-UITableView-%EB%A7%8C%EB%93%A4%EA%B8%B0)

            [https://duwjdtn11.tistory.com/560](https://duwjdtn11.tistory.com/560)

    - 상황에 따라서 다른 스토리보드로 들어가기

        [http://seorenn.blogspot.com/2015/12/ios.html](http://seorenn.blogspot.com/2015/12/ios.html)

        [http://monibu1548.github.io/2018/08/28/appdelegate/](http://monibu1548.github.io/2018/08/28/appdelegate/)

        [https://developer-fury.tistory.com/41](https://developer-fury.tistory.com/41)

    - 테이블뷰 재사용셀 사용시 각 셀마다 버튼의 목적지가 다를 때

        delegate pattern을 사용하여 해결한다 (target-action 방식도 가능)

        delegate Pattern

        [https://www.youtube.com/watch?v=ChjXkkqog5k](https://www.youtube.com/watch?v=ChjXkkqog5k)

        [https://juhyeoklee.github.io/ios/ios-post06](https://juhyeoklee.github.io/ios/ios-post06/)

        target-action

        [https://stackoverflow.com/questions/26143820/swift-segue-from-button-inside-a-cell](https://stackoverflow.com/questions/26143820/swift-segue-from-button-inside-a-cell)

    - 내비게이션 바 투명처리

        ![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5a844334-677c-4be5-9f8c-eafca1737bb4/Screen_Shot_2021-05-31_at_12.08.35_AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5a844334-677c-4be5-9f8c-eafca1737bb4/Screen_Shot_2021-05-31_at_12.08.35_AM.png)

        viewdidload() 에서 아래코드 추가

        ```swift
        self.navigationController?.navigationBar.isTransparent = true
        ```
