## iOS Testing

- [x] [Getting Started with Swift Unit Testing in Xcode](https://www.swiftdevjournal.com/getting-started-with-swift-unit-testing-in-xcode/)
- [x] [iOS Unit Testing and UI Testing Tutorial](https://www.raywenderlich.com/21020457-ios-unit-testing-and-ui-testing-tutorial#toc-anchor-006)
- [x] [Туториал По Unit И UI-Тестированию В IOS](https://swiftbook.ru/post/tutorials/ios-unit-testing-and-ui-testing-tutorial/)
- [x] [Writing better unit tests in Swift: Part One](https://medium.com/bleeding-edge/writing-better-unit-tests-in-swift-part-one-e4a06fbc682b)
- [x] [Writing better unit tests in Swift: Part Two](https://medium.com/bleeding-edge/writing-better-unit-tests-in-swift-part-two-d19b69f3d794)
- [x] [Unit tests best practices in Xcode and Swift](https://www.avanderlee.com/swift/unit-tests-best-practices/)

> Примечание. Чтобы увидеть полный список утверждений XCTestAssertions, [перейдите к утверждениям Apple, перечисленным по категориям](https://developer.apple.com/documentation/xctest#2870839).

### Правила при написании тестов:

   1. Нейминг теста: `test_whenFilterOneModelWithWrongQuarter_ItReturnNothing()`
   2. `sut` должен называться тестируемый класс. sut (subject under test) означает «испытуемый предмет».
   3. Использовать [Given-When-Then](https://martinfowler.com/bliki/GivenWhenThen.html) подход
   4. В тестах должна быть 1 логическая проверка. Количество `XCTestAssertions` может быть любым.
  
### Пример теста:

<details><summary>Open</summary>
<p>

```
/// DealsTests
   
@testable import Deals
import XCTest
   
class Tests: XCTestCase {
 // MARK: - Properties
 private var sut, sut_withError: ViewModel!
   
 // MARK: - Test Lifecycle
 override funx setUp() {
   super.setUp()
   sut = ViewModel()
   sut_withError = ViewModel()
}
   
 override func tearDown() {
   super.tearDown()
   sut = nil
   sut_withError = nil
 }
   
 // MARK: - Tests
 func testFunction() {
   // given
   sut.property = 1
   
   // when
   sut.callFunction()
   
   // then
   XCTAssertEqual(sut.funcInvokedCount, 1)
 }
   
 func testPublisher() {
   // given
   var loadCompleted = false
   
   // when
   cancellable = sut.getResponse()
      .sink(receiveCompletion: { completion in
           if case .finished = completion {
               loadCompleted = true
           }
      }, receiveValue: { _ in })
   
   // then
   XCTAssertTrue(loadCompleted)
 }

 final class ViewModel: ViewModelProtocol {
   // MARK: - Testing
   private(set) var funcInvokedCount = 0

   // MARK: - ViewModelProtocol
  var property = 0

   func callFunction() { funcInvokedCount += 1 }

   func getResponse() -> AnyPublisher<Void, Never> {
     return Empty().eraseToAnyPublisher()
   }
 }
```
   
</p>
</details>

### Тестирование асинхронного кода

<details><summary>Open</summary>
<p

#### Для тестирования асинхронного кода можно использовать expectations:

- [x] [Testing Asynchronous Operations with Expectations](https://developer.apple.com/documentation/xctest/asynchronous_tests_and_expectations/testing_asynchronous_operations_with_expectations)
- [ ] [Combine Testing](https://www.raywenderlich.com/books/combine-asynchronous-programming-with-swift/v1.0/chapters/19-testing)
- [ ] [Using Combine Tests](https://github.com/heckj/swiftui-notes/tree/master/UsingCombineTests)

```
    func testAsync() {
      //given
      let expectation = XCTestExpectation(description: "Download apple.com home page")

      //when
      sut?.reloadData()

      DispatchQueue.main.asyncAfter(dedline: .now() + 0.3) {
         expectation.fulfill()
      }

      wait(for: [expectation], timeout: 0.5)

      //then
      XCTAssertEqual(sut?.items.count, 2)
   }
   
   func testPublisher() {
      // given
      var loadCompleted = false
   
      // when
      cancellable = sut.getResponse()
         .sink(receiveCompletion: { completion in
            if case .finished = completion {
                loadCompleted = true
             }
         }, receiveValue: { _ in })
   
      // then
      XCTAssertTrue(loadCompleted)
   }

   func getResponse() -> AnyPublisher<Void, Never> {
     return Empty().eraseToAnyPublisher()
   }
```

`expectation.fulfill()` : вызовите это при закрытии условия успеха обработчика завершения асинхронного метода, чтобы отметить, что ожидание было выполнено.

`wait (for: timeout :)` : тест продолжается до тех пор, пока не будут выполнены все ожидания или пока timeout не закончится, в зависимости от того, что произойдет раньше.

#### Также можно использовать Sheduler вместо expectation: 

- [x] [ImmediateScheduler](https://pointfreeco.github.io/combine-schedulers/ImmediateScheduler/)
- [x] [TestScheduler](https://pointfreeco.github.io/combine-schedulers/TestScheduler/)
- [x] [AnyScheduler](https://pointfreeco.github.io/combine-schedulers/AnyScheduler/)

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
