# Copy On Write (CoW)

1. :heavy_check_mark: [Understanding Swift Copy-on-Write mechanisms](https://medium.com/@lucianoalmeida1/understanding-swift-copy-on-write-mechanisms-52ac31d68f2f)

Copy On Write - м

Типы значений - 

|Value Types | Referene Types|
|Struct | Class|
|Enum | Function|
|Double | Closure|
|String | |
|Set | |
|Tuple | |
|Array | |
|Dictionary | |

Основным отличием ссылочных типов от типов значений является то, что первые передаются по ссылкам, в то время как вторые копируются. У этого есть ряд своих плюсов таких как то, что типы значений работают быстрее, потому что хранятся на стеке, а не в куче, используют статическую диспетчеризацию и прочее. 
