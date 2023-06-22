# Проблемы многопоточности

1. [Многопоточность (concurrency) в Swift 3. GCD и Dispatch Queues](https://habr.com/ru/post/320152/#:~:text=race%20condition)
2. [Dispatch Queues](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationQueues/OperationQueues.html#//apple_ref/doc/uid/TP40008091-CH102-SW28)
3. [Многопоточность: Runloop, Многопоточность в iOS и macOS, Deadlock, Livelock, DispatchGroup, Синхронные и асинхронные задачи, @synchronized, Мьютекс, Семафор](https://github.com/dashvlas/awesome-ios-interview/blob/master/Resources/Russian.md#Способы-достижения-многопоточности-в-ios-и-macos)
4. [Problem Of Concurrency](https://www.kodeco.com/books/concurrency-by-tutorials/v2.0/chapters/5-concurrency-problems#toc-chapter-008-anchor-001)
5. [Race Conditions and Critical Sections
](https://jenkov.com/tutorials/java-concurrency/race-conditions-and-critical-sections.html)

Как только мы позволяем задачам (tasks) работать параллельно, появляются проблемы, связанные с тем, что разные задачи захотят получить доступ к одним и тем же ресурсам.
Основных проблемы три:

## ***Состояние гонки (`race condition или critical section access`)*** 

О шибка проектирования многопоточной системы или приложения, при которой работа системы или приложения зависит от того, в каком порядке выполняются части кода.  Когда несколько потоков обращаются к одному и тому же куску кода в памяти (сritical section), и результат может различаться в зависимости от последовательности, в которой выполняются потоки, говорят, что критическая секция содержит состояние гонки.

Critical section - это секция кода, которыя выполнятся несколькими потоками.


<details><summary>Пример №1</summary>
<p> 

Пример взят [отсюда](https://habr.com/ru/post/578752/#:~:text=Race%20Condition).
  
```swift
// 1
var value: Int = 0
let serialQueue = DispatchQueue(label: "ru.popov.serial-queue")

// 2
func increment() { value += 1 }

// 3
serialQueue.async {
    // 4
    sleep(5)
    increment()
}

// 5
print(value)

// 6
value = 10

// 7
serialQueue.sync {
    increment()
}

// 8
print(value) // 12
```
  
1. Создаем свойство value и последовательную очередь serialQueue

2. Описываем функцию инкрементирования value

3. Планируем задачу и сразу же возвращаем управление вызывающей очереди

4. Имитируем продолжительную работу усыпляя поток и тут же вызываем функцию increment

5. Выводим в консоль значение переменной value, получаем 0 и вот тут начинается самое интересное. Для полноты картины представьте, что начиная с этого пункта и до конца сниппета, код находится в другой части приложения, а зависимости (value, serialQueue) переданы через DI. То есть вы и понятия не имеете, что через 5 секунд value будет инкрементирован. Мы получаем в консоли значение 0 и для нас это своего рода source of truth.

6. Передаем в переменную value новое значение

7. На этот раз инкрементируем синхронно

8. Снова выводим значение value в консоль. Ожидаем получить 11, но получаем 12.

Попробуем визуализировать пример:

<img src="https://habrastorage.org/r/w1560/getpro/habr/upload_files/d85/a5a/bf2/d85a5abf2b488e80d925d650e446d115.png" alt="alt text" width="700" height="550">


Чтобы решить нашу, достаточно синхронизировать вызывающую очередь и serialQueue, тогда мы сможем гарантировать работу с актуальным значением value:
  
```swift
var value: Int = 0
let serialQueue = DispatchQueue(label: "ru.popov.serial-queue")

func increment() { value += 1 }

serialQueue.sync {
    sleep(5)
    increment()
}

print(value)

value = 10

serialQueue.sync {
    increment()
}

print(value) // 11
```
  
И снова визуализируем:
 
<img src="https://habrastorage.org/getpro/habr/upload_files/203/414/217/203414217a2aab50f8c96be9e291283a.png" alt="alt text" width="700" height="550">
  
</p>
</details>



> Race condition является одной из самых сложно отлавливаемых (но не самых страшных) проблем. Проще избежать, чем исправлять, поэтому к проектированию многопоточного кода нужно подходить ответственно и с умом.

Решение проблемы:

1) Actor;
2) примитивы [мьютекса](./Concurrency.md)

## ***Инверсия приоритетов (`priority inversion`)*** 

Логическое несоответствие с правилами планирования — задача с более высоким приоритетом находится в ожидании в то время как низкоприоритетная задача выполняется;

Низкоприоритетная захватывает ресурс и не отдает его более важной по приоритету задаче и высокоприоритетная ждет выполнения низкоприоритетной задачи.  

## ***Взаимная блокировка (`deadlock`)*** 

Ситуация в многопоточной системе, при которой несколько потоков находятся в состоянии бесконечного ожидания ресурсов, занятых самими этими потоками.

> В swift возникает, когда очередь вызывает sync внутри самой себя
  
<details><summary>Пример</summary>
<p>  

Первое закрытие не может быть завершено до тех пор, пока не будет запущено второе закрытие:

```swift
let serialQueue = DispatchQueue(label: "com.popov.app.exampleQueue")
serialQueue.sync {
    // ...
    serialQueue.sync { // deadlock
        // ...
    }
}
```

```swift
// на главной очереди
DispatchQueue.main.sync { // deadlock
}
```

</p>
</details>

> НИКОГДА НЕ вызывайте метод sync на main queue, потому что это приведет к взаимной блокировке (deadlock) вашего приложения!

## Thread Explosion

1. [Understanding Thread Explosion](https://swiftsenpai.com/swift/swift-concurrency-prevent-thread-explosion/)

В качестве общего эталона мы можем сослаться на пример, приведенный в этом видео [WWDC](https://developer.apple.com/videos/play/wwdc2021/10254/?time=514), согласно которому система, которая выполняет в 16 раз больше потоков, чем ее ядра ЦП, считается подверженной взрывному росту потоков.

Поскольку Grand Central Dispatch (GCD) не имеет встроенного механизма, предотвращающего взрыв потока, его довольно легко создать с помощью очереди отправки.

<details><summary>Рассмотрим следующий код:</summary>
<p>

```swift
final class HeavyWork {
    static func dispatchGlobal(seconds: UInt32) {
        DispatchQueue.global(qos: .background).async {
            sleep(seconds)
        }
    }
}

// Execution:
for _ in 1...150 {
    HeavyWork.dispatchGlobal(seconds: 3)
}
```

После выполнения приведенный выше код создаст в общей сложности 150 потоков, что приведет к взрыву потоков. В этом можно убедиться, приостановив выполнение и проверив навигатор отладки.

Навигатор отладки, показывающий взрыв потока:
![Навигатор отладки, показывающий взрыв потока](https://i0.wp.com/swiftsenpai.com/wp-content/uploads/2022/11/sc-prevent-explosion-gcd-debug-nav.png?resize=1024%2C663&ssl=1) 













тьбть

