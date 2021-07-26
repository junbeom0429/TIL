- July 26
    - 로티 베이직
        - Getting Started with Lottie Animations in iOS

            [https://swiftsenpai.com/development/lottie-getting-started/](https://swiftsenpai.com/development/lottie-getting-started/)

            -Display a Lottie

            ```swift
            // Create Animation object
            let jsonName = "Watermelon"
            let animation = Animation.named(jsonName)

            // Load animation to AnimationView
            let animationView = AnimationView(animation: animation)
            animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

            // Add animationView as subview
            view.addSubview(animationView)

            // Play the animation
            animationView.play()
            ```

            -Playback

            ```swift
            // Play the animation
            animationView.play()

            // Stop the animation
            animationView.stop()

            // Pause the animation
            animationView.pause()
            ```

            Lottie Advance Animation Playback

            [https://swiftsenpai.com/development/lottie-advance-animation-playback/](https://swiftsenpai.com/development/lottie-advance-animation-playback/)

            -Config

            ```swift
            // Set animation view content mode
            animationView.contentMode = .scaleAspectFit

            // Speed up animation
            animationView.animationSpeed = 2.0

            // Slow down animation
            animationView.animationSpeed = 0.5

            // Set animation loop mode
            animationView.loopMode = .loop

            animationView.loopMode = .autoReverse
            ```

    - 로티를 사용한 텍스트 애니메이션

        [https://swiftsenpai.com/development/lottie-text-provider/](https://swiftsenpai.com/development/lottie-text-provider/)
