### Convenience Publishers

1. `Result<Int, Error>.Publisher` - это паблишер, генерирует событие либо ошибку всего один раз, а потом замолкает.
    + `Just<Int>` -  отправляет выходные данные каждому подписчику только один раз, а после завершает работу с `finished` статусом. (Value, Never). Value - если nil, то попадаем в receiveValue. Само value = nil
    * `Fail<Output, Failure>` - не отправляет значения подписчику, а немедленно завершает работу с указанной ошибкой. P.S.: отправляет значение со статусом `finished` если добавить `replaceError`
    ---
    + `Optional<Int?>.Publisher` — это паблишер, который генерирует событие всего один раз, а потом замолкает. (Value?, Never). Value? - если nil, то не попадаем в receiveValue
    + `Empty<nil!, Error>` - никогда не отправляет никаких значений и завершает работу немедленно. P.S.: отправляет значение если добавить `.replaceEmpty`
    ---
2. Publishers for closure:
    + `Future<Int, Never>` - он начинает выполняться сразу при инициализации, не дожидаясь подписчика. Подписчик может «пропустить» нужное ему событие.
    + `Deferred` - что заставить Future вести себя менее эгоистично и дождаться подписчика оборачиваем его в блок Deferred { }.
3. Publishers for value: Subject — это паблишер, который позволяет отправлять в поток данных события извне ручками.
    + PassthroughSubject -
    + CurrentValueSubject -
    

### Result

<details><summary>Open</summary>
<p>

Result — это паблишер, который генерирует событие либо ошибку. Генерация результата происходит всего 1 раз, после чего паблишер замолкает.

```swift
enum ResultError: Error {
    case testError
}
let error: ResultError = .testError
let value = 10
var result: Result<Int, Error> = .failure(error)
let resultPublisher: Result<Int, Error>.Publisher = result.publisher
resultPublisher
    .sink(
        receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("completion status: \(completion)")
            case .failure(let error):
                print("recieved error: \(error)")
            }
        }, receiveValue: { value in
            print("received value: \(value)")
        }
    )
```

Консоль:

```swift
recieved error: testError
```

Если изменим `var result: Result<Int, Error> = .success(value)`, то консоль:
```swift
received value: 10 
completion status: finished
```

</p>
</details>

### Just

<details><summary>Open</summary>
<p>

У Just есть несколько особенностей. Во-первых, он всегда генерирует событие (в отличие от опционала). Например, если в качестве output мы поставим опциональный String, а остальной код оставим как есть, то в консоли увидим следующее:

```swift
let stringPublisher: Just<String?> = Just(nil)

stringPublisher
    .sink(
        receiveCompletion: { completion in
            print("completion status: \(completion)")
        }, receiveValue: { value in
            print("recieved value: \(value)")
        }
    )
```

Консоль:

```swift
recieved value: nil
completion status: finished
```

Второй особенностью Just является то, что его тип ошибки — Never, то есть он никогда не может завершиться с ошибкой. Даже если мы укажем опциональный тип данных и придет nil, подписчик решит, что это не ошибка и с этими данными можно работать.

Если нам все-таки нужно как-то разграничивать успешный Output и Error, паблишер Just не подойдет. Для этих целей используется паблишер Result.

</p>
</details>

### Fail

<details><summary>Open</summary>
<p>

</p>
</details>

### Optional

<details><summary>Open</summary>
<p>

Его особенностью является то, что если value == nil, то паблишер вообще ничего не пришлет, а в блоке recieveCompletion уведомит о том, что он «всё».

```swift
var intValue: Int? = nil
let optionalPublisher: Optional<Int>.Publisher = intValue.publisher

optionalPublisher
    .sink(
        receiveCompletion: { completion in
            print("completion status: \(completion)")
        }, receiveValue: { value in
            print("received value: \(value)")
        }
    )
```

Консоль:
```swift
completion status: finished
```

В то же время, если значение не будет равно nil, то в блоке receiveValue оно уже будет извлечено и нам не надо будет использовать оператор guard или if-let.

```swift
var intValue: Int? = 10
```

Консоль:
```swift
received value: 10
completion status: finished
```

</p>
</details>

### Empty

<details><summary>Open</summary>
<p>

</p>
</details>

### Future

<details><summary>Open</summary>
<p>

`Future<Int, Never>` - функция которая возвращает объект, начинает выполняться сразу при инициализации, не дожидаясь подписчика. Подписчик может «пропустить» нужное ему событие.

</p>
</details>

### Deferred

<details><summary>Open</summary>
<p>

</p>
</details>
