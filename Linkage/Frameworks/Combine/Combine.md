## Combine

1. :heavy_check_mark: [Using Combine](https://heckj.github.io/swiftui-notes/)
2. - [ ] [Combine: Asynchronous Programming with Swift](https://www.raywenderlich.com/books/combine-asynchronous-programming-with-swift/v1.0/chapters/16-error-handling)
3. - [ ] [Создание своего Publisher'a в Combine](https://habr.com/ru/post/482690/)
4. - [ ] [Let’s Build a Custom Publisher in Combine](https://thoughtbot.com/blog/lets-build-a-custom-publisher-in-combine)
5. - [ ] [API для удаленной асинхронной выборки с помощью Apple Combine](https://habr.com/ru/post/476678/)
6. - [ ] [Начинаем работу с Combine](https://apptractor.ru/info/articles/combine-tutorial-1.html)

Combine - это фреймворк функционального [реактивного](https://github.com/eldaroid/iOSWiki/blob/master/DesignPattern/ReactiveProgramming.md) программирования, запущенный Apple на WWDC 2019 в качестве замены RxSwift. 

Самыe простые и полезные `publishers`:

* `Just(true)` - создается определенный `Publisher<Bool, Never>`, который выдает единственное значение (true), и немедленно завершает работу;
 
* `Empty()` - который не выдает никаких значений и немедленно завершает;

* `Fail()` - который не выдает никаких значений и немедленно завершается с ошибкой.

Методы: 

`.receive(on: DispatchQueue.main)` - все, что влияет на UI, нужно делать в главном потоке. Вызывать перед `.sink`

`.setFailureType(to: Error.self)` - превращает `Publisher<Bool, Never>` в `Publisher<Bool, Error>`

`.eraseToAnyPublisher()` - чтобы был AnyPublisher<>, добавлять в конец

### Combine в SwiftUI

Например, и @Published оболочка свойств, и ObservableObject протоколы исходят из Combine, но нам не нужно было знать об этом, потому что при импорте SwiftUI мы также неявно импортируем части Combine.

### На будущее:

[Combine (в DesignPatterns):](https://heckj.github.io/swiftui-notes/#download-the-project)

[Swift Combine Framework Tutorial](https://www.vadimbulavin.com/swift-combine-framework-tutorial-getting-started/)

