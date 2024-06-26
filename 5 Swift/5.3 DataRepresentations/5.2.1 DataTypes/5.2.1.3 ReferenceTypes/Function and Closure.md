## Function

1. [100 Days of SwiftUI. Day 6](https://www.hackingwithswift.com/100/swiftui/6)
2. [ARC в замыканиях](https://www.youtube.com/watch?v=-oPDbicto7k&list=PLtovLaW_R9-N-KECYTUWqQaVtBXhufJfw&index=34&ab_channel=SwiftBook)

Swift позволяет нам использовать функции, как и любой другой тип, например строки и целые числа. Это означает, что вы можете создать функцию и присвоить ее переменной, вызвать эту функцию, используя эту переменную, и даже передать эту функцию другим функциям в качестве параметров. Функции, используемые таким образом, называются замыканиями

## inout

1. :heavy_check_mark: [When should you use inout parameters?](https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-inout-parameters)
2. :heavy_check_mark: [inout parameters](https://www.hackingwithswift.com/sixty/5/10/inout-parameters)

Параметры функции изменять нельзя, и, чтобы обойти это ограничение, добавим inout-параметр, который допускает изменение. Это тот же указатель в си (*), для передачи переменной в качестве inout необходимо добавить &.

```
var num1: Int = 1
var char1 = "a"

func changeNumber(num: Int) {
    var num = num
    num = 2
}
changeNumber(num: num1)
print(num1) // 1

func changeChar(char: inout String) {
    char = "b"
}
changeChar(char: &char1)
print(char1) // b
```

> нельзя передавать константы (let) как inout параметр (&my_let)

---

## mutating func

1. :heavy_check_mark: [Mutating methods](https://www.hackingwithswift.com/sixty/7/5/mutating-methods)

Когда вы создаете структуру, Swift не знает, будете ли вы использовать ее с константами или переменными, поэтому по умолчанию используется безопасный подход: Swift не позволит вам писать методы, которые изменяют свойства, если вы специально не запросите это.

У нас есть структура, которая может считать площадь и в ней никакие переменные не меняются.
```
struct Rectangle {
    var width = 1
    var height = 1
    func area() -> Int {
        return width * height
    }
}
```

Но! Если нам нужна функция, которая изменяет переменные, то нужно использовать mutating.

Функция по масштабированию прямоугольника:

```swift
struct Rectangle {
    var width = 1
    var height = 1
    mutating func scaleBy(_ value:Int) -> Int {
        width *= value
        height *= value
    }
}
```

Функция фактически изменяет свойства ширины и высоты прямоугольника. Поэтому мы не можем использовать scaleBy() при let.

> Пометка методов как mutating остановит вызов метода для константных структур, даже если сам метод не изменяет никаких свойств. Если вы говорите, что метод что-то меняет, то Свифт вам поверит!

```swift
let MyRect = Rectangle(width: 100, height: 100)
MyRect.scaleBy(3)
```
Будет ошибка компиляции, потому что мы пытаемся константную переменную изменить.

### throw/throws

1. :heavy_check_mark: [Working with throwing functions in Swift](https://www.donnywals.com/working-with-throwing-functions-in-swift/)
2. :heavy_check_mark: [When should you write throwing functions?](https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-write-throwing-functions)
3. :heavy_check_mark: [Running throwing functions](https://www.hackingwithswift.com/sixty/5/9/running-throwing-functions)
4. :heavy_check_mark: [Why does Swift make us use try before every throwing function?](https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-make-us-use-try-before-every-throwing-function)
5. :heavy_check_mark: [Optional try](https://www.hackingwithswift.com/sixty/10/8/optional-try)

Пример, [взятый отсюда](https://www.hackingwithswift.com/sixty/5/8/writing-throwing-functions):

```swift
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.") // You can't use that password.
}
```

> Обязательно должен быть `Error` протокол у enum;
>
> Обратить внимание где пишется `throws`, а где `throw`;
>
> Swift не позволит вам случайно запустить `throws` функцию, поэтому нужно использовать do (запускает раздел кода, который может вызвать проблемы), try (используется перед каждой функцией, которая может вызвать ошибку), catch позволяет вам корректно обрабатывать ошибки;



## Closure

1. :heavy_check_mark: [Синтаксис замыкания](http://goshdarnclosuresyntax.com/)
2. :heavy_check_mark: [100 Days of SwiftUI. Day 6: closures part one](https://www.hackingwithswift.com/100/swiftui/6)
3. :heavy_check_mark: [100 Days of SwiftUI. Day 7: closures part two](https://www.hackingwithswift.com/100/swiftui/7)

### 1. Вызов Замыкания
> при вызове closure мы не пишем название параметра: 
> ```swift
> var buyMagazine = { (name: String) -> Int in
>	let amount = 10
>	print("\(name) costs \(amount)")
>	return amount
>}
>buyMagazine(name: "Wired") // Extraneous argument label 'name:' in call
>Правильно: 
>buyMagazine("Wired")       // Wired costs 10
>
>```


### 2. Trailing closure (последующее замыкание)

1. :heavy_check_mark: [Trailing closure syntax](https://www.hackingwithswift.com/sixty/6/5/trailing-closure-syntax)
2. :heavy_check_mark: [Why does Swift have trailing closure syntax?](https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-have-trailing-closure-syntax)

Если последним параметром функции является замыкание, Swift позволяет использовать специальный синтаксис, называемый синтаксисом trailing closure. 
Вместо того, чтобы передавать ваше замыкание в качестве параметра, вы передаете его непосредственно после функции в фигурных скобках.

```swift
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel() {
    print("I'm driving in my car")
}
```

Поскольку других параметров нет, мы можем полностью исключить круглые скобки:

```swift
travel {
    print("I'm driving in my car")
}
```

Без trailing closure:

```swift
animate(duration: 3, animations: {
    print("Fade out the image")
})
```

С trailing closure:

```swift
animate(duration: 3) {
    print("Fade out the image")
}
```

> Do not forget the trailing () to execute the closure

```swift
let button: UIButton = {
  let button = UIButton(type: .system)
  button.titleLabel?.font = UIFont.systemFont(ofSize: ViewMetrics.fontSize)
  ...
  return button
}()
```

### 3. Trailing замыкание с параметром 

1. :heavy_check_mark: [Shorthand parameter names](https://www.hackingwithswift.com/sixty/6/8/shorthand-parameter-names)
2. :heavy_check_mark: [When should you use shorthand parameter names?](https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-shorthand-parameter-names)

Можно явно указывать принимаемые параметры: `(grade: Int) -> Stirng in return`

```swift
func scoreToGrade(score: Int, gradeMapping: (Int) -> String) {
    print("That's a \(gradeMapping(score)).")
}
scoreToGrade(score: 89) { (grade: Int) -> String in
    return "You scored \(grade) points"
}
```

Можно просто указать название принимаемого параметра: `grade in`

```swift
func scoreToGrade(score: Int, gradeMapping: (Int) -> String) {
    print("Wow! \(gradeMapping(score)).")
}
scoreToGrade(score: 89) { grade in
   "You scored \(grade) points"
}
```

Более того, Swift имеет более сокращенный синтаксис. Вместо того, чтобы писать, grade in мы можем позволить Swift автоматически указывать имена для параметров закрытия. 
Они вызываются со знаком доллара, а затем с числа, отсчитываемого от 0.

```swift
func scoreToGrade(score: Int, gradeMapping: (Int) -> String) {
    print("Wow! \(gradeMapping(score)).")
}
scoreToGrade(score: 89) {
   "You scored \($0) points"
}
```

### 4. Функция, возвращающая замыкание

1. :heavy_check_mark: [Returning closures from functions](https://www.hackingwithswift.com/sixty/6/10/returning-closures-from-functions)
2. :heavy_check_mark: [Optional: Returning closures from functions](https://www.hackingwithswift.com/quick-start/understanding-swift/returning-closures-from-functions)
3. :heavy_check_mark: [Test (4, 5, 11): Returning closures from functions](https://www.hackingwithswift.com/review/sixty/returning-closures-from-functions)

```swift
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel()
result("London")
```

### Capturing values

1. :heavy_check_mark: [Capturing values](https://www.hackingwithswift.com/sixty/6/11/capturing-values)
2. :heavy_check_mark: [Why do Swift’s closures capture values?](https://www.hackingwithswift.com/quick-start/understanding-swift/why-do-swifts-closures-capture-values)
3. :heavy_check_mark: [Closures Capture Semantics: Catch them all!](https://alisoftware.github.io/swift/closures/2016/07/25/closure-capture-1/)
4. :heavy_check_mark: [Text: Capturing values](https://www.hackingwithswift.com/review/sixty/capturing-values)

```swift
func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result = travel()
result("London")     // 1. I'm going to London
result("London")     // 2. I'm going to London
result("London")     // 3. I'm going to London
```

### 4.

C замыканиями нужно быть осторожным, они создают [retain cycle](/3%20Memory%20and%20Concurrency/3.1%20Memory/3.1.3%20ReferenceCounting/3.1.3.1%20RefCountIniOS/3.1.3.1.4%20CaptureList/3.1.3.1.4.1%20RetainCycle.md):

```swift
class TeamMember {
  var closure: (() -> ())?
  func method(closure: () -> ()?) {
    closure()
  }
  func describeYourself() {
    print(“I’m!“)
  }
  func describeOtherself() {
    print(“I’!“)
  }
  deinit {
    print(“Deinit”)
  }
}
var member: TeamMember? = TeamMember()
//ЗДЕСЬ СОЗДАЕТСЯ retain cycle
member!.closure = { [weak member] in
  member?.describeYourself()
}
member!.closure?()
//А ЗДЕСЬ - НЕТ
member!.method(closure: {
  member!.describeOtherself()
})
//member!.closure = nil
//member!.method(closure: {nil})
member = nil
```

### 5. 
Закрытия - это обычные типы, поэтому их можно помещать в массивы, словари и т.д.
Когда это происходит, они хранятся в куче (т.е. являются справочными типами).
Они захватывают окружающие их переменные, если у меня есть замыкание, то это просто функция, встроенная прямо в мой код.
Это может создать цикл памяти, потому что можно перехватить класс, в котором находится массив операций. Если вы это сделаете, то это замыкание перехватит этот класс в кучу. И этот класс через свой массив перехватил замыкание в куче. Они указывают друг на друга через массив. That closure is keeping the class, the class is keeping the closure.

### 6. Capture List

1)
```swift  
struct Cars {
    var name = "Tesla"
}

var namedCars = Cars()

let closure = { [namedCars] in
  print("I love \(namedCars.name)")
}

namedCars.name = "mercedes"

closure()
```

Будет напечатано: I love Tesla. Список захвата создаст копию переменной в момент объявления замыкания. Это означает, что захваченная переменная не изменит своего значения, даже после присвоения нового значения.

Если вы опустите список захвата в замыкании, то компилятор будет использовать ссылку, а не копию. Вызов замыкания отразит изменение в переменной:

```swift
struct Cars {
    var name = "Tesla"
}

var namedCars = Cars()

let closure = { in
  print("I love \(namedCars.name)")
}

namedCars.name = "mercedes"

closure() // I love mercedes
```

2) Ситуация другая с классами:  

```swift
class Cars {
    var name = "Tesla"
}

var namedCars = Cars()

let closure1 = { [namedCars] in
  print("I love \(namedCars.name)")
}

let closure2 = {
  print("I love \(namedCars.name)")
}

namedCars.name = "mercedes"

closure1() // I love mercedes
closure2() // I love mercedes
```
