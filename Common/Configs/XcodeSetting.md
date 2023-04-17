## 1. Xcode Settings

### Download

[Ссылка на скачивание Xcode](https://xcodereleases.com/)

### Key binding (связка ключей)

Удаление строки: Settings -> Key binding (связка ключей) -> Delete Line (Delitions). Sets to Ctrl + K

### Text Editing

Лента сворачивания: Settings -> Text Editing -> Display -> Code folding ribbon

Editing:

<img src="https://github.com/eldaroid/pictures/blob/master/iOSWiki/TextEditing-Editing.jpeg" alt="alt text" width="420" height="350">


### Navigation 
Настройка навигации:

<img src="https://github.com/eldaroid/pictures/blob/master/other/navigation_Xcode.png" alt="alt text" width="500" height="350">

---
Appearance: 

<img src="https://github.com/eldaroid/pictures/blob/master/other/settings.jpg" alt="alt text" width="600" height="350">

### Editor

Editor -> Invisibles :heavy_check_mark:

Editor -> Wrap Lines :heavy_multiplication_x:

## 2. ShortCuts

Свернуть функцию: ⌘ ⌥ ←/→ (Cmd + Option + ←/→)

Поиск по файлу: ⌘F (Cmd + F)

Поиск по проекту: ⌘ ⌥ F (Cmd + Option + F)

Закомментировать строка: ⌘ / (Cmd + /)

Описать функцию/переменную/объект: ⌘ ⌥ / (Cmd + Option + /)

Двигать строку вверх/вниз:  ⌘ ⌥ ]/[ (Cmd + Option + ]/[)

Добавить окно редактора: ⌘ ⌃ T (Cmd + Ctrl + T)

Закрыть окно редактора: ⌘ W (Cmd + W)x2

Переключение между окнами редакторами (editors): ⌘ J (Cmd + J) + ←/→

Открывать функцию/переменную/объект в новом окне редактора: ⌘ ⌥ ⌃ (Cmd + Option + Ctrl + Click)

Открывать функцию/переменную/объект в вкладке вкладке: ⌘ ⌃ (Cmd + Ctrl + Click)

## 3. Debugging

Стоит знать основы и понимать, что Apple / Xcode пытается сказать вам через logs.

```
H = Horizontal constraint(for leading and Trailing)
V = Vertical constraint(top and bottom edge)
h = height
w = width

TopEdge    -> V:|-(points)-[VIEW:memoryAddress] 
BottomEdge -> V:[VIEW:memoryAddress]-(points)-|
Leading    -> H:|-(points)-[VIEW:memoryAddress] 
Trailing   -> H:[VIEW:memoryAddress] -(points)-|
height     -> h= --& v=--& V:[VIEW:memoryAddress((points)] 
width      -> VIEW:memoryAddress.width == points 
between    -> H:[VIEW 1]-(51)-[VIEW 2] 
```

#### Буквы в навигаторе проектов

A-Added (это новый файл, который был добавлен в репозиторий)

C-конфликт (в файле есть конфликт)

D-удалено (файл был удален)

M-Modified (существующий файл был изменен)

R-переименован (файл был переименован)

U-Untracked (файл новый или был изменен, но еще не добавлен в репозиторий)

## 4. Terminal

Время компиляции: `defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES`

Теперь показывается время компиляции. [Статья](https://flexiple.com/ios/xcode-build-optimization-a-definitive-guide/#:~:text=Note%201)
