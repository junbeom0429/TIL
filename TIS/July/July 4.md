- July 4
    - xcode 경고메세지 : Editor placeholder in source file

        placeholder : 나의 입력값을 입력하기전에 옅은 회색으로 써져있는 기본값

        해결방법 : 단순한 컴파일러 오류일 가능성이 높기 때문에 해당 라인을 지우고 다시 써주면 해결됨

        [https://www.reddit.com/r/swift/comments/aknst6/what_is_a_placeholder_and_how_can_i_fix_editor/](https://www.reddit.com/r/swift/comments/aknst6/what_is_a_placeholder_and_how_can_i_fix_editor/)

    - 터미널 에러 : dquote>

        하나의 더블 코트(쌍따옴표)를 사용하여 코드를 입력받는 모드로 변경된것

        Ctrl + G를 통해 해당 모드를 나갈 수 있다.

        [https://stackoverflow.com/questions/15773278/dquote-result-of-a-execution-a-program-in-linux-shell](https://stackoverflow.com/questions/15773278/dquote-result-of-a-execution-a-program-in-linux-shell)

    - git 에러 : error: Pulling is not possible because you have unmerged files.

        원인 찾기는 실패했지만 해결책은 찾을 수 있었다.

        ```swift
        git commit -am ""
        ```

        [https://velog.io/@2ujin/깃-Pull-is-not-possible-because-you-have-unmerged-files-에러](https://velog.io/@2ujin/%EA%B9%83-Pull-is-not-possible-because-you-have-unmerged-files-%EC%97%90%EB%9F%AC)

    - git 에러 : Updates were rejected because the tip of your current branch is behind

        브랜치에 대한 확실한 지식 없이 커밋과 푸쉬를 하다보니 push, merge, pull 모두 안되는 상황을 마주했다.

        답답한것은 원이이 무엇인지 알지못하는 것이나 임시방편 해결책은 찾을 수 있었다.

        ```swift
        git push -f origin main
        ```

        -f는 force를 의미한다. 즉 강제로 푸쉬해버리는 것

        딱 치트키 같은 느낌이기 때문에 자주 쓰지 않도록 노력해야겟다ㅜㅜ

        [https://stackoverflow.com/questions/39399804/updates-were-rejected-because-the-tip-of-your-current-branch-is-behind-its-remot](https://stackoverflow.com/questions/39399804/updates-were-rejected-because-the-tip-of-your-current-branch-is-behind-its-remot)
