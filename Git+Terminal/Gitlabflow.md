### Gitlab Flow

> Gitlab Flow – модель, являющаяся некоторым симбиозом Git Flow и Github Flow. 
Она также проста как и Github Flow, но в то же время позволяет контролировать релиз как Git Flow.

<img src="https://github.com/eldaroid/pictures/blob/master/other/GitlabFlow.jpeg" alt="alt text" width="300" height="350">

#### Принципы

* Основная ветка master – текущая стабильная версия

* Вспомогательные feature или hotfix ветки ответвляются от master и сливаются обратно в неё через pull-request

* Стабильная ветка production для автоматического деплоя на пром, в которую переносится код из master в тот момент, когда нужно выложиться

* Возможно использование дополнительных веток для различных сред

* Все слияния происходят только через pull-request’ы

| Плюсы: | Минусы: |
| ------------- |------------------|
| Готовый функционал сразу же готов к отправке на пром | Требует крайне высокой культуры разработки и сопровождения |
| Простая и прозрачная схема работы для разработчика | Требует максимальной автоматизации процессов тестирования и доставки |

#### Дополнительные материалы:

* [GitLab Flow](https://habrahabr.ru/company/softmart/blog/316686/)

* [What is GitLab Flow?](https://about.gitlab.com/2014/09/29/gitlab-flow/ )

---

[Previous Theme](/Git%2BTerminal/Github.md) | [Back To Contents](https://github.com/eldaroid/iosBasics)
