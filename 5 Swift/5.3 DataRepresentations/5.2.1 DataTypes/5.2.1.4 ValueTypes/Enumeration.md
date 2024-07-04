## Enumeration (enum) - перечисления

## Типы перечислений (либо один тип, либо другой)

* **with raw value** - enum в котором каждый случай имеет заранее определенное необработанное значение;

Пример: 
```swift
enum withRawValue: String {
    case iosProgramming
    case kotlinProgramming
    // или
    case ios = "iosProgramming"
    case kotlin = "kotlinProgramming"
}
```

* **with associated value** - это перечисление, в котором каждый случай имеет ассоциированное с ним значение;

Пример: 
```swift
enum withAssociateValue {
    case iosProgramming(version: Int)
    case kotlinProgramming(version: Int)
}
```

##

What is raw value and associated value enum in Swift?

A raw value enum in Swift is an enum where each case has a pre-defined raw value. An associated value enum is an enum where each case has a value associated with it.

What are enum associated values?

Enum associated values are values that are associated with each case of an enum. They can be of any type and are used to provide additional information about the case.




