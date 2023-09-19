## Какие различия между HEAD, GET, POST, PUT?

### GET

Используется для запроса содержимого указанного ресурса. С помощью метода GET можно также начать какой-либо процесс. В этом случае в тело ответного сообщения следует включить информацию о ходе выполнения процесса. Клиент может передавать параметры выполнения запроса в URI целевого ресурса после символа ?:

```https
GET /path/resource?param1=value1&param2=value2 HTTP/1.1
```

### HEAD

Аналогичен методу `GET`, за исключением того, что в ответе сервера отсутствует тело. Запрос `HEAD` обычно применяется для извлечения метаданных, проверки наличия ресурса (валидация URL) и чтобы узнать, не изменился ли он с момента последнего обращения. Заголовки ответа могут кэшироваться. При несовпадении метаданных ресурса с соответствующей информацией в кэше копия ресурса помечается как устаревшая.

### POST

Применяется для передачи пользовательских данных заданному ресурсу. Например, в блогах посетители обычно могут вводить свои комментарии к записям в HTML-форму, после чего они передаются серверу методом `POST` и он помещает их на страницу. При этом передаваемые данные (в примере с блогами — текст комментария) включаются в тело запроса. Аналогично с помощью метода `POST` обычно загружаются файлы на сервер. В отличие от метода `GET`, метод `POST` не считается идемпотентным, то есть многократное повторение одних и тех же запросов `POST` может возвращать разные результаты (например, после каждой отправки комментария будет появляться одна копия этого комментария).

```swift
var request = URLRequest(url: URL(string: "http://www.thisismylink.com/postName.php")!)
request.httpMethod = "POST"
let postString = "id=13&name=Jack"
request.httpBody = postString.data(using: .utf8)
let task = URLSession.shared.dataTask(with: request) { data, response, error in
  guard let data = data, error == nil else {                                                 
  // check for fundamental networking error
    print("error=\(error)")
    return
  }
  if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           
  // check for http errors
    print("statusCode should be 200, but is \(httpStatus.statusCode)")
    print("response = \(response)")
  }
  let responseString = String(data: data, encoding: .utf8)
  print("responseString = \(responseString)")
}
task.resume()
```

# PUT

Применяется для загрузки содержимого запроса на указанный в запросе URI. Если по заданному URI не существовало ресурса, то сервер создаёт его и возвращает статус 201 (Created). Если же был изменён ресурс, то сервер возвращает [200 (Ok)](https://github.com/eldaroid/iOSWiki/blob/master/ComputerScience/Networking/API/ResponseStatusCode.md#c%D1%82%D0%B0%D1%82%D1%83%D1%81-%D0%BA%D0%BE%D0%B4%D1%8B) или [204 (No Content)](https://github.com/eldaroid/iOSWiki/blob/master/ComputerScience/Networking/API/ResponseStatusCode.md#c%D1%82%D0%B0%D1%82%D1%83%D1%81-%D0%BA%D0%BE%D0%B4%D1%8B). Сервер не должен игнорировать некорректные заголовки Content-*, передаваемые клиентом вместе с сообщением. Если какой-то из этих заголовков не может быть распознан или не допустим при текущих условиях, то необходимо вернуть код ошибки [501 (Not Implemented)](https://github.com/eldaroid/iOSWiki/blob/master/ComputerScience/Networking/API/ResponseStatusCode.md#c%D1%82%D0%B0%D1%82%D1%83%D1%81-%D0%BA%D0%BE%D0%B4%D1%8B). Фундаментальное различие методов `POST` и `PUT` заключается в понимании предназначений URI ресурсов. Метод `POST` предполагает, что по указанному [URI](https://github.com/eldaroid/iOSWiki/blob/master/ComputerScience/Networking/API/URI%5CURL%5CURN.md#uriurlurn) будет производиться обработка передаваемого клиентом содержимого. Используя `PUT`, клиент предполагает, что загружаемое содержимое соответствует находящемуся по данному URI ресурсу.
