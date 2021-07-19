[Glossary of Common Swift Terms](https://www.hackingwithswift.com/glossary)

## Интерполяция

"hello, \\(name)" - \() это интерполяция (возможность помещать переменные внутри ваших строк) - текст может динамически изменяться

```
extension String.StringInterpolation {
    mutating func appandInterpolation(if condition: @autoclosure () -> Bool, _ literal: StringLiteralType {
        guard condition() else { return }
        appendLiteral(literal)
        }
}

let toggle = true
```

1) print("Intepolation: \(if: toggle, "this is true")")

то же самое, что и 
 
2) print("Intepolation: \(toggle \? "this is true" \: "") ")

Вывод: 1) Interpolation: this is true
       2) Interpolation: this is true

## Аннотация типов

let name: String = "Tanya" - явно указать тип ваших данных

Когда следует использовать аннотации типов в Swift?

* Swift не может понять, какой тип следует использовать

> Обычно такое происходит в более сложном коде. Например, если вы загружали какие-то данные из Интернета и вы знаете их тип, а Swift может не знать это заранее.

* Вы хотите, чтобы Swift использовал тип, отличный от стандартного

> var score: Double = 1000; print = 1000.0

* Вы пока не хотите присваивать значение

> var name: String

## Type inference

let name = "Tanya" - полагаться на вывод типа Swift

var score = 1000; print = 1000

## **Variadic function**

1. :heavy_check_mark: [Variadic functions](https://www.hackingwithswift.com/sixty/5/7/variadic-functions)
2. :heavy_check_mark: [When to use variadic functions](https://www.hackingwithswift.com/quick-start/understanding-swift/when-to-use-variadic-functions)

Вариативные функции Swift позволяют нам принимать любое количество параметров одного типа, разделенных запятыми, для этого достаточно написать `...` после его типа. Внутри функции они передаются нам в виде массива, который мы можем индексировать, перебирать и т. Д.

Итак, `Int` параметр - это одно целое число, тогда как `Int...` это ноль или более целых чисел - потенциально сотни.

Внутри функции Swift преобразует значения, которые были переданы в массив целых чисел, так что вы можете перебирать их по мере необходимости.

```
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5) // 1 squared is 1 \n 2 squared is 4 \n 3 squared is 9 \n 4 squared is 16 \n 5 squared is 25
```

`print("Haters", "gonna", "hate")` - print() also variadic function

## Property observers

1. :heavy_check_mark: [When should you use willSet rather than didSet?](https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-willset-rather-than-didset)

* willSet

* didSet

## Property wrappers

* @State - все то, что изменяется

* @StateObject

* @ObservedObject

* @Publishers

## Computed property

Переменная, которая считается во время ее вызова.

```swift
    var investmentPlan: String {
        if age < 30 {
            return "Shares"
        } else {
            return "Bonds"
        }
    }
```

> ! Всегда должна быть var
> ! Всегда после переменной должен быть указан тип
> ! Всегда должна возвращать это указанный тип


## *Свойство* - numberOfRow: 
```
protocol TableViewViewModelType {
    var numberOfRow: Int { get }
}
```

## *Метод* - numberOfRow:

```
protocol TableViewViewModelType {
    func numberOfRow() -> Int
}
```

## *Экзмепляр класса*

Давайте создадим класс и назовем его `классом Person`. Затем вы создаете `экземпляр класса Person`. Давайте назовем его `Боб`. Итак `bob = Person()`. Дело в том, что и `bob`, и `Person` являются `объектами`. Когда вы делаете `Person()`, вы фактически вызываете конструктор `объекта класса Person`, который дает вам `объект экземпляра`, а именно `bob`.

## *Parameter*

```
func square(number: Int) {
    print(number * number)
}
```

number - это параметр функции

## *data buinding* 

решает проблему обновления данных, которую решает SwiftUI. То есть data buinding - это имплементация 

## (Non-modal view) Не Модальные окна

- это просто карта например в приложениие Landmarks

## (Modal Popups) Модальные всплывающие окна

- Модальным называется такое представление, при котором ничего нельзя выполнить, пока оно не будет удалено с экрана (всплывающие окна). Как например всплывающее окно при нажатии на edit в Landmarks

When you present a view modally, the destination view covers the source view and replaces the current navigation stack.

You present a view modally when you want to break out of your app’s normal flow.

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



