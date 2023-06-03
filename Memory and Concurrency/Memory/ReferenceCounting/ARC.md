## Automatic Reference Counting/Автоматический подсчет ссылок

1. :heavy_check_mark: [Understanding Swift Copy-on-Write mechanisms](https://habr.com/ru/articles/209288/)

"Automatic Reference Counting (ARC) is a memory-management implementation in the Clang compiler for the Objective-C and Swift programming languages"

> Работа ARC - на этапе компиляции приложения в компилируемый код за программиста автоматически расставляет в нужных местах release (декремент - уменьшает счетчика ссылок)/retain (инкрементирует - увеличивает счетчик ссылок)/autorelease (декрементирует - уменьшает счетчик ссылок). Этот механизм работает только для объектов, которые хранятся в куче (ссылочные типы).


#### ARC vs [Garbage collector](./GarbageCollector.md)

ARC не занимается автоматическим освобождением не запускает никаких фоновых процессов. 

GC работает во время выполнения программы (runtime) с помощью кода, который периодически запускается и проверяет объекты в фоновом процессе. ARC работает во время компиляции и вставляет retain и release автоматически в код.Часто это сказывается на производительности, потому что процесс сборки мусора должен выяснить, какую память удалить («пометить и очистить»).




