## Class vs Struct

Классы и структуры дают разработчикам Swift возможность создавать собственные сложные типы со свойствами и методами, но у них есть пять важных отличий:

| Comparision | Class | Structure  |
|------------|------------|------------|
| **Type** | Classes are reference types| Structures are value types |
| **Initializer** | Классы не имеют синтезированных поэлементных инициализаторов (memberwise initializers) | Struct gets a default initializer automatically |
| **Deinit** | У классов есть [деинициализаторы](https://www.youtube.com/watch?v=G7jBlu3-yYo&ab_channel=%D0%A2%D0%9E%D0%9F%D0%9B%D0%95%D0%A1) - методы, вызываемые при уничтожении экземпляра класса | У структур нет `deinit` |
| **Inheritance** | Classes have an inheritance that allows one class to inherit the characteristics of another | Structures do not support inheritance |
| **Storage** | Class instances are stored on the heap | Structure properties are stored on the stack |
| **Unique of copy** | Копии классов фактически указывают на одни и те же общие данные | Копии структур всегда уникальны |
| **Thread−safe** | Classes are not fully thread−safe | The structure is thread−safe or singleton at all times |
| **Recreating** | При изменении свойств в классе он не пересоздается, поэтому в классах нужно помечать изменчивые переменные ключевым словом `@Published` | При изменении свойства в структуре - она каждый раз пересоздается, поэтому структура автоматически подменяет view экраны |

