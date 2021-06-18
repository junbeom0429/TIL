- Floating Panel 2. 커스텀
    - Floating Panel의 뷰 계층도👨‍👩‍👦

        ```swift
        FloatingPanelController.view (FloatingPanelPassThroughView)
         ├─ .backdropView (FloatingPanelBackdropView)
         └─ .surfaceView (FloatingPanelSurfaceView)
            ├─ .containerView (UIView)
            │  └─ .contentView (FloatingPanelController.contentViewController.view)
            └─ .grabber (FloatingPanelGrabberView)
        ```

    1. 초기 레이아웃 바꾸기

        ```swift
        class ViewController: UIViewController, FloatingPanelControllerDelegate {
            ... {
                fpc = FloatingPanelController(delegate: self)
                fpc.layout = MyFloatingPanelLayout()
            }
        }

        class MyFloatingPanelLayout: FloatingPanelLayout {
            let position: FloatingPanelPosition = .top
            let initialState: FloatingPanelState = .tip
            var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
                return [
                    .full: FloatingPanelLayoutAnchor(absoluteInset: 16.0, edge: .top, referenceGuide: .safeArea),
                    .half: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
                    .tip: FloatingPanelLayoutAnchor(absoluteInset: 44.0, edge: .bottom, referenceGuide: .safeArea),
                ]
            }
        }
        ```

        - position을 .top으로 바꾸면 아래와 같이 패널이 위에 붙어서 로딩된다

        ![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b7167078-5ae8-4d59-9234-f56220c2d635/Screen_Shot_2021-06-18_at_8.49.22_PM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b7167078-5ae8-4d59-9234-f56220c2d635/Screen_Shot_2021-06-18_at_8.49.22_PM.png)

        - fractionalInset은 0부터 1까지의 값을 가지며 0.5라면 기준(위 코드는 safeArea의 bottom)으로부터 상단의 기준(safeArea의 top)까지 거리중 중간까지 패널이 올라온다
        (말그대로 분수로표현된 인셋)

    2. 패널 레이아웃 업데이트하기

        1번 초기 레이아웃 바꾸기 처럼 메뉴얼로 바꾸거나

        ```swift
        fpc.layout = MyPanelLayout()
        fpc.invalidateLayout() // If needed
        ```

        델리게이트를 사용하면 됨

        ```swift
        class ViewController: UIViewController, FloatingPanelControllerDelegate {
            ...
            func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout {
                return MyFloatingPanelLayout()
            }

            // OR
            func floatingPanel(_ vc: FloatingPanelController, layoutFor size: CGSize) -> FloatingPanelLayout {
                return MyFloatingPanelLayout()
            } 
        }
        ```

    3. 백그라운드 alpha값 변경

        ```swift
        class MyPanelLayout: FloatingPanelLayout {
            func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
                switch state {
                case .full, .half:
                    return 0.7
                default:
                    return 0
                }
            }
        }
        ```

    4. 커스텀 패널 스테이트 추가하기

        ```swift
        extension FloatingPanelState {
            static let lastQuart: FloatingPanelState = FloatingPanelState(rawValue: "lastQuart", order: 750)
            static let firstQuart: FloatingPanelState = FloatingPanelState(rawValue: "firstQuart", order: 250)
        }

        class FloatingPanelLayoutWithCustomState: FloatingPanelBottomLayout {
            override var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
                return [
                    .full: FloatingPanelLayoutAnchor(absoluteInset: 0.0, edge: .top, referenceGuide: .safeArea),
                    .lastQuart: FloatingPanelLayoutAnchor(fractionalInset: 0.75, edge: .bottom, referenceGuide: .safeArea),
                    .half: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
                    .firstQuart: FloatingPanelLayoutAnchor(fractionalInset: 0.25, edge: .bottom, referenceGuide: .safeArea),
                    .tip: FloatingPanelLayoutAnchor(absoluteInset: 20.0, edge: .bottom, referenceGuide: .safeArea),
                ]
            }
        }
        ```

    5. FloatingPanelBehavior protocol 커스텀하기

        각종 가속도, rubberbanding이펙트 등을 커스텀 가능

        ```swift
        class ViewController: UIViewController, FloatingPanelControllerDelegate {
            ...
            func viewDidLoad() {
                ...
                fpc.behavior =  CustomPanelBehavior()
            }
        }

        class CustomPanelBehavior: FloatingPanelBehavior {
        		// Manage the scrollView's DecelerationRate
            let springDecelerationRate = UIScrollView.DecelerationRate.fast.rawValue + 0.02
            let springResponseTime = 0.4
            func shouldProjectMomentum(_ fpc: FloatingPanelController, 
        				to proposedTargetPosition: FloatingPanelState) -> Bool {
                return true
            }

        		// Activate the rubber-band effect on panel edges
            func allowsRubberBanding(for edge: UIRectEdge) -> Bool {
                return true
            }
        		
        		// Manage the projection of a pan gesture momentum
        		func shouldProjectMomentum(_ fpc: FloatingPanelController, 
        				to proposedTargetPosition: FloatingPanelPosition) -> Bool {
                return true
            }
        }
        ```

    6. 패널의 이동 범위 커스텀하기

        아래 코드는 UIScrollView.contentOffset과 같은 기능을 가진다

        (contentOffset: The point at which the origin of the content view is offset from the origin of the scroll view)

        ```swift
        extension MapViewController: FloatingPanelControllerDelegate {
            func floatingPanelDidMove(_ vc: FloatingPanelController) {
                if vc.isAttracting == false {
                    let loc = vc.surfaceLocation
                    let minY = vc.surfaceLocation(for: .full).y - 6.0
                    let maxY = vc.surfaceLocation(for: .tip).y + 6.0
                    vc.surfaceLocation = CGPoint(x: loc.x, y: min(max(loc.y, minY), maxY))
                }
            }
        }
        ```

    7. surfaceView(상단 계층도 참고) 디자인 커스텀하기

        ```swift
        // Create a new appearance.
        let appearance = SurfaceAppearance()

        // Define shadows
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black
        shadow.offset = CGSize(width: 0, height: 16)
        shadow.radius = 16
        shadow.spread = 8
        appearance.shadows = [shadow]

        // Define corner radius and background color
        appearance.cornerRadius = 8.0
        appearance.backgroundColor = .clear

        // Set the new appearance
        fpc.surfaceView.appearance = appearance

        // 그랩 핸들러 변경
        let myGrabberHandleView = MyGrabberHandleView()
        fpc.surfaceView.grabberHandle.isHidden = true
        fpc.surfaceView.addSubview(myGrabberHandleView)

        // 그랩 핸들러 레이아웃 커스텀
        fpc.surfaceView.grabberHandlePadding = 10.0
        fpc.surfaceView.grabberHandleSize = .init(width: 44.0, height: 12.0)

        // surfaceView로 부터의 콘텐트 패딩값 커스텀
        fpc.surfaceView.contentPadding = .init(top: 20, left: 20, bottom: 20, right: 20)

        // 마진값 커스텀 
        fpc.surfaceView.containerMargins = .init(top: 20.0, left: 16.0, bottom: 16.0, right: 16.0)
        		/*
        		(참고: padding is the space between the content and the border,
        					whereas margin is the space outside the border)
        		*/
        ```

    8. 제스처 커스텀하기

        제스처의 활성, 비활성 조작하기

        ```swift
        extension MapViewController: FloatingPanelControllerDelegate {
        	func floatingPanelShouldBeginDragging(_ vc: FloatingPanelController) -> Bool {
            return aCondition ?  false : true
        	}
        }
        ```

        탭 제스처 추가하기

        ```swift
        override func viewDidLoad() {
            ...
            let surfaceTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSurface(tapGesture:)))
            fpc.surfaceView.addGestureRecognizer(surfaceTapGesture)
            surfaceTapGesture.isEnabled = (fpc.position == .tip)
        }

        // Enable `surfaceTapGesture` only at `tip` state
        func floatingPanelDidChangeState(_ vc: FloatingPanelController) {
            surfaceTapGesture.isEnabled = (vc.position == .tip)
        }
        ```

    9. 상황에 따른 애니메이션 추가하기

        예를 들면, 하프 포지션에 있다가도 패널 안에있는 서치바를 터치하면 풀 포지션으로 변화하며 애니메이션 동작하는 것 등

        ```swift
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            ...
            fpc.move(to: .half, animated: true)
        }

        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            ...
            fpc.move(to: .full, animated: true)
        }

        // 또는 애니메이션 메소드를 바로 사용가능
        UIView.animate(withDuration: 0.25) {
            self.fpc.move(to: .half, animated: false)
        }
        ```

    10. delegate의 상황에 따른 메소드들을 활용하자

        floatingPanelWillRemove

        floatingPanelDidRemove

        floatingPanelWillBeginAttracting

        floatingPanelDidEndAttracting

        floatingPanelDidMove

        floatingPanelDidChangeState

        floatingPanelWillBeginDragging

        floatingPanelWillEndDragging

        floatingPanelDidEndDragging
