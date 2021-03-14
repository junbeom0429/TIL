## optional타입의 값을 받는 방법 
---
* forced unwrapping >>> 억지로
* optional binding(if let) >>> 부드럽게
* optional binding(guard) >>> 부드럽게
* nil coalescing >>> 값이 없으면 default할당
---
### 1. forced unwrapping  
변수명 뒤에 !를 붙여 사용  
변수가 nil값일 경우 컴파일 에러 발생  
```swift
print(carName!)
```
---
### 2. optional binding(if let)
```swift
if let unwrappedCarName = carName {
  print(unwrappedCarName)
} else {
  print("Car Name 없다")
}
```
---
### 3. optional binding(guard)
```swift
func printParsedInt(from: string) {
  if let parsedInt = Int(from) {
    if parsedInt > 0 {
      print("양수")
    } else {
      print("음수")
    }
  } else {
    print("Int로 컨버팅 불가")
  }
}
```
>위 코드와 같이 if문 등이 여러 겹 겹치면  
>레벨 뎁스가 높다고 하고 같은 말로  
>cyclomatic complexity가 높아진다고 표현  
>cyclomatic complexity를 낮추기 위해 아래와 같이  
>guard를 사용하여 코딩  
```swift
func printParsedInt(from: string) {
  guard let parsedInt = Int(from) else {
    print("Int로 컨버팅 불가")
    return
  }
  print(parsedInt)
}
```
---
### 4. nil coalescing  
?? 뒤에 default값을 선언  
```swift
let myCarName: string = carName ?? "모델S"
```
