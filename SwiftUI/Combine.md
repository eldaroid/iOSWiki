## Combine

1. :heavy_check_mark: [Using Combine](https://heckj.github.io/swiftui-notes/)

Combine - это фреймворк функционального [реактивного](https://github.com/eldaroid/iOSWiki/blob/master/DesignPattern/ReactiveProgramming.md) программирования, запущенный Apple на WWDC 2019. 

`.receive(on: DispatchQueue.main)` - все, что влияет на UI, нужно делать в главном потоке. Вызывать перед `.sink`

Just(Bool).setFailureType(to: Error.self) - создается определенный Publisher, чтобы был AnyPublisher нужно добавить в конец `.eraseToAnyPublisher()`

