## Composite

1. [Structural design pattern composite](https://daddycoding.com/2023/03/19/composite/)

> Один из паттернов в [ФП](/2%20ComputerScience/Languages/Paradigm/Declarative/FunctionalProgramming(FP).md).

Составной шаблон проектирования — это структурный шаблон проектирования, который позволяет объединять объекты в древовидные структуры для представления иерархий целых частей. Составной шаблон позволяет клиентам единообразно обрабатывать отдельные объекты и композиции объектов.

> Склеивание функций для получения более сложный функций, где результат предыдущей 

В математическом смысле это означает применение одной функции к результату другой функции. В Swift функции могут возвращать значение, которое вы можете использовать как вход для другой функции. Это общая практика программирования.

Представим, что у нас есть массив целых чисел и мы хотим на выходе получить массив квадратов уникальных четных чисел. Обычно мы реазизуем это следующем образом:

```swift
var integerArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 4, 5]

func unique(_ array: [Int]) -> [Int] {
    return array.reduce(into: [], { (results, element) in
        if !results.contains(element) { results.append(element) }
    })
}

func even(_ array: [Int]) -> [Int] {
    return array.filter{ $0%2 == 0}
}

func square(_ array: [Int]) -> [Int] {
    return array.map{ $0*$0 }
}

var array = square(even(unique(integerArray))) // it returns [4, 16, 36, 64]
```

> В композициифункции вызываются справа налево

Этот код дает нам правильный реультат, но вы видите, что читаемость последней строки кода не такая уж легкая.  Последовательность функций (справа налево) противоположна той, к которой мы привыкли (слева направо) и хотели бы здесь видеть.

Более распространенный пример: 

```swift
Array.compactMap { $0 }.filter { $0.count > 0 }
```

### Composite в Протоколах

```swift
protocol WalkingAnimal {
    func walk()
}

protocol SwimmingAnimal {
    func swim()
}

typealias WalkingAndSwimming = WalkingAnimal & SwimmingAnimal
```

Пример:

```swift
final class Capibara: WalkingAndSwimming {
    func walk() { print("walk") }
    
    func swim() { print("swim") }
}

let instance1: WalkingAndSwimming = Capibara()
let instance2: WalkingAnimal & SwimmingAnimal = Capibara() 
```






