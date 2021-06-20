## Terminal

### Как изучать?

1. - [x] [Курс «Инструменты промышленной разработки». Лекция 1 (Данила Кутенин)](https://www.youtube.com/watch?v=LGFMbSNEY20&t=3060s&ab_channel=ANDROIDHELPER%5BUNITY3Dandmore%5DANDROIDHELPER%5BUNITY3Dandmore%5D)

### Запуск нескольких команд 

**";"** : `command_1; command_2; command_3` - последовательный запуск нескольких команд за раз. 

```
При запуске команд таким образом, они выполняются не параллельно, а последовательно. 
Если вам нужен именно первый вариант, то используйте конструкцию (command_1 &); (command_2 &)
```

**"&"** : `sudo apt update & sudo apt upgrade &` - запуск команд в фоновом режиме.

**"&&" (and)** :`git add -A && git commit -m "message" && git push` - запуск нескольких команд за раз при условии **успеха** предыдущей.

**"|"** : `ls -l | less` - когда выходные данные первой команды действуют как входные данные для второй.

**"||" (or)** : `comand1 || comand` - очень похож на оператор «else» в программировании. Выполняет вторую команду только в случае **сбоя** при выполнении первой команды

### Текст в терминале

**">>" и ">"** : `echo "Something" >> text.txt` - добавить слово в файл. `echo "Something" >> text.txt` - перезаписать файл и оставить там только "Something".

* Чтобы прервать работающую команду нажмите комбинацию `Ctrl+C`, а чтобы продолжить — `%`(пример: запустите команду `tail | head`). 
* `Ctrl+Z` посылает процессу сигнал, который приказывает ему заморозиться. Само собой разумеется он уходит в бэкграунд (background) – в фоновый режим.
* `Ctrl+D` говорит терминалу, что надо зарегистрировать так называемый EOF (пример: запустите команду `cat`)
[Ctrl + C, Ctrl + D, Ctrl + Z](https://younglinux.info/bash/ctrl-c)


`Ctrl+R <условие>` - простой обратный поиск и использование предыдущих команд.

```
По умолчанию показывается только один результат. 
Чтобы листать вверх - нужно повторно нажать Ctrl+R. Чтобы листать вниз - delete (клавиша над enter)
Чтобы выйти из поиска, нажмите Ctrl+C или Ctrl+Z.
```

`Ctrl+A и Ctrl+E` - переход в начало и конец строки.

`Ctrl+Command+T` - в той же директории открыть новое окно. `Ctrl+T` - в новой директории.

### Скрипты и алиасы
---
#### Алиасы
Задаются следующим образом: 

`alias ll='ls -alF'`

Чтобы алиасы работали всегда их нужно закинуть в файл .bashrc или .zshrc: вписываем `alias ll="ls -alF"`, после перезапуска терминала алиасы вступают в силу. 

#### Базовые скрипты

Пример скрипта в терминале:

```console
➜  Desktop mcd() {
function> mkdir -p "$1"
function> cd "$1"
function> }
➜  Desktop mcd testFolder
➜  testFolder 
```

Создать исполняемый файл:

`vim python.sh` 

```console
➜  Desktop vim python.py
➜  Desktop which python 
/usr/bin/python
➜  Desktop chmod +x python.py 
➜  Desktop ./python.py 
hello
```

-> `chmod +x python.sh` -> `./python.sh`

```console
➜  Desktop cat python.py 
#!/usr/bin/python3
print("hello")
```

```
#! - [Шебанг](https://ru.wikipedia.org/wiki/%D0%A8%D0%B5%D0%B1%D0%B0%D0%BD%D0%B3_(Unix)) означает, что нужно взять бинарник (/bin) из этой директории и начать его исполнять
Для проверки где происходит исполнение скрипта на нужном нам языке, пишем `which (название языка/команды)`
Для того, чтобы дать права на исполнение созданному файлу нужно написать команду `chmod +x (название файла)`
```
$:

```console
➜  Desktop print_args() {
echo $1
echo $@
echo $#
echo $$
}
➜  Desktop print_args 1 2 3 4 helloWorld!
1
1 2 3 4 helloWorld!
5
877
```

```
$1 - первый переданный аргумент функции
$@ - показать все аргументы
$# - показать количество аргументов
$$ - показать PID (process ID)
```
#### Скрипт при запуске терминала

vim .zshrc или .bashrc

sudo -S purge - очищает ненужные процессы.

3я строчка - это тот скрипт, который ты хочешь запускать при запуске терминала.

![alt text](https://github.com/eldaroid/pictures/blob/master/other/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202021-05-17%20%D0%B2%2019.57.39.jpg)

[Back To Contents](https://github.com/eldaroid/iosBasics) |  [Next Theme](/Git%2BTerminal/Git.md)






