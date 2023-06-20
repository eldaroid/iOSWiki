# Class

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
