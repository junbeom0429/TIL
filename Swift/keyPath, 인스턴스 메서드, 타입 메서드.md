
 [키 경로]  
 * 프로퍼티도 값을 꺼내오는 것이 아니라 어떤 프로퍼티의 위치만 참조하도록 하는 것  
 * WritableKeyPath<Root, Value>: 값 타입 대상  
 * ReferenceWritalbeKyPath<Root, Value>: 참조 타입 대상  
 * 키 경로는 타입 외부로 공개된 인스턴스 프로퍼티 혹은 서브스크립트에 한하여 표현할 수 있습니다  
 * 프로토콜과 마찬가지로 타입 간의 의존성을 낮춤  
 ```swift
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Stuff {
    var name: String
    var owner: Person
}

//무슨 타입인지 확인하는 코드
print(type(of: \Person.name))
print(type(of: \Stuff.name))

let aPerson = Person(name: "a")
let bPerson = Person(name: "b")
var aStuff = Stuff(name: "aStuffName", owner: aPerson)
let bStuff = Stuff(name: "bStuffName", owner: bPerson)

let stuffNameKeyPath = \Stuff.name
let stuffOwenerKeyPath = \Stuff.owner
let stuffOwenerNameKeyPath = stuffOwenerKeyPath.appending(path: \.name)

print(aStuff[keyPath: stuffOwenerNameKeyPath])
print(aStuff[keyPath: stuffNameKeyPath])
print(aStuff[keyPath: stuffOwenerKeyPath])

aStuff[keyPath: stuffNameKeyPath] = "changedName"
print(aStuff[keyPath: stuffNameKeyPath])
```
---
 [인스턴스 메서드]  
 * 인스턴스 메서드: 함수와 달리 인스턴스가 존재할 때만 사용할 수 있음
 * 자신의 프로퍼티 값을 수정할 때 참조 타입인 클래스의 인스턴스 메서드는 크게 신경 쓸 필요가 없지만,  
구조체나 열거형 등은 값 타입이므로 메서드 앞에 mutating키워드를 붙여서 해당 메서드가 인스턴스 내부의 값을 변경한다는 것을 명시해야 합니다  
 ```swift
class LevelClass {
    var level: Int = 0 {
        didSet {
            print("\(level)")
        }
    }
    
    func levelUp() {
        print("Level Up")
        level += 1
    }
    
    func jumpTo(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    //인스턴스의 level을 명확히 가르키기위해 self 프로퍼티 사용
    //self.level의 level은 LevelClass인스턴스의 level이고
    // = level의 level은 jumpLevel의 매개변수인 level이다
    func jumpLevel(to level: Int) {
        print("Jump to \(level)")
        self.level = level
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp()

struct LevelStruct {
    var level: Int = 0 {
        didSet {
            print("\(level)")
        }
    }
    
    mutating func levelDown() {
        print("Level Down")
        level -= 1
    }
    
    //구조체나 열거형 등의 값 타입은 self프로퍼티를 사용하여 자신 자체를 치환 할 수 있습니다
    //반대로 클래스의 인스턴스는 참조 타입이라서 불가합니다
    mutating func reset() {
        print("Reset")
        self = LevelStruct()
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelDown()
levelStructInstance.reset()
```
---
 [타입 메서드]  
 * 클래스의 타입메서드 2가지  
 1. static 키워드: 상속 후 메서드 재정의 불가능  
 2. class 키워드: 상속 후 메서드 재정의 가능  
```swift
class CClass {
    static func staticTypeMethod() {
        print("CClass staticTypeMethod")
    }
    class func classTypeMethod() {
        print("CClass classTypeMethod")
    }
}

class DClass: CClass {
    /* 오류발생 static키워드를 사용했기 때문에 재정의 불가
     override static func staticTypeMethod() {
     
     }
     */
    
    override class func classTypeMethod() {
        print("DClass classTypeMethod")
    }
}

CClass.staticTypeMethod() //-> CClass staticTypeMethod
CClass.classTypeMethod()  //-> CClass classTypeMethod
DClass.classTypeMethod()  //-> DClass classTypeMethod
```

  
* 타입 메서드는 인스턴스 메서드와 달리 self프로퍼티가 타입 그 자체를 가리킨다는 점이 다름  
* 인스턴스메서드에서 self가 인스턴스를 가리킨다면 타입메서드의 self는 타입을 가리킴  
* 그래서 타임 메서드 내부에서 타입이름과 self는 같은 뜻이락 볼 수 있음  
```swift
struct SystemVolume {
    static var volume: Int = 5
    static func mute() {
        self.volume = 0
        // SystemVolume.volume = 0 과 같음
        // Self.volume = 0 과도 같음
    }
}

class Navigation {
    var volume: Int = 5
    func guideWay() {
        SystemVolume.mute()
    }
    func finishGuideWay() {
        SystemVolume.volume = self.volume
        
    }
}

SystemVolume.volume = 10
let myNavi: Navigation = Navigation()

myNavi.guideWay()
print(SystemVolume.volume) //-> 0

myNavi.finishGuideWay()
print(SystemVolume.volume) //-> 5
```
