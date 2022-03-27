# Xcodegen

1. :heavy_check_mark: [Generating xcodeproj’s with Xcodegen](https://betterprogramming.pub/generating-xcodeprojs-with-xcodegen-7d291cfc2f46)

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
* Свойство source - место расположения этого таргетаю. Н/р: `source: Extensions/ShareWith`. Но если несколько расположений, то нужно указывать `source: \n\t- path: Extensions/ShareWith`.

> Не забудьте указать в [gitignore](https://www.atlassian.com/git/tutorials/saving-changes/gitignore) файлы xcodeproj, после пользования Xcodegen. Пример: [.gitignore](/Common/Git/.gitignore)
