## Delegate

Делегирование — это концепция, которая в основном используется в протокольно-ориентированном программировании ([POP](/ComputerScience/Languages/Paradigm/Imperative/POP.md))

Как следует из названия, делегат означает передачу некоторых обязанностей другому объекту (один из способов передачи данных). Наиболее распространенной практикой передачи этой ответственности является использование UITableViewController с пользовательскими UITableViewCells.

Основным преимуществом делегирования определенных решений и поведения родительскому объекту от дочернего объекта является создание несвязанной модели с низкой зависимостью.

```swift
/// Objects conformaing to this delegate will be able to listen for changes in network connectivity. 
protocol NetworkHelperDelegate: AnyObject {

    /// Is call if the network connection is available
    func networkIsAvailable() 

    /// Is call if the network connection is unavailable
    func networkIsUnAvailable()
}


/// Object which contains networking logic. 
final class NetworkHelper {

private weak var networkHelperDelegate: NetworkHelperDelegate?

@objc private func networkDidChange(_ notification: Notification) {
        guard let reachability = notification.object as? Reachability else {
            assertionFailure("Could not cast object a Reachability")
            return
        }
        switch reachability.connection {
        case .none:
            networkHelperDelegate?.networkIsUnavailable()
        case .cellular, .wifi:
            networkHelperDelegate?.networkIsAvailable()
        }
    }
}
```

> При объявлении delegate расширяем его от AnyObject, чтобы позволить ему соответствовать только от классов. Причина - хочется объявить экземпляр моего делагата как слабую переменную, поскольку слабую нельзя применить к неклассовому типу. Использование weak в первую очередь предназначено для предотвращения потенциальных утечек памяти и сохранения циклов

### Delegate vs Protocol

Протокол — это набор требований, которые должен выполнять каждый соответствующий ему тип . Протокол содержит детали декларации, а не детали реализации. Делегаты реализуются с использованием протоколов и полезны, потому что они устанавливают метод взаимной связи между объектами.

### Использование замыканий вместо делегирования

Жизнеспособной альтернативой шаблону делегирования является простое использование замыканий . Вместо вызова функции делегата делегирующий класс вызывает замыкание, определенное заранее как свойство делегирующего класса. Вы можете легко использовать замыкания при асинхронной передаче данных от одного объекта к другому. Замыкания, как и делегирование, могут обеспечить легкие и несвязанные решения этой проблемы. Единственным недостатком будет то, что если ваша логика сильно разрастется, замыкания могут привести к беспорядку в отношении читабельности.
