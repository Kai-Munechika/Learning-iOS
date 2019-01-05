//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func swapValues<T>(_ a: inout T, _ b:  inout T) {
    let tempA = a 
    a = b
    b = tempA
}

var d = 10
var e = 12

var g = "kai"
var h = "m"

swapValues(&d, &e)
swapValues(&g, &h)


func duplicate<T>(item: T, numberOfTimes: Int) -> [T] {
    var arr: [T] = []
    while arr.count < numberOfTimes {
        arr.append(item)
    }
    
    return arr
}

// multiple generic type params
// operation is a function that takes an arg of type T and returns one of type U

func transform<T, U>(arg: T, operation: (T) -> U) -> U {
    return operation(arg)
}

func stringToInt(_ a: String) -> Int {
    guard let value = Int(a) else { fatalError() }
    return value
}

transform(arg: "1", operation: stringToInt)


// Protocol Based Type Constraints
// we can use protocols to define constraints on generic types

func findKey<Key, Value: Equatable>(for value: Value, in dictionary: Dictionary<Key, Value>) -> Key? {
    for (iterKey, iterValue) in dictionary {
        if iterValue == value {
            return iterKey
        }
    }
    
    return nil
}


// Class Constraints

class Shape {}

// this is saying that the type T must of of type Shape or a subclass of Shape 
func center<T: Shape>(of Shape: T) {
    print("Called")
}


// Generic Types
struct Queue<Element> {
    var array: [Element] = []
    
    var isEmpty: Bool {
        return array.count == 0
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func enqueue(_ element: Element) {
        array.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if self.isEmpty {
            return nil
        }
        
        return array.removeFirst()
    }
}


//: Associated Types

protocol Stack {
    associatedtype Element
    
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
    
    var top: Element? { get }
}

struct IntStack: Stack {
    
    private var array: [Int] = []
    
    mutating func push(_ element: Int) {
        self.array.append(element)
    }
    
    mutating func pop() -> Int? {
        return self.array.popLast()
    }
    
    var top: Int? {
        return self.array.last
    }
}

protocol ShoppingItem {
    var price: Double { get }
}

// for conformance to multiple protocols
// we could also use:
// typealias HashableShoppingItem = Hashable & ShoppingItem
struct Checkout<Item: Hashable & ShoppingItem> {
    var cart = [Item: Int]()
}

// for subclasses and protocol conformance
struct Animator<T> where T: Hashable, T: Shape {
    
}














