# Лучшие практики обновления верстки UIView

![layoutIfNeeded](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Frameworks/UIKit/LayoutEngine.jpg?raw=true)

В кратце:

* Используем setNeedsLayout, если нам необходимо настроить одновременно большую верстку и мы можем сделать это асинхронно (с возможной разницей в 2-3 кадра); 
* используем layoutIfNeeded, если нам необходимо синхронно прямо сейчас обновить верстку экрана;
* layoutSubviews используется для задания frame`ов при перерисовки, в основном переопределяем метод.

| **<-- setNeedsLayout** | **layoutIfNeeded -->** |
|---|---|

![setNeedsLayout](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Frameworks/UIKit/setNeedsLayout2.gif?raw=true)
![layoutIfNeeded](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Frameworks/UIKit/layoutIfNeeded2.gif?raw=true)

## setNeedsLayout

Метод setNeedsLayout для UIView сообщает системе, что вы хотите, чтобы она разметила и перерисовала это View и все его Subview, когда придет время для цикла обновления.

Это асинхронное действие, поэтому метод возвращает управление немедленно немедленно, но только спустя некоторое время перерисовка макета действительно происходят, и вы не можете точно узнать, когда будет этот происходить цикл обновления.

Вызывайте этот метод в главном потоке вашего приложения, когда вы хотите настроить отрисовку Subviews. Этот метод записывает запрос и сразу же вернет управление. Поскольку этот метод не вызывает немедленного обновления, а вместо этого ожидает следующего цикла обновления, вы можете использовать его для аннулирования отрисовки нескольких viewa перед обновлением любой из этих отрисовок. Такое поведение позволяет консолидировать все обновления макета в один цикл обновления, что обычно лучше для производительности.


## layoutIfNeeded

Используйте этот метод, чтобы заставить view обновить свою верстку немедленно. При использовании автоматической компоновки механизм обновляет положение view по мере необходимости для соответствия изменений в констрейнтах. Используя view, которое получает сообщение в качестве основного view, этот метод размещает sub layout, начиная с основого. Если верстка view не обновилась, этот метод завершается без изменения макета или вызова методов, связанных с изменением верстки макета.

## layoutSubviews

> И LayoutIfNeeded, и setNeedsLayout вызывают LayoutSubViews().

Стандартная реализация использует constraints, которые установлены для определения размера и положения любых view. Подклассы могут переопределять этот метод если это необходимо, чтобы выполнить более точную компоновку своих subviews. Вы должны переопределить этот метод, только если autolayout и поведения на основе constraintов в subviews не позволяют реальзовать желаемое поведение. Вы можете использовать свою реализацию для прямой установки прямоугольников фреймов ваших подпредставлений. Вы не должны вызывать этот метод напрямую. Если вы хотите принудительно обновить экран - вызовите метод setNeedsLayout(), чтобы сделать это до следующего обновления экрана. Если вы хотите немедленно обновить макет ваших представлений, вызовите - layoutIfNeeded().

## P.S.

Код который я воспроизводил для анимаций:

```swift
@IBAction func heightPressed(_ sender: AnyObject) {
    self.blueHeight.constant = self.view.bounds.height - 100.0
    UIView.animate(withDuration: 2.0, animations: {
        self.view.setNeedsLayout()
    }) 
}
```

