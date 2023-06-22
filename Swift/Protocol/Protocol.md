## Protocol (интерфейс)

#### Inheritance в протоколах

В отличии от [классов](/Swift/DataStructures/StructAndClass/Class/Class.md) (у которых методы всегда вызываются у child объектов), протоколы могут вызвать методы и у parent, если не полагаться на type inference (аннотация типов `let tmp: String`).

```swift
protocol WeCanDrow {}

extension WeCanDrow {
    func draw() {
        print("func draw in protocol")
    }
}


class ParentClass: WeCanDrow {
    func draw() {
        print("func draw in class")
    }
}

let instanceOfProtocol: WeCanDrow  = ParentClass()
let instanceOfClass: ParentClass  = ParentClass()

// virtual method dispatch
instanceOfProtocol.draw() // func draw in protocol

// witness method dispatch
instanceOfClass.draw() // func draw in class
```

У протоколов [witness method dispatch](/Swift/MethodDispatch/MethodDispatch.md) работает таким образом, что отдает приоритет **типу** для вызова выполнения адреса инструкций.

У классов [virtual method dispatch](/Swift/MethodDispatch/MethodDispatch.md) отдается приоритет всегда child объекту.

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

1) **Ретроактивное моделирование в POP   ** - если вы определяете расширение для добавления новых функций к существующему типу, новые функции будут доступны для всех существующих экземпляров этого типа, даже если они были созданы до определения расширения.

2) Расширения могут добавлять новые вычисляемые свойства, но не могут добавлять сохраненные свойства или добавлять наблюдателей свойств к существующим свойствам.
