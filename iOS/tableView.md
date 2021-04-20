테이블뷰 사용시 대답해주어야할 것
1. 몇개의 셀을 보여줄지
2. 셀의 속성(셀 재활용 등)
3. 클릭했을 때 어떤 동작 할 것인지
```swift
// 테이블뷰가 들어가있는 뷰컨트롤러의 클래스
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // UITableviewDataSource
    // 몇개의 셀을 나태낼 것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // 셀 속성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 재활용을 위한 코드
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    // UITableViewDelegate
    //클릭했을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
    }
    
}
```
