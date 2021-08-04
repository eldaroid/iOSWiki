1. :heavy_check_mark: [100 Days of SwiftUI. Day 10](https://www.hackingwithswift.com/100/swiftui/10)
2. :heavy_check_mark: [Why do classes have deinitializers and structs don’t?](https://www.hackingwithswift.com/quick-start/understanding-swift/why-do-classes-have-deinitializers-and-structs-dont)
3. :heavy_check_mark: [Typecasting (as ...)](https://www.hackingwithswift.com/sixty/10/10/typecasting)
4. :heavy_check_mark: [When is type casting useful in Swift?](https://www.hackingwithswift.com/quick-start/understanding-swift/when-is-type-casting-useful-in-swift)

# Различия struct и class

Классы и структуры дают разработчикам Swift возможность создавать собственные сложные типы со свойствами и методами, но у них есть пять важных отличий:

* Классы не имеют синтезированных поэлементных инициализаторов.
* Один класс может быть построен на основе другого класса («унаследован от»), получив его свойства и методы.
* Копии структур всегда уникальны, тогда как копии классов фактически указывают на одни и те же общие данные.
* У классов есть [деинициализаторы](https://www.youtube.com/watch?v=G7jBlu3-yYo&ab_channel=%D0%A2%D0%9E%D0%9F%D0%9B%D0%95%D0%A1) - методы, вызываемые при уничтожении экземпляра класса, а у структур - нет.
* [Mutability1](https://www.hackingwithswift.com/sixty/8/7/mutability)/[Why can variable properties in constant classes be changed?](https://www.hackingwithswift.com/quick-start/understanding-swift/why-can-variable-properties-in-constant-classes-be-changed): Свойства переменных в постоянных классах можно свободно изменять, а свойства переменных в постоянных структурах - нет.

## Наследование или подкласс класса

Класс, от которого вы наследуете, называется «родительским» или «суперклассом», а новый класс называется «дочерним» классом.

## Final classes

1. :heavy_check_mark: [final](https://www.hackingwithswift.com/sixty/8/4/final-classes)
2. :heavy_check_mark: [final](https://www.hackingwithswift.com/sixty/8/4/final-classes)

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

!!!Прочитать про 3 метода Dispatch
