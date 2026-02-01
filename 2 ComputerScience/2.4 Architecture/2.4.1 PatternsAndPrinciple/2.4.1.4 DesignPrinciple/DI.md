## Dependency injection and Dependency inversion?

1. [Difference between dependency injection and dependency inversion?](https://github.com/sashakid/ios-guide/blob/master/Main/6_architecture.md#difference-between-dependency-injection-and-dependency-inversion)

## Принцип [Dependency inversion из SOLID](./2.4.4.5%20SOLID.md)

Модули верхних уровней не должны зависеть от деталей нижнего уровня. А оба этих уровней должны зависеть от деталей абстракций. 

Позволяет отвязаться от конкретной реализации благодаря [интерфейсу (протоколы)](/5%20Swift/5.4%20Protocol/5.4.1%20Protocol.md)/[дженерику](/5%20Swift/5.5%20AbstractMechanism/5.5.1%20Generics.md).

## Dependency injection

Dependency Injection — это способ реализации [Dependency Inversion из SOLID](./2.4.4.5%20SOLID.md). Это про внедрение зависимостей в объект.

* [SwinJect](https://github.com/Swinject/Swinject);
* [Needle](https://github.com/uber/needle) от uber;
* [DIP](https://github.com/AliSoftware/Dip);

 ---

[2.4.4.1 DRY Theme](./2.4.4.1%20%20DRY.md) | [Back To iOSWiki Contents](https://github.com/eldaroid/iOSWiki) | [2.4.4.3 KISS Theme](./2.4.4.3%20KISS.md)
