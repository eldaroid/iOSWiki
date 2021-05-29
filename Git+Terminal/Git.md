## Git

### Как изучать?

1. - [x] [Сбер: "Инструменты DevOps: Git"]()
2. - [ ] [Как работает Git](https://habr.com/ru/post/313890/)
3. - [ ] [Что скрывает от нас директория .git](https://habr.com/ru/post/143079/)
4. - [ ] [Про гит от Atlassian](https://www.atlassian.com/git/tutorials/learn-git-with-bitbucket-cloud)

### 1) про Git

> Проект был создан [Линусом Торвальдсом](https://github.com/torvalds) для управления разработкой ядра Linux. 
На сегодняшний день его поддерживает [Джунио Хамано](https://github.com/gitster?tab=repositories).

Для каждого коммита гит запоминает снимки изменившихся файлов целиком.
![DATA](https://github.com/eldaroid/pictures/blob/master/other/git_data.png)

#### Архитектура систем контроля версий (от англ. Version Control System, VCS)

Инструменты VCS имеют два основных типа удаленной архитектуры:

* централизованный (Centralized VCS);
Примеры таких систем: SVN, CVS.
<img src="https://github.com/eldaroid/pictures/blob/master/other/centralized_VCS.png" alt="alt text" width="250" height="250">

* распределенный (Distributed model);
Примеры таких систем: Git, Mercurial. Git имеет распределенную модель архитектуры, то есть не зависит от одного центрального сервера, на котором хранятся файлы. Вместо этого он работает полностью локально, сохраняя данные в папках на жестком диске, которые называются репозиторием. Тем не менее, вы можете хранить копию репозитория онлайн. Это облегчает работу над одним проектом для нескольких людей. Для такой работы используются сайты вроде github и bitbucket.
<img src="https://github.com/eldaroid/pictures/blob/master/other/decentralized_VCS.png" alt="alt text" width="250" height="250">

Родительский коммит - тот, от которого пошли разделения на ветки.
Имя основной ветки по умолчанию в Git — master.

#### Состояния файлов Git
Файл в Git может находится в одном из трёх состояний:

<img src="https://github.com/eldaroid/pictures/blob/master/other/git_files.png" alt="alt text" width="800" height="400">

* untracked (:white_circle:) — не добавлен в индекс для коммита, не вошли в последний спапшот и не подготовлены к коммиту.
* modified (:red_circle:) - объекты поменяли, но еще не зафиксировались.
* staged (:green_circle:) — добавлен в индекс для включения в коммит.
* commited (:white_circle:) — объект уже сохранен на базе.

### 2) Gitflow

Существуют различные модели ветвления, наиболее популярные: 
#### * [Git flow:](https://github.com/eldaroid/iosBasics/blob/master/Git%2BTerminal/Gitflow.md)

<img src="https://github.com/eldaroid/pictures/blob/master/other/GitFlow.png" alt="alt text" width="400" height="300">
 * [Github flow:](https://github.com/eldaroid/iosBasics/blob/master/Git%2BTerminal/Githubflow.md)

<img src="https://github.com/eldaroid/pictures/blob/master/other/GithubFlow.jpeg" alt="alt text" width="300" height="550">
[**Gitlab flow:**](https://github.com/eldaroid/iosBasics/blob/master/Git%2BTerminal/Gitlabflow.md)

<img src="https://github.com/eldaroid/pictures/blob/master/other/GitlabFlow.jpeg" alt="alt text" width="300" height="350">

> [Базовые принципы популярных моделей ветвления](https://www.atlassian.com/git/tutorials/comparing-workflows)
> * Любое значимое изменение должно оформляться как отдельная ветвь
> * Текущая версия главное ветви всегда корректна. В любой момент сборка проекта, проведенная из текущей ветви, должна быть успешной.
> * Версии проекта помечаются тегами. Выделенная и помеченная тегом версия более никогда не изменяется.
> * Любые рабочие, тестовые или демонтрационные версии проекта собираются только из репозитоиия системы. 

### 3) Практика

#### Просмотр истории коммитов

По умолчанию `git log` вывод в таком формате:

<img src="https://github.com/eldaroid/pictures/blob/master/other/gitlog.png" alt="alt text" width="300" height="300">

Удобный формат `git log --online`:

<img src="https://github.com/eldaroid/pictures/blob/master/other/gitlog--online.png" alt="alt text" width="550" height="250">

Опции: 
* --stat — выведет статистику для каждого коммита
* --graph — строит текстовый граф
* --decorate — покажет “головы” (HEAD)
* --all — покажет все ветки
* -- oneline - чтобы все это поместилось в одной строке

#### Удаляем ветку:
1) git checkout develop - переключаемся на любую ветку
2) git branch -d [your branch] - удаляем локальную
3) git push [origin] --delete [your branch] - удаляем удаленную. 
[origin] - то, что мы прописывали в git push "origin" HEAD:[your branch]

#### Создание ветки: 
1) git checkout -b bugfix/elizarov/ASSESSMENT-191
то же самое, что и : 
git branch bugfix/elizarov/ASSESSMENT-191
git checkout bugfix/elizarov/ASSESSMENT-191
2) git push --set-upstream origin bugfix/elizarov/ASSESSMENT-191

#### Удалить локальные изменения:
Git reset –hard HEAD – удаляет локальные изменения

#### Rebase
Куда: origin/release
Откуда: bugfix
git checkout origin/release && git fetch && git pull && git checkout bugfix
git rebase origin/release
git push -f

[Previous Theme](/Git%2BTerminal/Terminal.md) | [Back To Contents](https://github.com/eldaroid/iosBasics) |  [Next Theme](Git%2BTerminal)
