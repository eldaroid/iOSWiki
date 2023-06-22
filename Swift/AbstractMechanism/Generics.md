## Generic

В Swift вы можете использовать generics в классах, структурах и перечислениях.

Generics Types (шаблонные типы или шаблоны) можно понимать как универсальные типы данных, позволяющие создавать классы и функции без привязки к конкретному типу данных.

## Зачем нужны?

Generics устраняют проблему дублирования кода. Если у вас есть метод, который принимает параметры одного типа, иногда приходится дублировать код, чтобы работать с параметрами другого типа.

Например, в этом коде вторая функция — это «клон» первой, за исключением того, что у неё параметры string, а не integer.

```swift
func areIntEqual(_ x: Int, _ y: Int) -> Bool {
  return x == y
}

func areStringsEqual(_ x: String, _ y: String) -> Bool {
  return x == y
}

areStringsEqual("ray", "ray") // true
areIntEqual(1, 1) // true
```

Применяя generics, вы совмещаете две функции в одной и одновременно обеспечиваете безопасность типов:

```swift
func areTheyEqual<T: Equatable>(_ x: T, _ y: T) -> Bool {
  return x == y
}

areTheyEqual("ray", "ray")
areTheyEqual(1, 1)
```

Так как вы тестируете равенство, вы ограничиваете типы теми, которые отвечают протоколу Equatable. Этот код обеспечивает требуемый результат и препятствует передаче параметров неподходящего типа.

## [Полиморфизм](/ComputerScience/Languages/Paradigm/Imperative/OOP.md)

С точки зрения языка программирования Swift, шаблоны являются абстракцией над типами (type-level abstraction), позволяющей использовать [полиморфизм](/ComputerScience/Languages/Paradigm/Imperative/OOP.md) для работы с разными типами данных:

```swift
func collect<T: AnyClass>(value: T, and anotherValue: T) -> [T] {
  return [value, anotherValue]
}
```

Выше мы используем заглушку T, на место которой будет подставлен тип, удовлетворяющий AnyClass или его потомку.

## [Method Dispatch](/Swift/MethodDispatch/MethodDispatch.md)

У дженериков по дефолту direct диспетчеризация.

Исключение когда у нас несколько модулей задействовано - билдим как фреймворк (компилятор заранее не может знать какой тип будет передан на вход). Компилятору придется создать виртуальную таблицу для поиска адреса инструкций - используется [virtual table dispatch](/Swift/MethodDispatch/MethodDispatch.md) (так как тут отсутствие знаний о типе прооисходит на стороне [статической библиотеке/фреймворке](/IosDevTools/Building/Xcodegen.md))  .





