## Tuple

> Кортеж - это не коллекции, такие как `Array` или `Dictionary`, а структурированные типы, похожие на структуру без имени

**Tuples (кортеж)** - позволяют хранить несколько типов вместе в одном значении.

* Нельзя добавлять или удалять элементы из кортежа: кортежи фиксированы по размеру.
    
* Нельзя изменить тип элементов в кортеже; они всегда имеют те же типы, с которыми были созданы.

* Нельзя получить доступ к элементам в кортеже, используя числовые позиции или называя их, но Swift не позволит вам читать числа или имена, которых не существует.

### Пример использования

`var person = (name: "Paul", age: 40, isMarried: true)`

Получить значения: `person.name` = `person.0`, `person.age` = `person.1`

Почти то же самое что и

```swift
struct Person {
    let name: String
    let age: Int
    let isMarried: Bool
}
```

`var person = Person(name: "Paul", age: 40, isMarried: true)`


>  Кортежи дают нам некоторую безопасность имен кортежей, но могут расти и изменяться, как массивы

---

[Collections Theme](./Collections.md) | [Back To iOSWiki Contents](https://github.com/eldaroid/iOSWiki) | [5.3.2 Data Structures Theme Folder](/5%20Swift/5.3%20DataRepresentations/5.3.2%20DataStructures/)