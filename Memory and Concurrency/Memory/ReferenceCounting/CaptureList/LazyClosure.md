## Lazy closure

1. [Why Your Lazy Vars Aren’t Creating Strong Reference Cycles in iOS](https://michael-kiley.medium.com/why-your-lazy-vars-arent-creating-strong-reference-cycles-in-ios-d512ff2c9403)

Если мы напишем следующий код:

```swift
class Person {
    let firstName : String!
    let lastName : String!
    
    lazy var fullName : String = {
        self.firstName + " " + self.lastName
    }()

//  или
//  var fullName : String {
//      self.firstName + " " + self.lastName
//  }
    
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("Person deinit called")
    }
}

var person : Person? = Person(firstName: "John", lastName: "Deere")
print(person!.fullName)
person = nil
```
Несмотря на то, что внутри [closure](/Swift/Function%20and%20Closure.md) мы ссылаем на ссамого себя `deinit` будет вызван!

### ПОЧЕМУ?!

На этот вопрос [ответил](https://twitter.com/jckarter/status/988839008997273600) Джо Грофф старший инженер по компиляции Swift в Apple:

![LazyClosure](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*vw9SY_CipzDcS1-jia7QrQ.png)

> lazy closure автоматически становится `@noescape`, и поэтому вы можете ссылаться на себя неявно и без использования слабой или бесхозяйной ссылки

Поскольку `lazy closure` свойства применяется сразу после доступа к свойству, и этот доступ будет происходить только через экземпляр класса, членом которого оно является, ленивые свойства по умолчанию создаются `@noescape`!

`@noescape` — это [property wrapper](https://github.com/eldaroid/iOSWiki/blob/adcf1d081a5cfa4495e7171d2208415606b8cc1f/Swift/Glossary.md#property-wrappers ) ключевого слова Swift, указывающее, что замыкание не будет сохранено его владельцем и **не будет вызываться вне времени жизни его контекста**; это отличается от замыканий `@escaping`, которые можно вызывать после возврата закрывающей функции.

Поскольку замыкания `@noescape` не переживут своего контекста, они не создают сильных циклов ссылок, а правила, касающиеся списков захватов и явных ссылок на себя, больше не требуются.






