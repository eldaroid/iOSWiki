////: A UIKit based Playground for presenting user interface
//
//import UIKit
//import PlaygroundSupport
//
//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()

import UIKit

//var str = "Eldar@"
//var x = 5
//var y = 3
//var z = x + y
//
//
//var images = UIImage(named: "2.jpg")
//
//var name:String = "Johnathan"
//
//if name.count > 5 {
//    print("FFFF")
//}
//
//switch name.count {
//case 6...10:
//    print("6///10")
//default:
//    print("last")
//}
//
//var number = 0;
//while number < 2{
//    number * number;
//    number += 1;
//}
//
//var animal:[String] = ["Cow", "Dog", "Parrot"]
//
//var cuteness = ["Cow" : "Not very",
//                "Dog" : "Very",
//                "Parrot" : "N"
//]
////let cuteness_animal = cuteness["Cows"]
////cuteness_animal
//
//for an in animal
//{
//    cuteness[an]
//}
//
//func DoMath(a:Double, b:Double, operation:String) {
//    print("Performing", operation, "on", a, "and", b);
//}
//
//DoMath(a:2.0, b:1.0, operation: "+")

var image = [
    [3, 7, 10],
    [6, 4, 2],
    [8, 5, 2]
]

func raiseLowerValuesOfImage(image: inout [[Int]]){
    for row in 0..<image.count{
        for col in 0..<image[row].count{
            image[row][col]
            if (image[row][col] < 5){
                image[row][col] = 5
            }
        }
    }
}

raiseLowerValuesOfImage(image: &image)

image

//let x: Int = 1.1

//func add(a: Int, to b: Int) -> Int {
//    return a + b
//}
//
//add(a: <#T##Int#>, to: <#T##Int#>)

let x: Double = 1


//let array = [0.5,1,2,3]
//let array: [Int] = []
//let array = [Int]()
//
//func add(firstNumber a: Int, to b: Int) -> Int {
//    return a + b
//}
//
////call it this way:
//add( 10, to: 10)

let array = [Int]()

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
