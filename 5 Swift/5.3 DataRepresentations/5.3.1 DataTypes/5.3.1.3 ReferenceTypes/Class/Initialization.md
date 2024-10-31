## Инициализация

Swift не может использовать автоматический memberwise initializers для классов, по двум причинам: 

1) Теряется возможно прописывать более удобную инициализацию (Н/р: convenience init) для child классов. У компилятора нет возможности самостоятельно выстроить цепочку инициализации;

2) Память у классов выделяется динамически во время запуска приложения, поэтому свифт заранее не может выделить необходимую память под него;

### Инициализация в классе

* designated init == init - дефолтный;

* convenience init;

* required init - для протоколов;

#### designated init 

Точка инициализации, которая обязательно должна удовлетворить потребности класс (передать ему все параметры), продолжается вверх по цепочке суперклассов (вызывает соответствующий инициализатор суперкласса). 
Каждый класс должен иметь по крайней мере один назначенный инициализатор.

#### convenience init   

Можно принять меньше параметров и вызвать designated init, который закончит работу инициализации класса.

Может вызывать другой convenience init или designated init, но не инициализацию суперкласса.  

### Failable initializer

1. :heavy_check_mark: [Failable initializers](https://www.hackingwithswift.com/sixty/10/9/failable-initializers)
```swift
let str = "5"
let num = Int(str)
print(num) // Optional(5)
```

У нас `num: String? = Optional(5)`, потому что str может быть не 5, тогда будет равен `num = nil`. Можно самостоятельно написать такой инициализатор, используя `init?()`



## init в [структурах](/5%20Swift/5.3%20DataRepresentations/5.3.1%20DataTypes/5.3.1.4%20ValueTypes/Struct.md)

Без init() нам обязательно нужно указывать при создании экземпляра структура нужно обязательно указать имя.

```swift
struct User {
    var username: String
    // membership initializing
}
var user = User(username: "twostraws")
```

С init() нам не обязательно указывать имя, это называется custom initializer:

```swift
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// Не работает!!!
// var user = User(username: "twostraws")
// Работает:
var user = User()
user.username = "twostraws"
```

Также можно использовать memberwise initializers:

```swift
struct User {
    var name: String = "Anonymous"
    var yearsActive = 0
}

var user = User(name: "Alan", yearsActive: 32)
```

