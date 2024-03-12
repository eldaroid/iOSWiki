# Frame vs Bounds

**Frame** - расположение и размер вида с использованием системы координат родительского вида. Photo frame size and position of frame on wall is called frame.

**Bounds** - расположение и размер представления с использованием собственной системы координат. Photo frame size and photo frame origin (x,y), is called as bounds.

![FrameVsBounds1](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Frameworks/UIKit/FrameVSBounds.jpeg?raw=true)

В этом примере желтая рамка представляет собой рамку изображения относительно супервида. Зеленая рамка представляет границы представления. Красная точка на обоих изображениях представляет собой начало рамки или границ.

* Frame = (x: 0, y: 0, ширина: 70, высота: 140)

* Bounds = (x: 0, y: 0, ширина: 70, высота: 140)

### Что произойдет, если вы измените frame на x=40 and y=60?

![FrameVsBounds2](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Frameworks/UIKit/FrameVSBoundsOffset.jpeg?raw=true)

* Frame = (x: 40, y: 60, ширина: 70, высота: 140)

* Bounds = (x: 0, y: 0, ширина: 70, высота: 140)

* Если вы измените систему координат в frame, размер вида останется таким же в кадре и границах

![FrameVsBounds3](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Frameworks/UIKit/SetOriginFrameAndBounds.gif?raw=true)

### Что произойдет, если вы преобразуете вид, используя 20 градусов по часовой стрелке?

![FrameVsBounds4](https://github.com/eldaroid/pictures/blob/master/iOSWiki/Frameworks/UIKit/FrameVSBoundsRotation.jpeg?raw=true)

* Frame = (x: 20, y: 52, width: 180, height: 187)

* Bounds = (x: 0, y: 0, ширина: 70, высота: 140)

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fwy9Jn%2FbtrjmabKZWZ%2FWSVDp4JHEtpGQOK9jggJz1%2Fimg.jpg)








