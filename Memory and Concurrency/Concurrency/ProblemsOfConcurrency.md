# Проблемы многопоточности

1. :heavy_check_mark: [Многопоточность (concurrency) в Swift 3. GCD и Dispatch Queues](https://habr.com/ru/post/320152/#:~:text=race%20condition)
2. :heavy_check_mark: [Dispatch Queues](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationQueues/OperationQueues.html#//apple_ref/doc/uid/TP40008091-CH102-SW28)
3. :heavy_check_mark: [Многопоточность: Runloop, Многопоточность в iOS и macOS, Deadlock, Livelock, DispatchGroup, Синхронные и асинхронные задачи, @synchronized, Мьютекс, Семафор](https://github.com/dashvlas/awesome-ios-interview/blob/master/Resources/Russian.md#Способы-достижения-многопоточности-в-ios-и-macos)
4. :heavy_check_mark: [Problem%20Of%20Concurrency]https://www.kodeco.com/books/concurrency-by-tutorials/v2.0/chapters/5-concurrency-problems#toc-chapter-008-anchor-001

Как только мы позволяем задачам (tasks) работать параллельно, появляются проблемы, связанные с тем, что разные задачи захотят получить доступ к одним и тем же ресурсам.
Основных проблемы три:

## ***cостояние гонки (`race condition`)*** — ошибка проектирования многопоточной системы или приложения, при которой работа системы или приложения зависит от того, в каком порядке выполняются части кода;

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
print(value)
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

<img src="https://habrastorage.org/r/w1560/getpro/habr/upload_files/d85/a5a/bf2/d85a5abf2b488e80d925d650e446d115.png" alt="alt text" width="900" height="800">
  
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

print(value)
```
  
И снова визуализируем:
 
<img src="https://habrastorage.org/r/w1560/getpro/habr/upload_files/d85/a5a/bf2/d85a5abf2b488e80d925d650e446d115.png" alt="alt text" width="900" height="800">
  
</p>
</details>

> Race condition является одной из самых сложно отлавливаемых (но не самых страшных) проблем. Проще избежать, чем исправлять, поэтому к проектированию многопоточного кода нужно подходить ответственно и с умом.

## ***инверсия приоритетов (`priority inversion`)*** - логическое несоответствие с правилами планирования — задача с более высоким приоритетом находится в ожидании в то время как низкоприоритетная задача выполняется;

## ***взаимная блокировка (`deadlock`)*** — ситуация в многопоточной системе, при которой несколько потоков находятся в состоянии бесконечного ожидания ресурсов, занятых самими этими потоками;
  
<details><summary>Пример</summary>
<p>  
  
```swift
let queue = DispatchQueue(label: "com.popov.app.exampleQueue")
queue.async {
    // ...
    queue.sync { // deadlock
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
