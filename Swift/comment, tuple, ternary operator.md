### **comment**
// ~~~  
shortcut : command + / (커서의 현재위치, 코드블럭 모두 가능)
```swift
let comment
let i // var u
```
/* ~~~ */
```swift
/*
looooooooooooooo
oooooooooooooong
comment
*/
```
---
### **tuple**  
배열과 비슷하지만 어떤 타입이든 담을 수 있음  
```swift
let coordinates = (2, 3)
let x = coordinates.0 // 2
let y = coordinates.1 // 3

let coordiantesNamed = (x: 4, y: "YES")
let x2 = coordinatesNamed.x  // 4
let y2 = coordinatesNamed.y  // YES

let (x3, y3) = coordinatesNamed
x3  // 4  
y3  // YES
```
---
### ternary operator
삼항 연산자  
```swift
let firstCard = 11
let secondCard = 10
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")
// firstCard 와 secondCard가 같으면 "Cards are the same", 다르면 "Cards are different" 출력
// 위 코드는 아래 코드와 같은 의미
let firstCard = 11
let secondCard = 10
if firstCard == secondCard {
    print("Cards are the same")
} else {
    print("Cards are different")
}
```
