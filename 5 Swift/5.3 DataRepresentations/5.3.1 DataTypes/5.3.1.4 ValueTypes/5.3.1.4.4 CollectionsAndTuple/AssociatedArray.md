## Ассоциативные массивы (словари в Swift или Set) или Hashed Collections

У него есть и другие названия: "словарь", "мап" (от слова map). В разных языках ему соответствуют разные типы данных. Например, в других языках это:

* Ruby — Hash;
* Lua — Table;
* Python — Dictionary;
* JavaScript — Object;
* Elixir/Java — Map;
* Swift - Dictionary/Set;

Ассоциативный массив, хранит пары в виде связанного списка (open hash, closed address) или массива пар (closed hash, open address). Индекс элемента равен хеш-функции от ключа i = hash(key). Разбиение множества на подмножества происходит с помощью хеш функции (пример: телефонная книга).

![hash table](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Swift/hash_table.png?raw=true)

---

[5.3.1.4.4 Collections And Tuple Theme Folder](../5.3.1.4.4%20CollectionsAndTuple/) | [Back To iOSWiki Contents](https://github.com/eldaroid/iOSWiki) | [Collections Theme](./Collections.md)