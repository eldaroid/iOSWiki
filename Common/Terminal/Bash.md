## Bash

Bash: “Bourne again shell”. Есть много оболочек, которые могут выполнять команды UNIX, и та, которая используется в терминале Mac - Bash .
Она была создана Брайаном Фоксом для операционной системы GNU и является альтернативой Bourne Shell. Она служит интерфейсом между пользователем и ядром, который изолирует пользователя от сложности функций ядра.


### Базовые скрипты

Пример скрипта в терминале:

```console
➜  mcd() {
mkdir -p "$1"
cd "$1"
}
➜  mcd testFolder
➜  testFolder 
```

Создать исполняемый файл:

`vim python.sh` 

```console
➜  vim python.py
➜  which python 
/usr/bin/python
➜  Desktop chmod +x python.py 
➜  ./python.py 
hello
```

-> `chmod +x python.sh` -> `./python.sh`

```console
➜  cat python.py 
#!/usr/bin/python3
print("hello")
```


> #! - [Шебанг](https://ru.wikipedia.org/wiki/%D0%A8%D0%B5%D0%B1%D0%B0%D0%BD%D0%B3_(Unix)) указывает на выполнение бинарного файла из этой директории (/bin). Н/р: `#!/usr/bin/env python3`
Для проверки где происходит исполнение скрипта на нужном нам языке, пишем `which (название языка/команды)`
Для того, чтобы дать права на исполнение созданному файлу нужно написать команду `chmod +x (название файла)`

Можно использовать `#!/usr/bin/env bash -x` для получения вывода в консоль самого скрипта.

### Операторы

#### $:

```console
➜  print_args() {
echo $1
echo $@
echo $#
echo $$
}
➜  print_args 1 2 3 4 helloWorld!
1
1 2 3 4 helloWorld!
5
877
```

> $1 - первый переданный аргумент функции
$@ - показать все аргументы
$# - показать количество аргументов
$$ - показать PID (process ID)

#### Сравнение

![Photo](https://miro.medium.com/v2/resize:fit:640/format:webp/1*aYsht2NilmpKze9NWnK7UA.png)

`[20 -eq 20]` = true

#### Переменные

```bash
NAME=${1}
echo "Hello to $NAME"
```

# Output_1: Hello to 

```bash
NAME=${1?Error: no name given}
echo "Hello to $NAME"
```

# Output_2: Error: no name given

```bash
NAME=${1:-ME}
echo "Hello to $NAME"
```

# Output_3: Hello to ME








