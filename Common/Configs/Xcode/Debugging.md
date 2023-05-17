## Debugging

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

## Буквы в навигаторе проектов

A-Added (это новый файл, который был добавлен в репозиторий)

C-конфликт (в файле есть конфликт)

D-удалено (файл был удален)

M-Modified (существующий файл был изменен)

R-переименован (файл был переименован)

U-Untracked (файл новый или был изменен, но еще не добавлен в репозиторий)