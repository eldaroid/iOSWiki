## Хуки Git

1. [Official Git doc](https://git-scm.com/docs/githooks)
2. [Отрабатываем Git hooks на автоматизации commit message](https://habr.com/ru/companies/dins/articles/584562/)


Гит Хук — кастомный скрипт, выполняющийся до или после событий вроде commit, push. Каждый проект после инициализации содержит папку .git/hooks, в которой Git ищет скрипты для выполнения при наступлении событий.  

Хуки разделяются на клиентские (локальные) и серверные (удаленные). Локальные хуки не затрагивают мою команду, и их можно оптимизировать под себя как угодно. 

> Чтобы активировать хуки (`$GIT_DIR/.git/hooks/`), их следует переименовать, удалив их расширение .sample.

![](https://habrastorage.org/r/w1560/getpro/habr/upload_files/3a1/c55/63c/3a1c5563cc04614d32a994c37d8ed546.png)

Локальные хуки бывают нескольких типов и срабатывают после создания commit’a:

* `pre-commit` выполняется каждый раз при вызове git commit. На этом этапе можно выполнять различные проверки commit’ов.

* `prepare-commit-msg` выполняется после `pre-commit` и позволяет работать с commit message (круто, то, что надо!)

* `commit-msg` похож на `prepare-commit-msg`, но вызывается после того, как вы ввели commit message. Это, например, хорошая возможность высветить предупреждение разработчикам о том, что сообщение commit’a не соответствует принятым стандартам.

* `post-commit` вызывается сразу после commit-msg хука. К примеру, так можно триггерить отправку письма начальнику после каждого commit’a.

> Локальные хуки нельзя запушить на сервер. [Why it is not possible to git add .git/hooks/my-hook](https://stackoverflow.com/questions/5165239/why-it-is-not-possible-to-git-add-git-hooks-my-hook/5165299#5165299)




