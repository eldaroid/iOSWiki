[Разработка iOS приложений с помощью SwiftUI](https://habr.com/ru/post/528274/)

[Learn SwiftUI for iOS 13](https://designcode.io/swiftui-course)

[Домашняя страница официального сайта SwiftUI](https://developer.apple.com/documentation/swiftui/)

[Learn SwiftUI for iOS 13](https://designcode.io/swiftui-course)

[Using UIKit views in SwiftUI](https://swiftwithmajid.com/2020/01/29/using-uikit-views-in-swiftui/)

[Property wrappers](https://purple.telstra.com/blog/swiftui---state-vs--stateobject-vs--observedobject-vs--environme)

[Формируем View в SwiftUI, исходя из условий](https://habr.com/ru/post/495746/)

[The iOS Design Guidelines](https://ivomynttinen.com/blog/ios-design-guidelines)

[SwiftUI по полочкам](https://habr.com/ru/post/485548/)

[SwiftUI](https://swiftui-lab.com/frame-behaviors/)

[SwiftUI](https://daddycoding.com/swiftui/)

[var body: some View](https://www.youtube.com/live/x_B6aiglbc8?feature=share&t=4469)

!! [Понимание жизненных циклов вью SwiftUI](https://vc.ru/dev/573105-ponimanie-zhiznennyh-ciklov-vyu-swiftui)

# Принципы SwiftUI

Главная особенность нового фреймворка — это принципы на которых держится вся концепция. Можно знать внутренности фреймворка, но лучше задать вопрос какие ключевые свойства он в себе несет:

🟣 1. Декларативность — старый тренд, который доказал себя в других технология с UI. React, Angular, Compose, Flutter. В императивном мире нужно всё реализовывать самому: верстку, поведение, привязку данных. В декларативном подходе нужно просто указать платформе, что делать, и она позаботится обо всех деталях за вас.

🟣 2. State Management. Если у нас простой экран, то проблем нет. Как только наш экран обрастает разными компонентами, то вопрос синхронизации растет в приоритете. Один из главных принципов SwiftUI — это максимальная синхронизация вью и модели.

🟣 3. Composition over Inheritance. [Композиция](/2%20ComputerScience/2.4%20Architecture/2.4.1%20PatternsAndPrinciple/2.4.1.3%20DesignPattern/2.4.1.3.4%20Structural/Composite.md) важнее [наследования](/2%20ComputerScience/2.2%20Languages/2.2.2%20Paradigm/2.2.2.2%20Imperative/2.2.2.2.2%20OOP.md). Разрабам из UIKit немного сложнее в этом вариться, так как мы привыкли наследоваться от UITableView, UITableViewCell и многих других элементов. В SwiftUI же акцент сделан в другую сторону

🟣 4. UIs Are a Function of Their State. Проще говоря, view намного умнее следит за обновлением модели и ее атрибутов. Так улучшается синхронизация между данными и ее вью. SwiftUI помогает лучше связывать данные и не забывать случайно обновить часть интерфейса


> We can think of SwiftUI's WindowGroup definition as equivalent to UIKit's UIWindow.rootViewController.view