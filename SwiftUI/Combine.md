## Combine

1. :heavy_check_mark: [Using Combine](https://heckj.github.io/swiftui-notes/)
2. - [ ] [Combine: Asynchronous Programming with Swift](https://www.raywenderlich.com/books/combine-asynchronous-programming-with-swift/v1.0/chapters/16-error-handling)


Combine - это фреймворк функционального [реактивного](https://github.com/eldaroid/iOSWiki/blob/master/DesignPattern/ReactiveProgramming.md) программирования, запущенный Apple на WWDC 2019. 

`.receive(on: DispatchQueue.main)` - все, что влияет на UI, нужно делать в главном потоке. Вызывать перед `.sink`

`Just(Bool)` - создается определенный `Publisher<Bool, Never>`, чтобы был AnyPublisher нужно добавить в конец `.eraseToAnyPublisher()`
 
`.setFailureType(to: Error.self)`

