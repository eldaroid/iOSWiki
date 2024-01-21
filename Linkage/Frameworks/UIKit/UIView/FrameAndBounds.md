# Frame vs Bounds

**Frame** - расположение и размер вида с использованием системы координат родительского вида. Photo frame size and position of frame on wall is called frame.

**Bounds** - расположение и размер представления с использованием собственной системы координат. Photo frame size and photo frame origin (x,y), is called as bounds.

![FrameVsBounds1](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*TpkX2cY8SMnseoVVwEY_Zg.png)

В этом примере желтая рамка представляет собой рамку изображения относительно супервида. Зеленая рамка представляет границы представления. Красная точка на обоих изображениях представляет собой начало рамки или границ.

* Frame = (x: 0, y: 0, ширина: 70, высота: 140)

* Bounds = (x: 0, y: 0, ширина: 70, высота: 140)

### Что произойдет, если вы измените frmae на x=40 and y=60?

![FrameVsBounds2](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*8YX-rUcpNA1UaO0Mm3HHNQ.png)

* Frame = (x: 40, y: 60, ширина: 70, высота: 140)

* Bounds = (x: 0, y: 0, ширина: 70, высота: 140)

* Если вы измените систему координат в frame, размер вида останется таким же в кадре и границах

### Что произойдет, если вы преобразуете вид, используя 20 градусов по часовой стрелке?

![FrameVsBounds3](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*RxxB2ZzvM1xhWVZS1KpgAA.png)

* Frame = (x: 20, y: 52, width: 180, height: 187)

* Bounds = (x: 0, y: 0, ширина: 70, высота: 140)









