//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import UIKit
var hello = "Hello, "; var playground = "playground"
for i in 0..<64 {
    var point = sin(Double(i) * 100)
}

print(str)

NSLog(str)

print (hello, playground)

print (hello, playground, separator:"-", terminator:"\n")

print ("\(hello) viewer")

var goodbyeString: String = "GoodBye"
print(goodbyeString)


var aWord: String?

aWord = "Me is a String"
print (aWord!)

var car = ("Toyota", "4-Runner", 2015)
print(type(of: car))

var classes: [String] = ["mobile Computing", "Compiler", "Compiler"]

print(classes)
classes += ["Database"]
print(classes)
let first = classes.first
print(first)

var dict: [Int:String] = [1:"one", 2:"two"]
dict[3] = "three"
print(dict)

var numbers = [2,4,6]
for var i in numbers {
    i *= 2
    print(i)
}
print(numbers)


func say(_ word: String) -> Int {
    print(word)
    return 555
}

var number = say("hihi")
print(number, ter)

