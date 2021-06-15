- June 15
    - 콘테이너뷰 간의 델리게이트 패턴
    = (부모뷰와, 자식뷰간 델리게이트 패턴)
    = (세그로 연결된 뷰간의 델리게이트 패턴)

        단순히 아래와 같은 코드로 델리게이트를 위임했었는데 안됬었다

        ```swift
        let tableViewInMapVC = TableViewInMapViewController()
        tableViewInMapVC.delegate = self
        ```

        세그로 연결되어 있으므로 prepare 메소드를 사용하니 동작했다

        ```swift
        var tableViewInMapVC: TableViewInMapViewController?

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let destination = segue.destination
                if let tableViewController = destination as? TableViewInMapViewController {
                    tableViewInMapVC = tableViewController
                    tableViewController.delegate = self
                }
            }
        ```

        [https://useyourloaf.com/blog/container-view-controllers/](https://useyourloaf.com/blog/container-view-controllers/)

        (참고: 컨테이너뷰 간의 오토사이징)[https://useyourloaf.com/blog/self-sizing-child-views/](https://useyourloaf.com/blog/self-sizing-child-views/)

    -
