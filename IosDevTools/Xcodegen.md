# Xcodegen

1. :heavy_check_mark: [Generating xcodeproj’s with Xcodegen](https://betterprogramming.pub/generating-xcodeprojs-with-xcodegen-7d291cfc2f46)
2. :heavy_check_mark: [ProjectSpec](https://github.com/yonaskolb/XcodeGen/blob/master/Docs/ProjectSpec.md#options)
3. :heavy_check_mark: [An example project to test XcodeGen](https://github.com/fbernutz/XcodeGenExample)
4. :heavy_check_mark: [XcodeGen Tips and Tricks](https://medium.com/udemy-engineering/xcodegen-tips-and-tricks-3ad10728d8d0)

>  Избавьтесь от нечитаемых файлов xcodeproj и поздоровайтесь с читаемыми YAML файлами конфигурации проекта

 Необходимо создать YAML-файл для Xcodegen, который запускается при вводе команды `xcodegen` в терминале, [Xcodegen](https://github.com/yonaskolb/XcodeGen) прочитает project.yml файл и сгенерирует на его основе содержимое xcodeproj. Кроме того, все участники должны не забывать запускать xcodegen команду при переключении между ветками. Конфигураци пишется на файле [.yml]()

```
!!!Yml файлы очень чувствительны к табуляции!!! Для проверки корректности файла можно воспользовать [онлайн-конвертером](https://codebeautify.org/yaml-beautifier).
```

Разберем [свойства настроек](https://github.com/yonaskolb/XcodeGen/blob/master/Docs/ProjectSpec.md#options) файла project.yml: 
* Свойство name — это имя проекта. 
* Свойство options - применяет настройку конфигурации ко всему проекту. 
* Свойство target - все цели будут указаны в этом свойстве.
* Свойство type - типы этого таргета. Н/р: application, app-extension, framework, bundle. [Перечень всех типов](https://github.com/yonaskolb/XcodeGen/blob/master/Docs/ProjectSpec.md#:~:text=This%20will%20provide%20default).
 
    ***Статическая библиотека*** — это единица кода, связанная во время компиляции, которая не изменяется. Лучшее, более формальное определение можно найти в ![Википедии](https://en.wikipedia.org/wiki/Static_library);
  
    ***Динамическая библиотека (часть приложения)*** — единица кода и/или активы, связанные во время выполнения, которые могут изменяться. Однако только Apple разрешено создавать динамические библиотеки для iOS. Вам не разрешено создавать их, так как это приведет к отклонению вашего приложения. Библиотека от фреймворка в iOS отличается тем, что библиотека - это тот модуль, который подключается как полноценная часть приложения + методы которого больше не используются;
  
    ***Software Framework (скелет, API)*** - скомпилированный набор кода, который выполняет задачу... Cледовательно, вы можете фактически иметь статическую или динамическую структуру, которые обычно являются просто скомпилированными версиями библиотеки. Фреймворк от библиотеки в iOS отличается тем, что Фреймворк - это тот модуль, методы/переменные которого могут в дальнейшем использоваться;
  
* Свойство source - место расположения этого таргетаю. Н/р: `source: Extensions/ShareWith`. Но если несколько расположений, то нужно указывать `source: \n\t- path: Extensions/ShareWith`.

* Свойство include - показывает где еще находятся .yml файлы (где происходит описание спецификаций). Н/р: includes: [Modules/Utils]

* Свойство targetTemplates - позволяет создать общие настройки таргетов, чтобы их не прописывать несколько раз.

> Не забудьте указать в [gitignore](https://www.atlassian.com/git/tutorials/saving-changes/gitignore) файлы xcodeproj, после пользования Xcodegen. Пример: [.gitignore](/Common/Git/.gitignore)

