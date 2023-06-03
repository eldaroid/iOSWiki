## World wide web

// TODO: HTTP HTTPS

![www](https://upload.wikimedia.org/wikipedia/commons/3/39/Internet_Key_Layers.png)

### В чем разница между HTTP и HTTPS?

И то, и другое является протоколами, с помощью которых происходит взаимодействие пользователей с сайтами в интернете. Сама аббревиатура HTTP обозначает Hyper Text Transfer Protocol то есть протокол передачи гипертекста. Та самая буква, которая отличает термины между собой – S – означает Security.

#### HTTP

При отправлении и получении пакетов данных по сети интернет через HTTP используется протокол управления передачей (TCP). Соединение при этом происходит через порт 80. Клиент отправляет запрос на HTTP-сервер, где располагается сайт, после чего сервер посылает ответ. Этот ответ содержит информацию о состоянии завершения. Выглядит это примерно так: HTTP/1.1 200 OK. За прошедшие годы протокол TCP был некоторым образом усовершенствован, но по большей части остается таким же, каким был в 1974 году. HTTP также применяет UDP (протокол пользовательских дейтаграмм), который был разработан Дэвидом Ридом ещё в 1980-м. Это менее надёжный протокол, однако его активно применяются в видеоконференциях, играх и потоковой передаче. Благодаря этому можно отбрасывать и принимать отдельные пакеты в произвольном порядке для увеличения производительности.

#### HTTPS

HTTPS означает безопасный протокол передачи гипертекста (или HTTP через TLS или SSL). Когда вы вводите https:// в адресную строку перед доменом, вы передаёте браузеру информацию о подключении через HTTPS. Сайты, работающие по протоколу HTTPS, обычно имеют перенаправление, то есть даже при вводе обычного http:// происходит переадресация для доставки по защищенному соединению. HTTPS также использует TCP (протокол управления передачей) для отправки и получения пакетов данных. Это делается через порт 443 соединением, зашифрованным TSL. HTTPS шифрует данные открытым ключом, а затем получатель расшифровывает его. Открытый ключ лежит на сервере и входит в SSL-сертификат. Сертификаты, в свою очередь, криптографически подписываются центром сертификации (ЦС). Каждый браузер имеет список доверенных ЦС. Любой подписанный центром сертификации сертификат, входящий в список доверенных, получает в адресной строке значок в виде зеленого замка.

#### В чем разница между HTTP и HTTPS

* По-разному записывается URL-адрес. Для HTTP — http://, а для HTTPS — https://.

* HTTP является не защищенным, а HTTPS защищенным.

* HTTP посылает данные через порт 80, а HTTPS использует порт 443.

* HTTP работает на уровне приложений, а HTTPS — на транспортном уровне.

* Для HTTP не нужны SSL-сертификаты; для HTTPS нужен SSL-сертификат, подписанный центром сертификации.

* HTTP не требует проверки домена, тогда как HTTPS требует хотя бы проверки домена, а для некоторых сертификатов даже проверки юридического документа.

* В HTTP нет шифрования, HTTPS шифрует данные перед отправкой.




