# Тестирование ПО

Каждый программист, который только делает первые шаги в профессии, неизбежно сталкивается с понятием «тестирование кода». 
Интуитивно понятно, что это процедура, направленная на поиск ошибок, несоответствия заявленных данных и исполняемых, оценку функциональности программы. 
Однако, что конкретно подразумевается под тестированием, какие существуют виды и надо ли вам постигать эту непростую науку? 

## Виды тестирования

- [x] [Виды тестирования ПО](https://qaevolution.ru/wp-content/uploads/2016/01/bd6dcbbb7d7c44a485b65ae29b4c0ae4.png)

На этой фотографии мы можем увидеть все виды тестирования ПО, разделенные по категориям:

<img src="https://qaevolution.ru/wp-content/uploads/2016/01/bd6dcbbb7d7c44a485b65ae29b4c0ae4.png" alt="alt text" width="750" height="400">

Остановимся на наиболее популярных: 

* Функциональное тестирование - когда тестируется приложение целиком.

* Нефункциональное тестирование - проверка на соответствие нефункциональным требованиям: удобство, маштабируемость, производительность, безопасность, надежность.

* Модульное / юнит-тестирование – проверка корректной работы одной функции, одной задачи. Этот вид тестирования могут выполнять сами разработчики.

* Интеграционное (Integration) – проверка взаимодействия между несколькими единицами ПО. 

* Системное - конечная обкатка вашего приложения. Как правило выполняется в ручном режиме «научного тыка».

* Нагрузочные (Load) – тестирование максимального количества запросов, которые вы тянете. Миллион запросов по 1 мегабайту.

* Стресс – какой самый большой или самый сложный реквест. Тестирование под особым стрессовым запросам. 1 файл на максильное количество мегабайт

* Альфа тестирование: 

    * Регресс - оценка работоспособности уже проверенного кода после внедрения в него изменений. 
    Актуально для динамических систем, где появление новых данных может реально повлиять на работоспособность всего кода. 
    Такой тест нужен нам чтобы посмотреть не сломал ли ты другие важные фичи.

    * [Смок (smoke)](https://qaevolution.ru/testirovanie-po/vidy-testirovaniya-po/smoke-testing/) (встречаются названия дымное тестирование, intake test , build verification test) - маленький тест похожий на интеграционный чтобы быстро прогнать перед выкладкой в продакшн
    
## Практики разработки Driven Development

- [x] [Все, что вы хотите узнать о Driven Development](https://worksolutions.ru/blog/driven-development/)

TDD (Test Driven Development) — ну, это все знают, сначала пишем тесты, а потом остальной код

BDD (Behaviour Driven Development) - вроде как, тоже тесты, но особенные. Разработка, основанная на описании поведения. Определенный человек(или люди) пишет описания вида "я как пользователь хочу когда нажали кнопку пуск тогда показывалось меню как на картинке".

MDD (Model Driven Development) — cерьезно, на основе диаграмм?

TDD (Type Driven Development) - сокращенно пишется также, как и разработка через тестирование, поэтому обычно пишут полное название. Ваши типы данных и сигнатуры типов являются спецификацией программы. Типы также служат формой документации, которая гарантированно обновляется.

![alt text](https://habrastorage.org/webt/ue/7h/y5/ue7hy5tcox8zmj5hngev707m994.jpeg)
    
## iOS Testing

- [x] [iOS Unit Testing and UI Testing Tutorial](https://www.raywenderlich.com/21020457-ios-unit-testing-and-ui-testing-tutorial#toc-anchor-006)
- [x] [Туториал По Unit И UI-Тестированию В IOS](https://swiftbook.ru/post/tutorials/ios-unit-testing-and-ui-testing-tutorial/)

> Примечание. Чтобы увидеть полный список утверждений XCTestAssertions, [перейдите к утверждениям Apple, перечисленным по категориям](https://developer.apple.com/documentation/xctest#2870839).

### Пример теста:

<details><summary>Open</summary>
<p>

```
/// DealsTests
   
@testable import Deals
import XCTest
   
class Tests: XCTestCase {
 var sut: ViewModel?
   
 override funx setUp() {
   super.setUp()
   sut = ViewMolde()
}
   
 override funx tearDown() {
   super.tearDown()
   sut = nil
 }
   
 func testFunction() {
   sut.callFunction()
   XCTAssertTrue(true)
 }
```
   
</p>
</details>

### Тестирование асинхронного кода

<details><summary>Open</summary>
<p

#### Для тестирования асинхронного кода можно использовать expectations:

- [x] [Testing Asynchronous Operations with Expectations](https://developer.apple.com/documentation/xctest/asynchronous_tests_and_expectations/testing_asynchronous_operations_with_expectations)

```
//given
let expectation = XCTestExpectation(description: "Download apple.com home page")

//when
sut?.function()

DispatchQueue.main.asyncAfter(dedline: .now() + 0.3) {
   expectation.fulfill()
}

wait(for: [expectation], timeout: 0.5)

//then
XCTAssertEqual(sut?.items.count, 2)
```

`expectation.fulfill()` : вызовите это при закрытии условия успеха обработчика завершения асинхронного метода, чтобы отметить, что ожидание было выполнено.

`wait (for: timeout :)` : тест продолжается до тех пор, пока не будут выполнены все ожидания или пока timeout не закончится, в зависимости от того, что произойдет раньше.

#### Также можно использовать Sheduler вместо expectation: 

- [x] [ImmediateScheduler](https://pointfreeco.github.io/combine-schedulers/ImmediateScheduler/)
- [x] [Scheduler](https://pointfreeco.github.io/combine-schedulers/TestScheduler/)
- [x] [Scheduler](https://pointfreeco.github.io/combine-schedulers/AnyScheduler/)

> Основная задача при тестировании Combine избавиться от использования expectation, 
чтобы тесты проходили намного быстрее, так как в перспективе, с увеличением количества тестов, 
таймауты сыграют неприятную роль в производительности тестов"

</p>
</details>
   
### Тестирования производительности 

- [x] [Testing Performance](https://www.raywenderlich.com/21020457-ios-unit-testing-and-ui-testing-tutorial#toc-anchor-016#:~:text=XCTClockMetric)

Для тестирования произодительности необходимо добавить `measure` перед вызовом функции с метриками, которые нужно измерить:

```
func testScoreIsComputedPerformance() {
  measure(
    metrics: [
      XCTClockMetric(), 
      XCTCPUMetric(),
      XCTStorageMetric(), 
      XCTMemoryMetric()
    ]
  ) {
    sut.check(guess: 100)
  }
}
```

### Создать пустой Publisher:

AnyPublisher<Model, Error>: Just(Model()).setFailureType(to: Error.self).eraseToAnyPublisher()

AnyPublisher<Void, Error>: Empty().eraseToAnyPublisher()
