## Automatic Reference Counting/Автоматический подсчет ссылок

1. :heavy_check_mark: [Understanding Swift Copy-on-Write mechanisms](https://habr.com/ru/articles/209288/)

"Automatic Reference Counting (ARC) is a memory-management implementation in the Clang compiler for the Objective-C and Swift programming languages"

> Работа ARC - на этапе компиляции приложения в компилируемый код за программиста автоматически расставляет в нужных местах release (увеличение счетчика ссылок)/retain (инкрементирует счетчик ссылок)/autorelease (декрементирует счетчик ссылок). Этот механизм работает только для объектов, которые хранятся в куче (ссылочные типы).



В отличае от сборщика мусора, ARC не занимается автоматическим освобождением памяти от отработанных объектов и не запускает никаких фоновых процессов.


