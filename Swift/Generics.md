
В Swift вы можете использовать generics в классах, структурах и перечислениях.

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