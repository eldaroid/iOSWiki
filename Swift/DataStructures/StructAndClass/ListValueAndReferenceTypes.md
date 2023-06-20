## Value and Reference Types

|Value Types (хранятся в [стеке](/Memory%20and%20Concurrency/Memory/RandomAccessMemory/Stack.md)) | Referene Types (хранятся в [куче](/Memory%20and%20Concurrency/Memory/RandomAccessMemory/Heap.md))|
|------------|------------|
| Struct | Class|
| Enum | Function|
| Double | Closure|
| String | |
| Set | |
| Tuple | |
| Array | |
| Dictionary | |

### Компилятор Swift может упаковывать **типы значений** или [протоколы](/Swift/Protocol/Protocol.md) и [generic](/Swift//AbstractMechanism/Generics.md), размещая их в [куче](/Memory%20and%20Concurrency/Memory/RandomAccessMemory/Heap.md):

1) При соблюдении [протокола](/Swift/Protocol/Protocol.md). Помимо затрат на выделение ресурсов, возникают дополнительные накладные расходы, когда тип значения хранится в [экзистенциальном контейнере](/Swift/AbstractMechanism/ExistentialTypes.md)
2) При смешивании value и reference типов.
3) [Generic](/Swift//AbstractMechanism/Generics.md) с value типом:

```swift
struct Bas<T> {
    var x: T
    init(xx: T) {
        x = xx
    }
}
```

4) Без capture list происходит [захватывание](https://shantaram-kokate-swift.medium.com/capture-list-in-swift-a7d7d1328c84) value type как [strong ссылку](/Memory%20and%20Concurrency/Memory/ReferenceCounting/CaptureList/Strong.md). И наоборот, с `[variable] in` создается копия (локальная переменная) внутри замыкании.
5) Если от значения не требуется ссылка на местоположение (например, получение ссылки на структуру с помощью &), структура может быть расположена полностью в регистрах: при работе с небольшими структурами ее члены могут быть размещены в регистрах процессора, так что она даже не живет в памяти. (Это особенно актуально для небольших, возможно, недолговечных типов значений, таких как `Ints` и `Doubles`, которые гарантированно помещаются в регистры). [Ссылка](https://stackoverflow.com/questions/71071416/stack-and-heap-misunderstanding-in-swift)
6) Большие типы значений действительно выделяются в [heap](/Memory%20and%20Concurrency/Memory/RandomAccessMemory/Heap.md): хотя это деталь реализации Swift, которая теоретически может измениться в будущем, структуры, размер которых превышает 3 машинных слова (например, больше 12 байт на 32-битной машине или 24 байт на 64-битной машине), практически гарантированно будут выделены и сохранены в куче. Это не противоречит ценности типа значения: его по-прежнему можно произвольно копировать по желанию компилятора, и компилятор делает очень хорошую работу, чтобы избежать ненужных выделений там, где это возможно.

> Если размер вашего типа значения не может быть определен во время компиляции, или если ваш тип значения рекурсивно содержит/содержится ссылочным типом.

### Компилятор Swift может [продвигать](https://github.com/apple/swift/blob/62ccf81f7748e3e2c8626354d1ecb3adbd26b063/lib/SILOptimizer/Transforms/StackPromotion.cpp) **ссылочные типы** для размещения в [стеке](/Memory%20and%20Concurrency/Memory/RandomAccessMemory/Stack.md):

1) Когда их размер фиксирован;
2) Когда время жизни может быть предсказано;

> Если размер вашего типа значения может быть определен во время компиляции, или если ваш тип значения не содержит рекурсию / не содержится ссылочным типом

Эта оптимизация происходит на этапе генерации [SIL](https://github.com/apple/swift/blob/main/docs/SIL.rst).

> [Swift Intermediate Language (SIL)](https://github.com/apple/swift/blob/main/docs/SIL.rst) - это промежуточный язык высокого уровня, используемый компилятором Swift, заполняющий пробел между AST и LLVM IR, подходящий для дальнейшего анализа и оптимизации кода Swift.

### Пример хранения данных структуры и класса

#### 1) Класс в классе

```swift
class ClassLocation {
    var name: String
    var point: ClassPoint
}
```

    ┌──────────────────────┐      ┌────────────────┐
    │       Location       │ ┌───▶│   ClassPoint   │
    ├──────────┬───────────┤ │    ├────────┬───────┤
    │   name   │   point ──┼─┘    │   x    │   y   │
    └──────────┴───────────┘      └────────┴───────┘

#### 2) Структура в классе 

```swift
class ClassLocation {
    var name: String
    var point: StructPoint
}
```

    ┌────────────────────────────┐
    │       ClassLocation        │
    ├──────────┬─────────────────┤
    │          │   StructPoint   │
    │   name   ├────────┬────────┤
    │          │  x     │  y     │
    └──────────┴────────┴────────┘


