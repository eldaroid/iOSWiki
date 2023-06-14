## Existential Types

1. [Swift: Existential Types](https://pavbox.medium.com/swift-existential-types-d861d682b668)
2. [416 WWDC 2016 ](https://developer.apple.com/videos/play/wwdc2016/416/)

В Swift есть интересная фича, о которой мало кто знает, но благодаря дружественному интерфейсу, мы постоянно её используем, даже не замечая этого — экзистенциальные типы (existential types).

Экзистенциальные типы можно понимать как некий абстрактный объект, о котором мы ничего не знаем, но примерно понимаем какие свойства он содержит.

### Зачем нужны экзистенциальные типы?

Идея экзистенциальных типов в Swift пришла из [Haskell](/ComputerScience/Languages/Paradigm/Declarative/FunctionalProgramming(FP).md), в документации которого они описаны как следующий [предикат](https://ru.wikipedia.org/wiki/Предикат):

```swift
∀x Q(x)⇒ P = ∃x Q(x) ⇒ P
// где предикат P определяется однозначно, если все запрашиваемые им требования к объекту Q удовлетворены.
```

Это означает, что определение объекта производится по значению (свойствам), а не его типу. Пока не задумывайтесь о том, как это выглядит в коде. Важнее понять главное отличие экзистенциальных типов от [шаблонов (generic)](./Generics.md):

* [Generics](./Generics.md) определяет объект по четким ограничениям типов (по типу объекта);
* Existential определяет объект по его свойствам (в протоколе);

### Экзистенциальные типы vs [Generics](./Generics.md)

Из определения видно, что экзистенциальные типы похожи на [generic](./Generics.md), а именно тем, что **заранее конкретный тип объекта не определен**. С точки зрения Swift, экзистенциальные типы позволяют строить абстракции над значениями (value-level abstraction) — в этом и кроется отличие от шаблонов, использующих абстракции над типами (type-level abstraction).

На практике мы довольно часто используем экзистенциальные типы. Например, каждый раз, когда ограничиваем параметры ввода и возвращаемое значение функции через протокол:

```swift
// Generics-like
func collect<T: AnyProtocol>(value: T, and anotherValue: T) -> [T] {
  return [value, anotherValue]
}
// Existential Types
func collect(value: AnyProtocol, and anotherValue: AnyProtocol) -> [AnyProtocol] {
  return [value, anotherValue]
}
```
Для нас, как для разработчиков, различие на первый взгляд незаметно, мы просто используем “протокол как тип данных”. Однако, с точки зрения Swift это не тоже самое, что [generic](./Generics.md).

Дело в том, что [generic](./Generics.md) являются статически-генерируемой структурой. Хотя в исходном коде они позволяют избегать дублирования, компилятор фактически создает явную перегружаемую функцию на каждый используемый им тип:

```swift
// generics in source code
func compare<T: Comparable>(value: T, and anotherValue: T) -> Bool {
  return value == anotherValue
}
compare<Int>(value: 5, and: 10)
compare<Double>(value: 10.0, and: 5.0)
// generics after compile (by demand)
func compare(value: Int, and anotherValue: Int) -> Bool {
  return value == anotherValue
}
func compare(value: Double, and anotherValue: Double) -> Bool {
  return value == anotherValue
}
```

Такой код создается во время компиляции приложения, в то время как экзистенциальные типы являются динамечиски-генерируемыми, то есть их определение происходит во время исполнения кода.

### На практике

Они также являются неочевидной конструкцией языка, но имеют высокую важность для будущих фичей Swift. Например, благодаря экзистенциальным типам, параметры могут быть переданы в функцию, основываясь на перечислении списка протоколов (вместо создания класса, реализующего их):

```swift
// Existential Complex Types
func isEquals(with value: Collection & Equatable) -> Bool {
  return self === value
}
```

При такой записи компилятор Swift не сможет определить какой конкретно тип поступает на вход функции. Он знает только то, что этот тип соответствует двум протоколам Collection и Equatable. Аналогичные возможности мы получаем при описании возвращаемого значения.







