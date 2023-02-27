## 1. Xcode Settings

### Key binding (связка ключей)

Удаление строки: Settings -> Key binding (связка ключей) -> Delete Line (Delitions). Sets to Ctrl + K

### Text Editing

Лента сворачивания: Settings -> Text Editing -> Display -> Code folding ribbon

Editing: 
<img src="https://github.com/eldaroid/pictures/blob/master/iOSWiki/TextEditing-Editing.jpeg" alt="alt text" width="420" height="250">


### Navigation 
Настройка навигации:
<img src="https://github.com/eldaroid/pictures/blob/master/other/navigation_Xcode.png" alt="alt text" width="420" height="250">

---
Appearance: 
<img src="https://github.com/eldaroid/pictures/blob/master/other/settings.jpg" alt="alt text" width="420" height="350">

### Editor

Editor -> Invisibles :heavy_check_mark:

Editor -> Wrap Lines :heavy_multiplication_x:

## 2. Debugging

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

### Буквы в навигаторе проектов

A-Added (это новый файл, который был добавлен в репозиторий)

C-конфликт (в файле есть конфликт)

D-удалено (файл был удален)

M-Modified (существующий файл был изменен)

R-переименован (файл был переименован)

U-Untracked (файл новый или был изменен, но еще не добавлен в репозиторий)

## 3. Открывать файлы

Открывать класс в новой вкладке: 

`Cmd + Ctrl + Click` - в новой вкладке

`Cmd + Ctrl + Option + Click` - в новом окне

## 4. Terminal

Время компиляции: defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES

Теперь показывается время компиляции: [alt text](https://flexiple.com/ios/xcode-build-optimization-a-definitive-guide/#:~:text=Note%201)
