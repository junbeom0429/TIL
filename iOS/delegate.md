delegate = 할일을 위임하는 것
```swift
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
    }
}
```
위 코드는 "field에 무슨일이 일어나면 프로토콜(UITextFieldDelegate)를 준수하면서 내가(ViewController) 대신 일 할게" 의미  
```swift
field.delegate = self
```
에서 self는 ViewController를 뜻함  
즉, 위임 받는 것은 ViewController라는 것  
