## any vs some

1. [Design protocol interfaces in Swift](https://developer.apple.com/videos/play/wwdc2022/110353/)
2. [Understanding type erasure in Swift  ](https://www.donnywals.com/understanding-type-erasure-in-swift/)

"Мне все равно, что используется для этого типа, если он соответствует этому протоколу" - some и any.

Как объяснили инженеры Apple, экзистенциальный тип похож на коробку, в которой находится что-то, соответствующее определенному протоколу:

![any vs some](https://i0.wp.com/swiftsenpai.com/wp-content/uploads/2022/06/Understand-some-any-comparison.jpeg?w=1420&ssl=1)

Для компилятора экзистенциальный тип — это просто «коробка», он понятия не имеет, что внутри коробки.

* `any` ключевое слово просто аннотирует, что данный тип является [экзистенциальным типом](./ExistentialTypes.md). any — это возможность динамически заменять реализацию во время выполнения, присваивая ей новое значение другого конкретного типа Протокола (чего мы не смогл быи сделать если бы она определена как let). any типы мы не можем сравнить.  

* при `some` ([opaque type](./OpaqueType.md)) мы знаем с каким мы типом работаем, но не хотим его показывать наружу. То есть сохраняется идентичность типа: компилятор имеет доступ к информации о типе, но для использующих метод возвращается протокол (тип закрыт протоколом). some типы мы можем сравнивать.

### Example

Any:
```swift
protocol Vehicle {
    var name: String { get }

    associatedtype FuelType
    func fillGasTank(with fuel: FuelType)
}

struct Car: Vehicle {
    let name = "car"
    func fillGasTank(with fuel: Gasoline) {
        print("Fill \(name) with \(fuel.name)")
    }
}

struct Bus: Vehicle {
    let name = "bus"
    func fillGasTank(with fuel: Diesel) {
        print("Fill \(name) with \(fuel.name)")
    }
}

struct Gasoline { let name = "gasoline" }

struct Diesel { let name = "diesel" }

// ✅ No compile error when changing the underlying data type
var myCar: any Vehicle = Car()
myCar = Bus()
myCar = Car()

// ✅ No compile error when returning different kind of concrete type 
func createAnyVehicle(isPublicTransport: Bool) -> any Vehicle {
    if isPublicTransport {
        return Bus()
    } else {
        return Car()
    }
}
```


Some #1: 
```swift
// 🚫 compile error when changing the underlying data type
var myCar: some Vehicle = Car()
myCar = Bus()
myCar = Car()

// 🚫 compile error when returning different kind of concrete type 
func createAnyVehicle(isPublicTransport: Bool) -> some Vehicle {
    if isPublicTransport {
        return Bus()
    } else {
        return Car()
    }
}
```

Some #2: 
```swift
 // ✅ No compile error when changing the underlying data type
var myCar: any Vehicle = Car()
myCar = Bus()
myCar = Car()

// ✅ No compile error when returning equal kind of concrete type 
func createAnyVehicle(isPublicTransport: Bool) -> some Vehicle {
    if isPublicTransport {
        return Car()
    } else {
        return Car()
    }
}
```

