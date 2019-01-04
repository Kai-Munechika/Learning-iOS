import UIKit


//// String intrepolation

let street = "Ward Avenue"
let streetNum = 1520

// error: cannot concatenate int to string 
// let address = streetNum + " " + street

let address = "\(streetNum) \(street)"

//// end




//// explicit typing
var bestPlayer: String = "Michael Jordan"
let year: Int = 2018

//// end




//// arrays

// same syntax as python
// note: using var keyword makes the arrays mutable

var arr1: [Int] = [1,2,3]
var arr2: [String] = ["woop", "dee"]
var arr3: [Any] = [1, 2, "yee"]

arr1.append(4)
arr2.append("yoo")

arr1 + [7,8,9]

arr1

// likewise, using let makes the arrays immutable

let arr4 = [1,2,3]

// error
// arr4.append(0)

// inserting at index
arr1.insert(7, at: 1)
arr1

// removing; behaves same as pop
arr1.remove(at: 0)
arr1.count

//// end




//// dictionaries

var dict: [String: Int] = ["k1": 2, "k2": 10]

// inserting/updating

dict["k3"] = 7
dict

dict["k3"] = 99
dict

// removing key value pairs

dict["k2"] = nil
dict

dict.removeValue(forKey: "k3")
dict


dict["woah"]

let val = dict["k1"]
type(of: val)

//// end




//// for each loop

var stuff = [1, 2, 3, 4, 5, 6, 7, 8, 9]
for num in stuff {
    print(num)
}

//// for i in range loop

for num in 1...10 {
    print(num)
}

print("done")

// exclusive on the end
for num in 1..<10 {
    print(num)
}

var arrr = Array(1...10)
var arrr2 = Array(1..<10)

//// while

var x = 10

while x > 0 {
    print(x)
    x -= 1
}

var counter = 0
repeat {
    print(counter)
    counter += 1
} while counter < 10


//// if, else if, else

x = 0   // previously declared
if x == 0 {
    print("x is 0")
} else if x == 1 {
    print("x is 1")
} else {
    print("mehh")
}

//// logical ops: || && !

//// switch statement

x = 107
switch x {
case 0: print(0)    // if
case 1: print(1)    // else if
case 2: print(2)    // else if
case 3...100: print("woo")      // else if
case 101..<201: print("yay")    // else if
default: print("whaa")  // else
}

"".isEmpty









