
```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "hello", message: "hello", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }
    
}

```
![image](/images/viewcontroller01.png) 
