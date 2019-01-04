//: Extensions
/*
 With extensions, we:
    can add computed properties
    can add new type and instance methods
    can define nested types
    can add convenience initializers
    cannot add stored properties or property observers
*/

extension Int {
    var isOdd: Bool {
        return self % 2 == 1
    }
}

var a = 3
3.isOdd
2.isOdd

//: Protocol Conformance using extensions

protocol UniquelyIdentifiable {
    var uuid: Int { get }
}

import UIKit

extension UIView: UniquelyIdentifiable {
    var uuid: Int {
        return hash
    }
}

let view = UIView()
view.uuid
view.hash

view is UniquelyIdentifiable

//: Protocol Extensions
// allows us to provide default implementations to any property or methods for protocols
// we can also add new properties or methods

protocol RandomNumberGenerator {
    func random() -> Int
}

extension RandomNumberGenerator {
    func random() -> Int {
        return Int(arc4random())
    }
}

class Generator: RandomNumberGenerator {}

let generator = Generator()
generator.random()


//: Method Dispatch in a Protocol Extension
/*
 If we extend a protocol to implement a new method, all variables of the same protol type holding references to subclasses who override/implement that new method will call the default implementation specified in the protocol. To have the subclass's implementation run in this case, we can simply make the new method signature requred in the protocol's original specification 
 
 */








































