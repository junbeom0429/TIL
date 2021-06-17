- Floating Panel 1. 기본구현

    이것을 팬제스처를 통해 만들어보려 했지만 위치는 옮겨지는대, 높이는 조절이 되지 않았다

    ```swift
    self.tableViewContainer.frame = CGRect(
    x:tableViewContainer.frame.origin.x + translation.x, 
    y:tableViewContainer.frame.origin.y + translation.y, 
    width: self.tableViewContainer.frame.size.width, 
    height: tableViewContainer.frame.size.height)
    ```

    팬제스처를 통해 프레임을 조정하는 코드에서 width나 height를 변화시키는 순간
    해당 뷰가 이동하지 않고 멈춰버린다

    (이유를 알고 싶음😵)

    결국 라이브러리를 찾아보았고

    Floating Panel이라는 라이브러리를 찾았다  
    [https://github.com/scenee/FloatingPanel](https://github.com/scenee/FloatingPanel)  
    [https://www.youtube.com/watch?v=bmYgQvfkk_w](https://www.youtube.com/watch?v=bmYgQvfkk_w)  
    (참고 - 비슷한 것) [https://www.youtube.com/watch?v=L-f1KSPKm4I](https://www.youtube.com/watch?v=L-f1KSPKm4I)  

    ```swift
    fpc = FloatingPanelController()
    fpc.delegate = self
    guard let contentVC = storyboard?.instantiateViewController(identifier: "contentVC") 
    as? TableViewInMapViewController else { return }
            
    fpc.set(contentViewController: contentVC)
    fpc.track(scrollView: contentVC.tableViewPanel)
    fpc.addPanel(toParent: self)
    ```

    아주 간단한 코드로 구현됨

    ![fpc](https://user-images.githubusercontent.com/77920227/122388501-e6e3a280-cfaa-11eb-865d-5b4bb89e1e58.gif)
