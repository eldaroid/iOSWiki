## Protocol (интерфейс)

Protocol содержит сигнатуры функций и свойств, которые должны быть реализованы соответствующими объектами, структурами, enum

### Inheritance в протоколах

В отличии от [классов](/Swift/DataStructures/ReferenceTypes/Class/Class.md) (у которых методы всегда вызываются у child объектов), протоколы могут вызвать методы и у parent, если не полагаться на type inference (аннотация типов `let tmp: String`).


```swift
protocol DrowProtocol { func draw() }
extension DrowProtocol {
    func draw() {
        print("func draw in protocol")
    }
}

extension DrowProtocol {
    func pointing() {
        print("func pointing in protocol")
    }
}

final class ParentClass: DrowProtocol {
    func draw() {
        print("func draw in class")
    }
    
    func pointing() {
        print("func pointing in class")
    }
}

// virtual table method dispatch
let instanceOfClass: ParentClass = ParentClass()
instanceOfClass.draw()     // func draw in class
instanceOfClass.pointing() // func pointing in class

let instanceOfProtocol: DrowProtocol = ParentClass()
// witness table method dispatch
instanceOfProtocol.draw()     // func draw in class
// direct (static) method dispatch
instanceOfProtocol.pointing() // func pointing in protocol
```

У extension протоколов [static method dispatch](/Swift/MethodDispatch/MethodDispatch.md) работает таким образом, что уже во время сборки компилятор знает, что вызывать и когда (те. в данном случае отдает приоритет **типу** для вызова выполнения адреса инструкций).

У протоколов [witness table method dispatch](/Swift/MethodDispatch/MethodDispatch.md) производит вызов функции из таблицы, которая хранит сначала реализацию класса, потом уже   протокола.

У классов [virtual table method dispatch](/Swift/MethodDispatch/MethodDispatch.md) отдается приоритет всегда child объекту.



#### Optional

1. [How to make optional protocol methods](https://www.hackingwithswift.com/example-code/language/how-to-make-optional-protocol-methods)

```swift
protocol Test {
    optional func myFunc() {}
}
```

Обратите внимание, однако, что для того, чтобы это работало, ваш протокол должен быть помечен атрибутом @objc:

```swift
@objc protocol Test {
    @objc optional func myFunc() {}
}
```

Это также означает, что этот протокол будет применим только к классам, но не к structs, enums and non-NSObject classes.

Это альтернатива `extension` к протоколу.

#### ПРИМЕЧАНИЯ

1) **Ретроактивное моделирование в POP** - если вы определяете расширение для добавления новых функций к существующему типу, новые функции будут доступны для всех существующих экземпляров этого типа, даже если они были созданы до определения расширения.

2) Расширения могут добавлять новые вычисляемые свойства, но не могут добавлять сохраненные свойства или добавлять наблюдателей свойств к существующим свойствам.
