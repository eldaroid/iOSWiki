# Copy On Write (CoW)

1. :heavy_check_mark: [Understanding Swift Copy-on-Write mechanisms](https://medium.com/@lucianoalmeida1/understanding-swift-copy-on-write-mechanisms-52ac31d68f2f)

### Зачем CoW нужна

|Value Types (хранятся в [стеке](./RandomAccessMemory/Stack.md)) | Referene Types (хранятся в [куче](./RandomAccessMemory/Heap.md))|
|------------|------------|
|Struct | Class|
|Enum | Function|
|Double | Closure|
|String | |
|Set | |
|Tuple | |
|Array | |
|Dictionary | |

Основным отличием [ссылочных типов](/Swift/DataStructures/ListValueAndReferenceTypes.md) от типов значений является то, что первые передаются по ссылкам, в то время как вторые копируются.

> На скорость копирования влияет то, что примитивные типы, такие как целые числа и числа с плавающей запятой, хранятся в регистрах ЦП, и при их копировании нет необходимости обращаться к оперативной памяти. Но ольшинство расширяемых типов Swift, таких как строки, массивы, наборы и словари, используют другую логику - копируются при записи(copy-on-write).

У этого есть ряд своих плюсов таких как то, что типы значений работают быстрее, потому что хранятся на [стеке](/Memory%20and%20Concurrency/Memory/RandomAccessMemory/Stack.md), а не в [куче](/Memory%20and%20Concurrency/Memory/RandomAccessMemory/Heap.md), используют [статическую диспетчеризацию](/Swift/MethodDispatch/MethodDispatch.md) и прочее. 

Однако можно задаться вопросом “а зачем копировать данные, если мы их не меняем?”. Пример, представьте себе массив с 1000 элементами внутри него: если вы скопируете этот массив в другую переменную, Swift должен будет скопировать все 1000 элементов, даже если два массива окажутся одинаковыми.

Эта проблема решается с помощью копирования при записи: когда вы указываете две переменные на один и тот же массив, они обе указывают на одни и те же базовые данные. А само полное копирование происходит только в момент мутации. 

Таким образом, откладывая операцию копирования до тех пор, пока она действительно не понадобится, Swift может гарантировать, что работа не будет выполнена впустую.

