- Dectecting PanGesture Direction

    velocity를 활용하여 감지

    ```swift
    //MARK: - Direction
    internal enum Direction {
        case up
        case down
        case left
        case right
    }

    //MARK: - UIPanGestureRecognizer
    internal extension UIPanGestureRecognizer {
        internal var direction: Direction? {
            let velocity = velocityInView(view)
            let isVertical = fabs(velocity.y) > fabs(velocity.x)

            switch (isVertical, velocity.x, velocity.y) {
                case (true, _, let y) where y < 0: return .up
                case (true, _, let y) where y > 0: return .down
                case (false, let x, _) where x > 0: return .right
                case (false, let x, _) where x < 0: return .left
                default: return nil
            }
        }
    }
    ```
