## Strong reference

По умолчанию для всех свойств, констант и переменных.

Пока у кого-то есть сильная ссылка на объект, этот объект будет существовать в [куче](../../RandomAccessMemory/Heap.md).

```swift
//Captures a strong reference to self
var myLazyVariable = { [ self ]
     return self.myProp * 3
}()
```

Не путать с [lazy var closure](./LazyClosure.md)

---

[Previous Theme ARC](../ARC.md) | [Back To Github Contents](https://github.com/eldaroid/iOSWiki) |  [Next Theme Unowned](./Unowned.md)