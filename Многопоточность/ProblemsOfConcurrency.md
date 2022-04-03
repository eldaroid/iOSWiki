# Проблемы многопоточности

1. :heavy_check_mark: [Многопоточность (concurrency) в Swift 3. GCD и Dispatch Queues](https://habr.com/ru/post/320152/#:~:text=race%20condition)
2. :heavy_check_mark: [Dispatch Queues](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationQueues/OperationQueues.html#//apple_ref/doc/uid/TP40008091-CH102-SW28)
3. [Многопоточность: Runloop, Многопоточность в iOS и macOS, Deadlock, Livelock, DispatchGroup, Синхронные и асинхронные задачи, @synchronized, Мьютекс, Семафор](https://github.com/dashvlas/awesome-ios-interview/blob/master/Resources/Russian.md#%D0%A1%D0%BF%D0%BE%D1%81%D0%BE%D0%B1%D1%8B-%D0%B4%D0%BE%D1%81%D1%82%D0%B8%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F-%D0%BC%D0%BD%D0%BE%D0%B3%D0%BE%D0%BF%D0%BE%D1%82%D0%BE%D1%87%D0%BD%D0%BE%D1%81%D1%82%D0%B8-%D0%B2-ios-%D0%B8-macos)

Как только мы позволяем задачам (tasks) работать параллельно, появляются проблемы, связанные с тем, что разные задачи захотят получить доступ к одним и тем же ресурсам.
Основных проблемы три:

* ***cостояние гонки (`race condition`)*** — ошибка проектирования многопоточной системы или приложения, при которой работа системы или приложения зависит от того, в каком порядке выполняются части кода;

* ***инверсия приоритетов (`priority inversion`)*** - логическое несоответствие с правилами планирования — задача с более высоким приоритетом находится в ожидании в то время как низкоприоритетная задача выполняется;

* ***взаимная блокировка (`deadlock`)*** — ситуация в многопоточной системе, при которой несколько потоков находятся в состоянии бесконечного ожидания ресурсов, занятых самими этими потоками;
  
То есть следующий код вызовет `deadlock`:
```
let queue = DispatchQueue(label: "com.tursunov.app.exampleQueue")
queue.async {
    // ...
    queue.sync { // deadlock
        // ...
    }
}
```
> НИКОГДА НЕ вызывайте метод sync на main queue, потому что это приведет к взаимной блокировке (deadlock) вашего приложения!
