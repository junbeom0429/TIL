- June 17
    - Frame Rectangle 과 Alignment Rectangle 의 차이점

        ![Screen Shot 2021-06-17 at 8 20 29 PM](https://user-images.githubusercontent.com/77920227/122387092-77b97e80-cfa9-11eb-9afb-3fbbce8fa4d1.png)


        frame은 이 뷰가 어디에 위치해 있는지, 그 크기는 얼마인지 설명함

        alignment rectangle은 뷰의 내용물이 보여주는 방식을 베이스로 둠, 오토레이아웃은 frame 대신 alignment rectangle을 사용한다

        [https://stackoverflow.com/questions/28152533/difference-between-frame-rectangle-and-alignment-rectangle](https://stackoverflow.com/questions/28152533/difference-between-frame-rectangle-and-alignment-rectangle)

  

    
    - Floating Panel 1. 기본구현

        이것을 팬제스처를 통해 만들어보려 했지만 위치는 옮겨지는대, 높이는 조절이 되지 않았다

        ```swift
        self.tableViewContainer.frame = CGRect(
        x:tableViewContainer.frame.origin.x + translation.x, 
        y:tableViewContainer.frame.origin.y + translation.y, 
        width: self.tableViewContainer.frame.size.width, ![fpc](https://user-images.githubusercontent.com/77920227/122386797-31641f80-cfa9-11eb-9dfc-9dc31188907c.gif)

        height: tableViewContainer.frame.size.height)
        ```

        팬제스처를 통해 프레임을 조정하는 코드에서 width나 height를 변화시키는 순간
        해당 뷰가 이동하지 않고 멈춰버린다

        (이유를 알고 싶음😵)

        결국 라이브러리를 찾아보았고

        Floating Panel이라는 라이브러를 찾았다 [https://github.com/scenee/FloatingPanel](https://github.com/scenee/FloatingPanel)

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
        ![fpc](https://user-images.githubusercontent.com/77920227/122386814-36c16a00-cfa9-11eb-9760-1e316b17c517.gif)

