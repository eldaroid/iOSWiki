## Property observers (только для структур и классов)

1. :heavy_check_mark: [When should you use willSet rather than didSet?](https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-willset-rather-than-didset)
2. :heavy_check_mark: [Properties](https://www.hackingwithswift.com/read/0/17/properties)

* willSet - вызывается когда свойство собирается быть изменененным (до его изменения). В willSet Swift предоставляет вашему коду специальное значение, называемое newValue, которое содержит новое значение свойства.

* didSet - вызывается когда свойство уже изменено (после его изменения). В didSet вам дается oldValue для представления предыдущего значения.

! Property observers не могут быть назначены константам (let):
```swift
 let awayTeamScore: Int {
     didSet { print("Boo - they scored!") }}
```

Пример для понимания:

```swift
class Counter {
    var count: Int {
        willSet {
            print("willSet", count)
            count += 2
            print("willSetAfter", count)
        }
        
        didSet {
            print("didSetbefore", count)
            count += 200
            print("didSetAfter", count)
        }
    }
    
    init(count: Int) {
        self.count = count
    }
}

print("count = 2000")
let test = Counter (count: 2000)

print("count += 20")
test.count += 20

print("count +=1")
test.count += 1
print("count += 1 end")

print("result", test.count)

//count = 2000
//count += 20
//willSet 2000
//willSetAfter 2002
//didSetbefore 2020
//didSetAfter 2220
//count +=1
//willSet 2220
//willSetAfter 2222
//didSetbefore 2221
//didSetAfter 2421
//count += 1 end
//result 2421
```

