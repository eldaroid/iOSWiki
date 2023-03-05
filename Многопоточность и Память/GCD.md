## Grand Central Dispatch (GCD)

1. - [x] [!!! GCD queues: serial and concurrent](https://www.hapq.me/gcd-queues/)
2. - [x] [Про многопоточность 2. GCD](https://habr.com/ru/post/578752/)
3. - [x] [002. Дмитрий Галимзянов «GCD»](https://www.youtube.com/watch?v=6zx7N-6U6P4&list=PLQC2_0cDcSKAcuWNsWAwF8GT_lCU9QZNs&index=2)

GCD - технология управления многопоточность на базе паттерна пулл потоков. Вместо того чтобы программист сам создавал и управлял потоками за него это делает система. GCD вводит понятие очередь исполнения, представлена классом `DispatchQueue`, где очередь - список задач, которые необходимо выполнить.

> DispatchQueue - объект, который управляет выполнением задач последовательно (serial) или одновременно (concurrent) методом FIFO в основном потоке (sync) вашего приложения или в фоновом потоке (async). 

Пример фонового потока (async): 

```swift
let queue = DispatchQueue.global()
queue.async {
    // код выполнится в фоне, когда в этом потоке найдется свободный поток
}
```

Если мы хотим дождаться выполнение блока кода, то нужно выполнить задачу в основном потоке (sync), используя `sync { }`.

Наглядный пример sync и async:

<details><summary>Open</summary>
<p>
 
Существует два основных способа взаимодействия с очередями - sync и async. Данные способы подразумевают под собой методы, в которые мы будем передавать наши задачи в виде замыканий.

<details><summary>Sync</summary>
<p> 
 
**sync** – метод, позволяющий выполнять задачи синхронно по отношению к вызывающей очереди. Сперва взглянем на декларацию метода:

```swift
public func sync(execute block: () -> Void)
```
 
Как это работает? Представим, что у нас есть 7 задач, которые нам необходимо выполнить последовательно. Задачи в нашем случае представлены в виде функций:

```swift
func task1() {
    print(1)
}

func task2() {
    print(2)
}

func task3() {
    print(3)
}

func task4() {
    print(4)
}

func task5() {
    print(5)
}

func task6() {
    print(6)
}

func task7() {
    print(7)
}
```

Выполним эти задачи:

```swift
task1()
task2()
task3()
task4()
task5()
task6()
task7()
```
 
Все выполняемые задачи by default будут выполнятся в главном потоке, а если точнее на главной очереди:
 
<img src="https://habrastorage.org/r/w1560/getpro/habr/upload_files/867/38b/2d6/86738b2d6e5e0fefe6280a821d83b6cd.png" alt="alt text" width="700" height="300">

Ничего сложного, каждая задача дожидается своей очереди в порядке их вызова, так как главная очередь является последовательной. Усложним задачу и выполним task3 на другой serial очереди. Для этого нам необходимо создать новую последовательную очередь:
 
`let serialQueue = DispatchQueue(label: "ru.popov.serial-queue")` 

и увести выполнение task3 на только что созданную очередь. Для этого мы воспользуемся методом sync:
 
```swift
task1()
task2()
serialQueue.sync(execute: task3)
task4()
task5()
task6()
task7()
```
 
Визуализируем:
 
<img src="https://habrastorage.org/r/w1560/getpro/habr/upload_files/e69/886/80a/e6988680a9f6bccebfc1971d9a636f3a.png" alt="alt text" width="700" height="600">
 
Как мы можем видеть, задача task3 действительно выполняется на очереди serialQueue, в то время как основной поток ожидает ее выполнения. В этом и заключется суть метода sync, вызывающая очередь (в нашем случае main) будет ожидать до тех пор, пока выполняющая очередь (в нашем случае serialQueue) не вернет управление. Но что делать, если мы не хотим, чтобы вызывающая очередь дожидалась выполнения задачи task3? Для таких целей существует метод async.

</p>
</details>

<details><summary>Async</summary>
<p> 
 
**async** – метод, позволяющий выполнять задачи асинхронно по отношению к текущей очереди
 
Декларация async метода:
 
`public func async(group: DispatchGroup? = nil, qos: DispatchQoS = .unspecified, flags: DispatchWorkItemFlags = [], execute work: @escaping @convention(block) () -> Void)`

Как мы можем видеть, метод async требует передать большее количество аргументов, но сейчас нас интересует лишь execute work

Мы воспользуемся примером с семью задачами, но заменим вызов метода sync на async:
 
```swift
task1()
task2()
serialQueue.async(execute: task3)
task4()
task5()
task6()
task7()
```
 
И снова визуализируем:

<img src="https://habrastorage.org/r/w1560/getpro/habr/upload_files/9d9/33c/7dd/9d933c7dd1c9d9afa0c6c82d0a6963b9.png" alt="alt text" width="700" height="600">
 
Как мы можем видеть, задача task3 все так же выполняется на очереди serialQueue, но при этом main не дожидается ее выполнения и продолжает свою работу асинхронно. В этом и заключется суть метода async, вызывающая очередь (в нашем случае main) не будет ожидать выполнения задач на выполняющей очереди (в нашем случае serialQueue), а сразу же приступит к выполнения стоящих в очереди задач.
 
</p>
</details>
 
</p>
</details>

## Типы очередей - serial/concurrent

Задачи в Serial (системная очередь main) очереди выполняются в очереди **одна за другой** в **одном поток**:

<img src="http://www.hapq.me/content/images/2019/12/queue2-serial.png" alt="alt text" width="850" height="650">

Задачи в Concurrent (системная очередь global) очереди выполняются **параллельно** в **нескольких потоках**:

<img src="http://www.hapq.me/content/images/2019/12/Screen-Shot-2019-12-25-at-12.03.26-PM.png" alt="alt text" width="750" height="800">

[Примеры с задачами на понимание](https://habr.com/ru/post/578752/#:~:text=Задача%201)

### Context switch in concurrent

Поговорим немного про ресурсозатратность. Concurrent очередь достигает возможность параллить задачи благодаря множеству потоков, на которых она выполняет эти самые задачи. У всего есть своя цена и concurrent queue не исключение, процесс переключения между потоками является одним из самых ресурсозатратных в многопоточной среде, а имя ему context switch.

Переключение контекста (англ. context switch) — в многозадачных ОС и средах - процесс прекращения выполнения процессором одной задачи (процесса, потока, нити) с сохранением всей необходимой информации и состояния, необходимых для последующего продолжения с прерванного места, и восстановления и загрузки состояния задачи, к выполнению которой переходит процессор.

Не смотря на то, что context switch оптимизирован на уровне ОС, он все равно требует больших вычислительных ресурсов. Эти ресурсы в основном тратятся на сохранение контекста текущего процесса (что на самом деле задействовано в переключении контекста, зависит от архитектуры, операционной системы и количества совместно используемых ресурсов). В отличии от concurrent, serial очередь использует единственный поток, таким образом выполнение задач в очереди не приводит к context switch.

## Создание очередей

> Существует две системные очереди по умолчанию: main queue (serial - последовательная) и global queue (concurrent - параллельная с [label](https://github.com/eldaroid/iOSWiki/blob/master/Многопоточность%20и%20Память/Concurrency.md#:~:text=строка,%20необходимая%20для%20идентификации%20очереди.) глобальной очереди "com.apple.root.default-qos"). В то время как основная очередь является последовательной, глобальная очередь является параллельной.

В main очереди работает весь UI приложения, все анимации и реакции на ввод пользователя. Получая данных из базы данных или из сети необходимо перключаться на главный поток, чтобы отобразить их в UI. Лейблом главной очереди является строка com.apple.main-thread.

Помимо системных очередений, мы можем создавать собственные очереди, для этого нам необходимо создать объект типа DispatchQueue. Взглянем на декларацию инициализатора данного типа:

`convenience init(label: String, qos: DispatchQoS = .unspecified, attributes: DispatchQueue.Attributes = [], autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency = .inherit, target: DispatchQueue? = nil)`

Аргументы инициализатора:

* label – строка, необходимая для идентификации очереди. Так как приложение, библиотеки и фреймворки могут создавать свои собственные очереди, необходимо придерживаться DNS стиля, например ru.popov.queue для достижения уникальности. Так же идентификатор поможет определить очередь во время отладки.

* qos – необходим для приоритизации очереди уже знакомым нам [Quality Of Service](https://developer.apple.com/documentation/dispatch/dispatchqos/qosclass).

* attributes – [атрибуты](https://developer.apple.com/documentation/dispatch/dispatchqueue/attributes), определяющие поведение очереди. Такими атрибутами могут быть .concurrent, определяющий очередь, как параллельную или .initiallyInactive, определяющий очередь неактивной, до тех пор, пока не будет вызван метод очереди activate().

* autoreleaseFrequency – частота автоосвобождения объебктов очереди. (см. [DispatchQueue.AutoreleaseFrequency](https://developer.apple.com/documentation/dispatch/dispatchqueue/autoreleasefrequency))

* target – таргет очереди, в которой будут выполняться задачи. Таким образом возможно перенаправить выполнение задач на очередь, переданную в данный аргумент.

### Пример создания очереди

<details><summary>Open</summary>
<p> 

Создание **serial** очереди: `let demoSerialQueue = DispatchQueue(label: "ru.popov.serial-queue", qos: .utility)`.

В качестве единственного аргумента для вызова метода global() требует передать уже знакомый нам QoS. Таким образом мы можем использовать очередь с учетом приоритета текущей задачи. Освежим память и еще раз взглянем на [qos](https://developer.apple.com/documentation/dispatch/dispatchqos/qosclass), только уже через призму GCD. Фреймворк Dispatch имеет собственное перечисление приоритетов. 

Пример: `let demoConcurrentQueue = DispatchQueue(label: "ru.popov.concurrent-queue", qos: .utility, attributes: .concurrent)` или `let demoGlobalQueue = DispatchQueue.global(qos: .utility)`

Названия и задачи приоритетов совпадают с qos из Thread и pthread api:

```swift
public enum QoSClass {
    // наивысший приоритет
    // Для задач взаимодействия с пользователем в данный момент и результат выполнения необходимо получить как можно скорее
    // Откладывать эти задачи приведет к видимым лагам
    // Н/р: обработка изображений с камеры в реальном времени
    case userInteractive
    
    
    // Задачи, которые запустил пользователь и их выполнения необходимо дождаться, но не мгновенно
    // Н/р: обновление данные после pull to refresh
    // Такая задача может выполняться несколько секунд
    case userInitiated
    
    // очередь, которая создает, когда в qos мы ничего не передали
    case `default`
    
    // Пользователь не запрашивал выполнение задачи 
    // и ее выполнение можно отложить
    case utility
    
    // самый низкий приоритет
    // используется когда нам совсем не критично время выполнение задачи
    case background
}
```

</p>
</details>
    
## Semaphore

<details><summary>Open</summary>
<p> 
    
Semaphore – базовый инструмент синхронизации в GCD. Semaphore позволяет нам ограничить количество потоков, которые могут единовременно обращаться к очереди. Для этого необходимо передать количество потоков в инициализатор класса DispatchSemaphore `public init(value: Int)`.

> Semaphore то же самое что и [мьютех](https://github.com/eldaroid/iOSWiki/blob/master/Многопоточность%20и%20Память/Concurrency.md#:~:text=Мьютекс), только с возможностью использовать счетчик > 1

Помимо ограничения количества потоков, семафор позволяет блокировать очередь до тех пор, пока не будет вызван метод signal. Пример:

```swift
// Создаем очередь
let serialQueue = DispatchQueue(label: "ru.popov.serial-queue")

// Создаем семафор
let semaphore = DispatchSemaphore(value: 0)

// Усыпляем serialQueue на 5 секунд, после вызываем метод signal тем самым
serialQueue.async {
    sleep(5)
    print("async method Queue")
    
    // Разблокировавыем семафор
    semaphore.signal() // увеличивает счетчик value на 1
}

print("semaphore wait")
// Блокируем очередь
semaphore.wait() // уменьшает счетчик value на 1
print("semaphore waited")

// Print:
// semaphore wait
// async method Queue
// semaphore waited
```

Методы signal и wait работают по принципу инкрементирования / декрементирования внутреннего каунтера семафора (аналогично рекурсивному mutex). Это означает, что поток будет разблокирован только тогда, когда каунтер равен значению value, которое мы передаем в инициализатор.

</p>
</details>

## Dispatch work item

<details><summary>Open</summary>
<p> 

Фреймворк Dispatch позволяет ставить в очередь на выполнение не только замыкания, но и объекты типа `DispatchWorkItem`
    
DispatchWorkItem – класс, являющийся абстракцией над выполняемой задачей, который предоставляет нам ряд полезных методов. Например метод notify, позволяющий уведомить какую-либо очередь о выполнении задачи и следом выполнить какую-либо работу на уведомленной очереди. Рассмотрим пример реализации DispatchWorkItem:
    
```swift
// Создаем очередь
let serialQueue = DispatchQueue(label: "ru.popov.serial-queue")

// Создаем DispatchWorkItem и передаем в него замыкание (задачу)
let workItem = DispatchWorkItem {
    print("DispatchWorkItem task")
}

// Реализуем метод notify, передаем в него очередь, на которой необходимо будет выполнить задачу после завершения выполнения этого DispatchWorkItem
workItem.notify(queue: DispatchQueue.main) {
    print("DispatchWorkItem completed")
}

// Выполняем DispatchWorkItem на очереди serialQueue
serialQueue.async(execute: workItem)
```

Попробуем реализовать данную логику без использования DispatchWorkItem:

```swift
let serialQueue = DispatchQueue(label: "ru.popov.serial-queue")

serialQueue.async {
    print("task")
    
    DispatchQueue.main.sync {
        print("completed")
    }
}

```

Сравнивая данные примеры видно, что DispatchWorkItem позволяет нам более явно задать логику, без использования вложенных друг в друга замыканий и хаотичных вызовов методов `async/sync`
    
Помимо notify, DispatchWorkItem дает нам возможность отменять задачу с помощью метода cancel. Важно понимать, что задачу можно отменить только в том случае, если она на момент отмены ожидает в очереди. Если поток уже начал выполнять задачу, она не будет отменена. Рассмотрим пример реализации метода cancel
   
```swift
// Создаем очередь
let serialQueue = DispatchQueue(label: "ru.denisegaluev.serial-queue")

// Создаем DispatchWorkItem и передаем в него замыкание (задачу)
let workItem = DispatchWorkItem {
    print("DispatchWorkItem task")
}

// Усыпляем serialQueue на 1 секунду и сразу возвращаем управление
serialQueue.async {
    print("zzzZZZZ")
    sleep(1)
    print("Awaked")
}

// Ставим workItem в очередь serialQueue и сразу возвращаем управление
serialQueue.async(execute: workItem)

// Отменяем workItem
workItem.cancel()
```
    
Пока serialQueue будет спать, мы успеем отменить workItem, тем самым удалив его из очереди serialQueue

</p>
</details>

## Dispatch Group

<details><summary>Open</summary>
<p> 

Dispatch Group позволяет реализовать ожидание, которое можно увеличивать и уменьшать с разных потоков. 


DispatchGroup – объект, позволяющий объединить задачи в группу и синхронизировать их поведение. Группа позволяет присоединить к ней несколько задачь или DispatchWorkItem и запланировать их асинхронное выполнение на одной или нескольких очередях. Когда все задачи в группе будут выполнены, группа уведомит об этом какую-либо очередь и выполнит на ней completion handler. Так же группа позволяет нам дождаться выполнения задач в группе синхронно, без использования уведомления.

Рассмотрим примеры использования DispatchGroup:

<details><summary>Пример №1</summary>
<p> 
    
```swift
// Создаем очередь
let serialQueue = DispatchQueue(label: "ru.popov.serial-queue")

// Создаем 2 DispatchWorkItem
let workItem1 = DispatchWorkItem {
    print("workItem1: zzzZZZ")
    sleep(3)
    print("workItem1: awaked")
}

let workItem2 = DispatchWorkItem {
    print("workItem2: zzzZZZ")
    sleep(3)
    print("workItem2: awaked")
}

// Создаем группу
let group = DispatchGroup()

// Добавляем workItem в группе, планируем его выполнение на очереди serialQueue и сразу возвращаем управление
serialQueue.async(group: group, execute: workItem1)
serialQueue.async(group: group, execute: workItem2)

// Устанавливаем уведомление. Замыкание будет выполнено на главной очереди сразу после того, как все задачи в группе будут выполнены.
group.notify(queue: DispatchQueue.main) {
    print("All tasks on group completed")
}

// Console: 
// workItem1: zzzZZZ
// workItem1: awaked
// workItem2: zzzZZZ
// workItem2: awaked
// All tasks on group completed
```
    
Рассмотрим, как добиться такого же поведения, но уже использую enter и leave вместо уведомления:
```swift
// Создаем параллельную очередь
let concurrentQueue = DispatchQueue(label: "ru.denisegaluev.concurrent-queue", attributes: .concurrent)

// Создаем группу
let group = DispatchGroup()

// Создаем DispatchWorkItem
let workItem1 = DispatchWorkItem {
    print("workItem1: zzzZZZ")
    sleep(3)
    print("workItem1: awaked")
    
    // Покидаем группу
    group.leave()
}

let workItem2 = DispatchWorkItem {
    print("workItem2: zzzZZZ")
    sleep(3)
    print("workItem2: awaked")
    
    group.leave()
}

// Входим в группу
group.enter()
// Вызы
concurrentQueue.async(execute: workItem1)

group.enter()
concurrentQueue.async(execute: workItem2)

// Ожидаем, пока все задачи в группе закончат свое выполнение
group.wait()
print("All tasks on group completed")

// Console:
// workItem1: zzzZZZ
// workItem2: zzzZZZ
// workItem1: awaked
// workItem2: awaked
// All tasks on group completed
```
    
Обратите внимание, что в данном случае нам не нужно добавлять задачи в группу (в аргумент group метода async). Вместо этого мы вызываем метод группы enter, тем самым указывая явно, что задача вошла в группу, а в конце выполнения задачи вызываем метод leave, тем самым явно указывая, что задача завершила свое выполнение.

</p>
</details>
 
<details><summary>Пример №2</summary>
<p> 
    
```swift
let group = DispatchGroup()
// внутренний счетчик = 0, поэтому вызываем enter
// входим в группу
group.enter() // +1 
DispatchQueue.global().async {
    print("Hello")
    // выходим из группы
    group.leave() // -1
}
// блокируется до тех пор, пока внутренний счетчик не обнулится
group.wait()
print("World" )
    
// Print:
// Hello
// Worldx
```
    
Тот же пример, но с методом notify:
    
```swift
let group = DispatchGroup()
// внутренний счетчик = 0, поэтому вызываем enter
// входим в группу
group.enter() // +1 
DispatchQueue.global().async {
    print("Hello")
    // выходим из группы
    group.leave() // -1
}
// блокируется до тех пор, пока внутренний счетчик не обнулится
group.notify(queue: .main) {
    print("All tasks are done" )
}
```
    
</p>
</details>

> Таким образом очередь в которой был вызван wait (в нашем случае главная очередь), будет ожидать до тех пор, пока все задачи в группе не завершат свое выполнение и не вызовут метод leave
    
</p>
</details>

## Dispatch barrier

Dispatch barrier – механизм синхронизации задач в очереди. Для того, чтобы добавить барьер, необходимо передать соответствующий флаг в метода async:

```swift
// Создаем параллельную очередь
let concurrentQueue = DispatchQueue(label: "ru.popov.concurrent-queue", attributes: .concurrent)

// Помечаем асинхронный вызов флагом .barrier
concurrentQueue.async(flags: .barrier) {
    // ...
}
```

Когда мы добавляем барьер в параллельную очередь, она откладывает выполнение задачи, помеченной барьером (и все остальные, которые поступят в очередь во время выполнения такой задачи), до тех пор, пока все предыдущие задачи не будут выполнены. После того, как все предудщие задачи будут выполнены, очередь выполнит задачу, помеченную барьером самостоятельно. Как только задача с барьером будет выполнена, очередь вернется к своему нормальному режиму работы.

<img src="https://habrastorage.org/r/w1560/getpro/habr/upload_files/203/414/217/203414217a2aab50f8c96be9e291283a.png" alt="alt text" width="800" height="500">

Разберемся, как работать с барьером на примере реализации read write lock:

```swift
class DispatchBarrierTesting {
    // Создаем параллельную очередь
    private let concurrentQueue = DispatchQueue(label: "ru.denisegaluev.concurrent-queue", attributes: .concurrent)
    
    // Создаем переменную _value для внутреннего использования
    private var _value: String = ""
    
    // Создаем thread safe переменную value для внешнего использования
    var value: String {
        get {
            var tmp: String = ""
            
            concurrentQueue.sync {
                tmp = _value
            }
            
            return tmp
        }
        
        set {
            concurrentQueue.async(flags: .barrier) {
                self._value = newValue
            }
        }
    }
}
```

Данная реализация позволяет гарантировать, что в момент чтения, свойство value не будет изменено из другой очереди.

##

