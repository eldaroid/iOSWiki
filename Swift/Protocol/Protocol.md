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

#### ПРИМЕЧАНИЯ

1) Если вы определяете расширение для добавления новых функций к существующему типу, новые функции будут доступны для всех существующих экземпляров этого типа, даже если они были созданы до определения расширения.

2) Расширения могут добавлять новые вычисляемые свойства, но не могут добавлять сохраненные свойства или добавлять наблюдателей свойств к существующим свойствам.
