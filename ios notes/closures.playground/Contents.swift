import PlaygroundSupport
import UIKit

//: Functions as data

func printString(_ string: String) {
    print(string)
}

printString("Hi, my name is Kai")

let stringPrinterFunction = printString
stringPrinterFunction("test")

//: Functions as parameters
func displayString(usingFunction function: (String) -> Void) {
    function("I'm a function inside a function")
}

displayString(usingFunction: printString)

//: Closure -- the combination of a function and an environment of captured variables
// it maintains the state of variables outside of the function's scope

// closures are reference types

func gameCounter() -> (Int) -> Void {
    var localCounter = 0
    
    func increment(_ i: Int) {
        localCounter += i
        print("Local counter value: \(localCounter)")
    }
    
    return increment
}

let counter = gameCounter()
counter(1)
counter(1)
counter(1)

let counter2 = gameCounter()
counter2(7)

//: Closure Expressions

// Rule #1: Define the closure inline

let numbers = [1,2,3,4]
let tripledNumbers = numbers.map({(value: Int) -> Int in 
    return value * 3
})

// Rule #2: Inferring Type From Context
numbers.map({ value in return value * 3 })

// Rule #3: Implicit Returns from Single-Expression Closures
numbers.map({ value in value * 3 })

// Rule #4: Shorthand Argument Names
numbers.map({ $0 * 3 })

// Rule #5: Trailing Closures
// when the function is the last function parameter
numbers.map() { $0 * 3 }

// lets us use multiline closure more cleanly
numbers.map() { number -> Int in
    if number % 2 == 0 {
        return number/2
    }
    
    return number/3
}

// Rule #6: Ignorning Parentheses
// if the closure is the only argument, we can get rid of the parenthesis
numbers.map { $0 * 3 }


//: Filter
let evenNumbers = (0...100).filter { $0 % 2 == 0 }

extension Array {
    func customFilter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var result = [Element]()
        
        for x in self where isIncluded(x) {
            result.append(x)
        }
        
        return result
    }
}

//: Reduce
let ages = [12,10,11,42,35,27,91,82,26,33,37,15]
let total = ages.reduce(0) { sum, num in sum + num }

//: todo: go over memory management https://www.appcoda.com/memory-management-swift/

