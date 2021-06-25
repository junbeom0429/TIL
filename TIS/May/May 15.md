- May 15
    - 스트링에 <b> 등 htmltag 제거하기

        [https://stackoverflow.com/questions/41874496/remove-html-tag-from-string](https://stackoverflow.com/questions/41874496/remove-html-tag-from-string)

        ```swift
        extension String {
            var withoutHtmlTags: String {
              return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            }
        }
        ////////// Usage
        let result = "<strong>HTML</strong> Tags <em>Contain</em> <img /> <a href=\"\">String</a>"
        result.withoutHtmlTags // -> HTML Tags
        ```

    - OAuth  2.0 : OAuth is an open-standard authorization protocol or framework that describes how unrelated servers and services can safely allow authenticated access to their assets without actually sharing the initial, related, single logon credential. In authentication parlance, this is known as secure, third-party, user-agent, delegated authorization.

    - 네아로
        - OAuth2.0 인증 절차

            1. 네아로를 사용하는 앱에서 로그인 시도시

            앱은 네이버에 OAuth2.0인증을 요청

            2. 네이버는 간편로그인 프로세를 거쳐 인증코드를 획득하고

            획득한 인증코드를 앱의 URL Scheme을 통해 앱에 반환

            3. 인증코드를 받은 앱은 인증 성공 여부를 판단하고

            4. 성공시 네이버 서버에서 접근 토큰과 갱신 토큰을 받아옴

            5. 서버 호출 결과로 값을 받으면 델리게이트를 호출하고 호출 성공여부 판단

            6. 호출에 성공하면 접근 토큰으로 오픈API를 호출할 수 있음

            7. 오픈API를 호출할 때 앱에서 접근 토큰을 사용하여 인증 헤더 문자열을 구성해야 함

            8. 이렇게 구성된 문자열은 오픈API 호출 시 HTTP Header필드에 추가해 서보로 함께 전송

            [https://developer-fury.tistory.com/18](https://developer-fury.tistory.com/18)

            [https://ios-development.tistory.com/142](https://ios-development.tistory.com/142)

    - cocoaPods
        - cocoaPods? : 외부 라이브러리 관리 도구
        - 설치
        1. 터미널에 아래 명령어 입력

            ```swift
            sudo gem install cocoapods
            ```

        2. 터미널에서 코코아팟 라이브러리를 적용하고 싶은 프로젝트 경로로 들어가기

            (팁 : 들어갈 폴더를 터미널에 드래그앤드롭하면 경로 추출됨)

            ```swift
            cd /Users/mac/Desktop/Swift\ Practices/\[Soft\ Squared\]/APITest
            ```

        3. 프로젝트폴더로 들어간 후 아래 명령어 입력

            입력하면 프로젝트 폴더에 'podfile' 생성됨

            ```swift
            pod init
            ```

        4. 터미널에서 아래 3개 중 하나를 선택해 입력

            ```swift
            1. vi Podfile
            2. nano Podfile
            3. open -e podfile
            ```

        5. 라이브러리 추가 (아래 코드 참고)

            ```swift
            target 'APITest' do
              # Comment the next line if you don't want to use dynamic frameworks
              use_frameworks!

              # Pods for APITest
              pod 'naveridlogin-sdk-ios'
            	///////////////// 이곳에 pod '' 추가 /////////////
            end
            ```

        6. 터미널에서 아래 명령어 입력

            터미널에서 아래 명령어 입력

            입력하면 'APITest.xcworkspace' 등의 워크스페이스 생성됨

            이후부터는 워크스페이스를 통해 앱에 접근해야함

            (워크스페이스 : 여러개의 프로젝트를 연결해 놓은 것)

            ```swift
            pod install
            ```

    - 서드파티

        퍼스트파티 : 하드웨어 생산자 하의 소프트웨어 개발자

        세컨드파티 : 제품의 사용자

        서드파티 : 관계가 전혀 없는 소프트웨어 개발자

    - 프레임워크 vs 라이브러리

        프레임워크에서는 프레임워크 코드가 우리 코드를 호출

        라이브러리에서는 우리 코드가 라이브러리 코드를 호출

        프레임워크는 앱의 흐름을 통제, 라이브러리는 단순 행동

    - info.plist 수정 방법
        1. 프로젝트 폴더로 들어가 info.plist를 텍스트에디터로 연 후 수정
        2. Xcode에서 + 를 눌러 임의 프로퍼티 만든 후 키값을 입력하면 타입값을 선택할 수 있음

            타입을 Array로 지정하여 하위 리스트 생성가능
