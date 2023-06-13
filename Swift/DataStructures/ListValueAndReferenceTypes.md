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

Компилятор Swift может упаковывать **типы значений** и размещать их в [куче](/Memory%20and%20Concurrency/Memory/RandomAccessMemory/Heap.md):

1) При соблюдении протокола. Помимо затрат на выделение ресурсов, возникают дополнительные накладные расходы, когда тип значения хранится в экзистенциальном контейнере и превышает длину 3 машинных слов.
2) При смешивании value и reference типов.
3) Generic с value типом:

```swift
struct Bas<T> {
    var x: T
    init(xx: T) {
        x = xx
    }
}
```

Компилятор Swift может [продвигать](https://github.com/apple/swift/blob/62ccf81f7748e3e2c8626354d1ecb3adbd26b063/lib/SILOptimizer/Transforms/StackPromotion.cpp) **ссылочные типы** для размещения в [стеке](/Memory%20and%20Concurrency/Memory/RandomAccessMemory/Stack.md):

1) Когда их размер фиксирован;
2) Когда время жизни может быть предсказано;

Эта оптимизация происходит на этапе генерации [SIL](https://github.com/apple/swift/blob/main/docs/SIL.rst).

> [Swift Intermediate Language (SIL)](https://github.com/apple/swift/blob/main/docs/SIL.rst) - это промежуточный язык высокого уровня, используемый компилятором Swift, заполняющий пробел между AST и LLVM IR, подходящий для дальнейшего анализа и оптимизации кода Swift.



