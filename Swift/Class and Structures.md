# Class

## Ресурсы для чтения

1. :heavy_check_mark: [100 Days of SwiftUI. Day 10. All about classes](https://www.hackingwithswift.com/100/swiftui/10)
2. :heavy_check_mark: [Why do classes have deinitializers and structs don’t?](https://www.hackingwithswift.com/quick-start/understanding-swift/why-do-classes-have-deinitializers-and-structs-dont)
3. :heavy_check_mark: [Typecasting (as ...)](https://www.hackingwithswift.com/sixty/10/10/typecasting)
4. :heavy_check_mark: [When is type casting useful in Swift?](https://www.hackingwithswift.com/quick-start/understanding-swift/when-is-type-casting-useful-in-swift)
5. :heavy_check_mark: [100 Days of SwiftUI. Day 14. Extention about classes](https://www.hackingwithswift.com/read/0/16/classes)

# Различия struct и class

Классы и структуры дают разработчикам Swift возможность создавать собственные сложные типы со свойствами и методами, но у них есть пять важных отличий:

* Классы не имеют синтезированных поэлементных инициализаторов.
* Один класс может быть построен на основе другого класса («унаследован от»), получив его свойства и методы.
* Копии структур всегда уникальны, тогда как копии классов фактически указывают на одни и те же общие данные.
* У классов есть [деинициализаторы](https://www.youtube.com/watch?v=G7jBlu3-yYo&ab_channel=%D0%A2%D0%9E%D0%9F%D0%9B%D0%95%D0%A1) - методы, вызываемые при уничтожении экземпляра класса, а у структур - нет.
* [Mutability1](https://www.hackingwithswift.com/sixty/8/7/mutability)/[Why can variable properties in constant classes be changed?](https://www.hackingwithswift.com/quick-start/understanding-swift/why-can-variable-properties-in-constant-classes-be-changed) Свойства переменных в постоянных классах можно свободно изменять, а свойства переменных в постоянных структурах - нет.
* При изменении свойства в структуре - она каждый раз пересоздается, а класс - нет, поэтому структура автоматически подменяет на экраны текста, а в классах нужно помечать изменчивые переменные ключевым словом `@Published`

## Наследование или подкласс класса

Класс, от которого вы наследуете, называется «родительским» или «суперклассом», а новый класс называется «дочерним» классом. 

Наследование широко используется в Cocoa Touch, даже в самых простых программах.

`class CountrySinger: Singer { }` - Класс (`Singer`), от которого вы наследуете, называется «родительским» или «суперклассом», а новый класс (`CountrySinger`) называется «дочерним» или подклассом. 

## Final classes

1. :heavy_check_mark: [final](https://www.hackingwithswift.com/sixty/8/4/final-classes)

Final class меняет метод диспатч на дайрект (оптимизация). Без final он будет думать, что мы можем наследовать и хранить в Table Dispatch.

## This code prints the same output twice – true or false?

```swift
class Statue {
    var sculptor = "Unknown"
}
var venusDeMilo = Statue()
venusDeMilo.sculptor = "Alexandros of Antioch"
var david = Statue()
david.sculptor = "Michaelangelo"
print(venusDeMilo.sculptor)
print(david.sculptor)
```
>  This creates two different statues, so it prints two different sculptors

```swift
class Starship {
	var maxWarp = 9.0
}
var voyager = Starship()
voyager.maxWarp = 9.975
var enterprise = voyager
enterprise.maxWarp = 9.6
print(voyager.maxWarp)
print(enterprise.maxWarp)
```

## Final

1. :heavy_check_mark: [Method Dispatch in Swift](https://www.rightpoint.com/rplabs/switch-method-dispatch-table)

`final` меняет метод диспатч на дайрект (оптимизация), без `final` он будет думать, что мы можем наследовать и хранить в table dispatch.

final enables direct dispatch on a method defined in a class. This keyword removes the possibility of any dynamic behavior. It can be used on any method, even in an extension where the dispatch would already be direct. This will also hide the method from the Objective-C runtime, and will not generate a selector.

!!!Прочитать про 3 метода [Dispatch](/Swift/MethodDispatch/MethodDispatch.md)

---

## Struct

1. :heavy_check_mark: [100 Days of SwiftUI. Day 8: Structs, properties, and methods](https://www.hackingwithswift.com/100/swiftui/8)
2. :heavy_check_mark: [100 Days of SwiftUI. Day 9: Access control, static properties, and laziness](https://www.hackingwithswift.com/100/swiftui/9)
3. :heavy_check_mark: [Строки, целые числа, массивы, словари и логические значения - это структуры](https://www.hackingwithswift.com/quick-start/understanding-swift/why-are-strings-structs-in-swift)
> Это не случайно: структуры в Swift простые, быстрые и эффективные, а это значит, что мы можем создавать и уничтожать их столько, сколько нам нужно, не слишком заботясь о производительности.
4. :heavy_check_mark: [Why using isEmpty is faster than checking count == 0](https://www.hackingwithswift.com/articles/181/why-using-isempty-is-faster-than-checking-count-0)
5. :heavy_check_mark: [!!! How do Swift’s memberwise initializers work?](https://www.hackingwithswift.com/quick-start/understanding-swift/how-do-swifts-memberwise-initializers-work)
6. :heavy_check_mark: [Why can variable properties in constant classes be changed?](https://www.hackingwithswift.com/quick-start/understanding-swift/why-can-variable-properties-in-constant-classes-be-changed)
7. :negative_squared_cross_mark: [Structs and mutation in Swift](https://chris.eidhof.nl/post/structs-and-mutation-in-swift/)

Структуры позволяют нам создавать собственные типы данных из нескольких небольших типов. Например, вы можете объединить три строки и логическое значение и сказать, что это представляет пользователя в вашем приложении.

## init()

Без init() нам обязательно нужно указывать при создании экземпляра структура нужно обязательно указать имя.

```swift
struct User {
    var username: String
}
var user = User(username: "twostraws")
```

С init() нам не обязательно указывать имя, это называется custom initializer:

```swift
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// Не работает!!!
// var user = User(username: "twostraws")
// Работает:
var user = User()
user.username = "twostraws"
```

Также можно использовать memberwise initializers:

```swift
struct User {
    var name: String = "Anonymous"
    var yearsActive = 0
}

var user = User(name: "Alan", yearsActive: 32)
```

### Failable initializer

1. :heavy_check_mark: [Failable initializers](https://www.hackingwithswift.com/sixty/10/9/failable-initializers)
```swift
let str = "5"
let num = Int(str)
print(num) // Optional(5)
```

У нас `num: String? = Optional(5)`, потому что str может быть не 5, тогда будет равен `num = nil`. Можно самостоятельно написать такой инициализатор, используя `init?()`.

## Иерархия структуры

Если нам необходимо использовать структуру в другой области видимости и по иерархии выше, то нам необходимо использовать `import Assessment` там, где мы будем использовать эту структуру. 
И саму структуру поменять на `public struct`, а также внутри использовать `public init() {}` + SwiftUI `public var body: some View`
