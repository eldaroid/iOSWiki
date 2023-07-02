## Weak reference

Ссылается на объект в [куче](../../RandomAccessMemory/Heap.md), но эта ссылка не учитывается при подсчет ссылок, когда объект освобождается из памяти weak ссылка установливается в nil (обозначая что объект уже освободился из памяти). Соответственно weak ссылки принадлежит к типу Optional так как могут установлены в nil. 

```swift
//Captures a weak reference to self
var myLazyVariable = { [ weak self ]
     return self.myProp * 3
}()
```

## [Side Tables](./SideTables.md)

Как только мы начинаем ссылаться на объект слабо weak reference, то создается боковая таблица или [side table](./SideTables.md), и теперь объект вместо сильного счетчика ссылок хранит ссылку на боковую таблицу. Сама боковая таблица также имеет ссылку на объект.

## Unowned vs Weak

Мы устанавливаем `weak` ссылку на тот объект, который может уйти из памяти раньше, т.е. время жизни этого объекта должно быть меньше, чем время жизни объекта из которого мы обращаемся к `weak`

Мы устанавливаем [unowned](./Unowned.md) ссылку на тот обхект, чье время жизни >= времени жизни объекта из которого мы вызываем [unowned](./Unowned.md)

---

[Previous Theme Unowned](./Unowned.md) | [Back To Github Contents](https://github.com/eldaroid/iOSWiki) |  [Next Theme ARC](../ARC.md)
