- May 13
    - 제이스 파싱

        [https://www.youtube.com/watch?v=ww2md779iRs&list=PLgOlaPUIbynqRzpQBIdEDnjDdkVsjHqxK&index=27](https://www.youtube.com/watch?v=ww2md779iRs&list=PLgOlaPUIbynqRzpQBIdEDnjDdkVsjHqxK&index=27)

    - 글로져 안에서 self 사용시 아래와 같이 [weak self] 를 사용하여

        ARC에 부담을 주지 않도록 처리해야함

        ```swift
        AlamoFireManaer
        	.shared
        	.getPhots(search: userInput,
        						completion: { [weak self] result in
        		guard let self = self else { return }
        		switch result {
        		case . failure(let error):
        			self.view.makeToast()
        		}
        })
        ```

        ARC(automatic reference count) : 메모리 관리 역할

        self 사용시 메모리의 카운트가 증가하기 때문에

        [weak self] 를 사용하여 메모리를 가지고 있는 것을 방지

    - Codable vs SwiftyJSON

        codable이 퍼포먼스적으로 낫다는 평이 많음
