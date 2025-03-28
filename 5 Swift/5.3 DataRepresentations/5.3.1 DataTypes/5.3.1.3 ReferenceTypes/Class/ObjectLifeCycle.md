### Жизненный цикл объекта Swift

[Объекты](/5%20Swift/5.3%20DataRepresentations/5.3.1%20DataTypes/5.3.1.3%20ReferenceTypes/Class/ObjectLifeCycle.md) Swift не уничтожаются сразу. Вместо этого они проходят 5 этапов своего жизненного цикла: live → deiniting → deinited → freed → dead:

![LifecycleOfObject](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Concurrency/SideTables.png?raw=true)

1) На Live состоянии объект жив. Его счетчики ссылок выставлены по 1. Если есть указатель на слабую ссылку, то создается side table

2) Когда strong RC достигает нуля, вызывается deinit(), и объект переходит в следующее состояние. Это состояние Deiniting. На данном этапе операции со strong ссылками не действуют. При чтении через unowned ссылку будет срабатывать assertion failure. Но новые unowned ссылки еще могут добавляться. Если есть боковая таблица(side table), то weak операции будут возвращать nil. Далее из этого состояния уже можно перейти в два других.

    5) Первое: если нет боковой таблицы (то есть нет weak ссылок) и нет unowned ссылок, то объект переходит в Dead состояние и сразу удаляется из памяти.

    3) Второе: если у нас есть unowned или weak ссылки, объект переходит в состояние Deinited. В этом состоянии функция `deinit()` завершена. Сохранение и чтение сильных или слабых ссылок невозможно. Как и сохранение новых unowned ссылок. При попытке чтения unowned ссылки вызывается assertion failure. Из этого состояния также возможно два исхода.

        5) В том случае, если нет слабых ссылок, объект переходит непосредственно в состояние Dead, которое было описано выше.

        4) В случае наличия weak ссылок, а значит и боковой таблицы, осуществляется переход в состояние Freed (Освобожден). В Freed состоянии объект уже полностью освобожден и не занимает места в памяти, но его боковая таблица остается жива.

4) После того как счетчик слабых ссылок достигает нуля, боковая таблица также удаляется и освобождает память (free), и осуществляется переход в финальное состояние — Dead.

5) В мертвом состоянии от объекта ничего не осталось, кроме указателя на него. Указатель на HeapObject освобождается из кучи, не оставляя следов объекта в памяти.

---