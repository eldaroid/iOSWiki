## Combine

1. :heavy_check_mark: [Using Combine](https://heckj.github.io/swiftui-notes/)
2. - [ ] [Combine: Asynchronous Programming with Swift](https://www.raywenderlich.com/books/combine-asynchronous-programming-with-swift/v1.0/chapters/16-error-handling)
3. - [ ] [Создание своего Publisher'a в Combine](https://habr.com/ru/post/482690/)
4. - [ ] [Let’s Build a Custom Publisher in Combine](https://thoughtbot.com/blog/lets-build-a-custom-publisher-in-combine)
5. - [ ] [API для удаленной асинхронной выборки с помощью Apple Combine](https://habr.com/ru/post/476678/)
6. - [ ] [Начинаем работу с Combine](https://apptractor.ru/info/articles/combine-tutorial-1.html)
7. - [x] [RxSwift to Combine Cheatsheet](https://github.com/CombineCommunity/rxswift-to-combine-cheatsheet)
8. [Using Combine](https://heckj.github.io/swiftui-notes/#reference-throttle)

Combine - это фреймворк функционального [реактивного](https://github.com/eldaroid/iOSWiki/blob/master/DesignPattern/ReactiveProgramming.md) программирования, запущенный Apple на WWDC 2019 в качестве замены RxSwift. 

Для того чтобы начать работать с Combine, необходимо познакомиться с тремя основными компонентами: паблишерами, подписчиками и операторами:

![](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Swift/Combine.jpg?raw=true)

### [Publisher](https://developer.apple.com/documentation/combine/publisher)

<details><summary>Open</summary>
<p>

**Publisher** — это начальная точка потока данных. По сути это объект, который создает какие-либо данные. Паблишером может быть любой объект, удовлетворяющий требованиям протокола Publisher, с двумя ассоциированными типами: Output и Failure.

**Output** — это и есть генерируемые данные какого-либо типа (например, String).

**Failure** — это ошибка, которую может сгенерировать паблишер при неудачной операции. Она бывает двух типов: `Error` и `Never`, который используется в том случае, если мы уверены, что ошибка произойти не может.

```swift
public protocol Publisher<Output, Failure> {
    associatedtype Output
    associatedtype Failure: Error
}
```

Создадим первый паблишер на базе массива строк. Паблишер сам по себе бесполезен, если нет подписчика, ведь генерируемые данные надо как-то обработать.

```swift
let array = ["value1", "value2", "value3"]
let sequencePublisher = array.publisher
```

Например, если мы захотим вывести все данные, полученные от паблишера (элементы массива), то нам потребуется подписчик.

### Publishers

| Combine | Combine x2 | SwiftUI | Foundation |
|---|---|---|---|
| Just(true) | - | @Published | [URLSession.dataTaskPublisher](https://heckj.github.io/swiftui-notes/#reference-datataskpublisher) |
| Empty() | - | ObservableObject | [publisher on KVO instance](https://heckj.github.io/swiftui-notes/#reference-kvo-publisher) |
| Fail() | - |  | [NotificationCenter](https://heckj.github.io/swiftui-notes/#reference-notificationcenter) |
| Future | - |  | [Timer](https://heckj.github.io/swiftui-notes/#reference-timer) |
| Deferred | - |  | [Result](https://heckj.github.io/swiftui-notes/#reference-result) |
| Record | - |  |  |

</p>
</details>

### Операторы:

<details><summary>Open</summary>
<p>

[Полный список Publisher Operators от Apple](https://developer.apple.com/documentation/combine/publishers-merge-publisher-operators)

[Операторы с шариковыми диаграммами](https://tanaschita.com/20221121-cheatsheet-combine-operators/)

Последовательные операторы:

* .first, .first(where:)
* .last, .last(where:)
* .output(at:), .output(in:)
* .count
* .contains, .contains(where:)
* .allSatisfy
* .reduce

Controlling Timing операторы:

* delay - 
* debounce - операция фильтрации. При получении значения делается пауза в заданный интервал времени и отправляется последнее и __**единственное**__ значение. Если в заданный интервал приходит новое значение, то отсчет паузы возобновляется
![](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Swift/debounce.jpeg?raw=true)
![](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Swift/debounce2.jpeg?raw=true)
    > Пример: Панель поиска, где пользователи могут вводить поисковые запросы. Если пользователь продолжает печатать в течение n периода, период ожидания возобновляется, гарантируя, что вызов API будет выполнен только после небольшой паузы в наборе текста.
* throttle - операция фильтрации. Cобирает несколько результатов с течением времени и отправляет один результат, но делает это с фиксированными временными окнами
![](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Swift/throttle.jpeg?raw=true)
![](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Swift/throttle2.jpeg?raw=true)
    > Пример: Ккнопка, которую пользователи могут нажимать, вы хотите обрабатывать нажатия, но не допускать случайных множественных нажатий в быстрой последовательности. `throttle` гарантирует, что событие нажатия кнопки обрабатывается только один раз каждые 500 миллисекунд, независимо от того, сколько раз была нажата кнопка.
    
* measure interval -

Объединяющие операторы:

* .prepend
* .append
* .switchToLatest
* .merge(with:)
* .combineLatest
* .zip

</p>
</details>

### [Subscriber](https://developer.apple.com/documentation/combine/subscriber)

<details><summary>Open</summary>
<p>

**Subscriber** — это конечная точка потока данных, далее будем называть его подписчик. По сути это объект, который подписывается на паблишер и взаимодействуют с полученными и паблишера данными.

Он представлен протоколом с двумя ассоциированными типами: `Input` и `Failure`.

`Input` — данные определенного типа, который он может обработать.

`Failure` — ошибка, которая может прийти от паблишера.

```swift
public protocol Subscriber<Input, Failure> : CustomCombineIdentifierConvertible {
    associatedtype Input
    associatedtype Failure: Error
}
```

Пример:

```swift
sequencePublisher
    .sink { receivedValue in
        print(receivedValue)
    }
```

.sink — это и есть подписчик. Посмотрите на его сигнатуру:

```
func sink(receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable
```

</p>
</details>

Методы: 

`.receive(on: DispatchQueue.main)` - все, что влияет на UI, нужно делать в главном потоке. Вызывать перед `.sink`

`.setFailureType(to: Error.self)` - превращает `Publisher<Bool, Never>` в `Publisher<Bool, Error>`

`.eraseToAnyPublisher()` - чтобы был AnyPublisher<>, добавлять в конец


### Combine в SwiftUI

Например, и @Published оболочка свойств, и ObservableObject протоколы исходят из Combine, но нам не нужно было знать об этом, потому что при импорте SwiftUI мы также неявно импортируем части Combine.

### На будущее:

[Combine (в DesignPatterns):](https://heckj.github.io/swiftui-notes/#download-the-project)

[Swift Combine Framework Tutorial](https://www.vadimbulavin.com/swift-combine-framework-tutorial-getting-started/)

