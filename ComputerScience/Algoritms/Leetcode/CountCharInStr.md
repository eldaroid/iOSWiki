## Count Char In Str

1. [Yandex Contest](https://contest.yandex.ru/contest/8458/problems/A/)

input: 1) input1 = ab, 2) input2 = aabbccd
output: 4

Самый грубый способ подсчитать вхождение буквы в строку:

```swift
func howManyTimes(str: String, char: Character) -> Int {
    var letterCount = 0
    
    for letter in str {
        if letter == char {
            letterCount += 1
        }
    }
    
    return letterCount
}
```

Более лаконичный способ:

```swift
func howManyTimes(str: String, char: Character) -> Int {
    str.reduce(0) { $1 == char ? $0 + 1 : $0 }
}
```

Теперь давайте посчитаем вхождение строки в строку:

```swift
print(input1.reduce(0) { $0 + howManyTimes(str: input2, char: $1) })
```
