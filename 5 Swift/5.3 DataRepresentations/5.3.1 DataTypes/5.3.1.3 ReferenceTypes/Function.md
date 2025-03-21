## Function

1. [ARC в замыканиях](https://www.youtube.com/watch?v=-oPDbicto7k&list=PLtovLaW_R9-N-KECYTUWqQaVtBXhufJfw&index=34&ab_channel=SwiftBook)

Swift позволяет нам использовать функции, как и любой другой тип, например строки и целые числа. Это означает, что вы можете создать функцию и присвоить ее переменной, вызвать эту функцию, используя эту переменную, и даже передать эту функцию другим функциям в качестве параметров. Функции, используемые таким образом, называются замыканиями

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

Swift не позволит вам случайно запустить `throws` функцию, поэтому нужно использовать do (запускает раздел кода, который может вызвать проблемы), try (используется перед каждой функцией, которая может вызвать ошибку), catch позволяет вам корректно обрабатывать ошибки;

## defer (отложить)

`defer` используется для того, чтобы отложить выполнение блока кода до завершения текущей области видимости:

```swift
func deferExample() {
    defer { 
        print("defer")
    }
    print("Область видимости")
}
```

Особенностью `defer` - выполняются в обратном порядке их объявления ([LIFO — Last In, First Out](/3%20Memory%20and%20Concurrency/3.1%20Memory/3.1.2%20RandomAccessMemory/3.1.2.2%20Stack.md)):

```swift
func deferExample() {
    func someInnerFunction() {
        defer { print(1) }
    }

    defer {
        print(2)
        defer { print(3) }
    }

    defer {
        print(4)
        someInnerFunction()
    }
    print(5)
}
// 5 4 1 2 3
```


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

## Пользовательские операторы (infix, prefix, postfix operator)

Каждый оператор в Swift — это функция с определённой сигнатурой, которая определяет, как оператор будет взаимодействовать с операндами. Это позволяет переопределять существующие операторы и создавать новые операторы для пользовательских типов.

### Стандартные инфиксные операторы в Swift

#### Арифметические операторы:

* `+:` сложение (например, a + b)
* `-:` вычитание (например, a - b)
* `*:` умножение (например, a * b)
* `/:` деление (например, a / b)
* `%:` остаток от деления (например, a % b)

#### Операторы присваивания:

* `=:` присваивание (например, a = b)
* `+=:` сложение с присваиванием (например, a += b)
* `-=:` вычитание с присваиванием (например, a -= b)
* `*=:` умножение с присваиванием (например, a *= b)
* `/=:` деление с присваиванием (например, a /= b)

#### Операторы сравнения:

* `==:` равно (например, a == b)
* `!=:` не равно (например, a != b)
* `<:` меньше (например, a < b)
* `>:` больше (например, a > b)
* `<=:` меньше или равно (например, a <= b)
* `>=:` больше или равно (например, a >= b)

#### Логические операторы:

* `&&`: логическое "и" (например, a && b)
* `||:` логическое "или" (например, a || b)

#### Побитовые операторы:

* `&:` побитовое "и" (например, a & b)
* `|:` побитовое "или" (например, a | b)
* `^:` побитовое исключающее "или" (например, a ^ b)
* `<<:` побитовый сдвиг влево (например, a << b)
* `>>:` побитовый сдвиг вправо (например, a >> b)

####  Оператор диапазона:

* `...:` закрытый диапазон (например, 1...5), включает все числа от 1 до 5
* `..<:` полузакрытый диапазон (например, 1..<5), включает числа от 1 до 4






