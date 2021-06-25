* 프로토콜  
https://baked-corn.tistory.com/24?category=718234  
https://baked-corn.tistory.com/26?category=718234
  
* 제네릭  
로직은 같으나 타입이 다를 경우 사용  
```swift
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
```
https://docs.swift.org/swift-book/LanguageGuide/Generics.html  
  
* Where  
if 와 비슷한 조건절  
```swift
let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for number in numbers where number % 2 == 0 {
    print(number) // 0, 2, 4, 6, 8, 10
}
```
https://www.avanderlee.com/swift/where-using-swift/  

* inout  
프로퍼티를 복사하는 것이 아닌 주소값을 할당하여 그 값 자체에 접근하고자 사용  
```swift
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
```
위 스왑함수는 inout을 사용하여 그 값 자체를 스왑했다
