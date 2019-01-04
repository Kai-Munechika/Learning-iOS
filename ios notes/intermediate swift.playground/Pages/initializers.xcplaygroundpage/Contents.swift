//: Failable and throwing initializers
enum Day: Int {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

let day = Day(rawValue: 40)

// failable initializer: returns nil
class Person {
    let name: String
    let age: Int
    
    init?(dict: [String: AnyObject]) {
        guard let name = dict["name"] as? String, let age = dict["age"] as? Int else {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

// throwing initializer: throws error
enum PersonError: Error {
    case invalidData
}

class Person2 {
    let name: String
    let age: Int
    
    init(dict: [String: AnyObject])  throws {
        guard let name = dict["name"] as? String, let age = dict["age"] as? Int else {
            throw PersonError.invalidData
        }
        
        self.name = name
        self.age = age
    }
}


//: Initializer Delegation 
// Value Types

struct Point {
    var x: Int = 0
    var y: Int = 0
}

struct Size {
    var width: Int = 0
    var height: Int = 0
}

struct Rectangle {
    var origin = Point()
    var size = Size()
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(x: Int, y: Int, height: Int, width: Int) {
        let origin = Point(x: x, y: y)
        let size = Size(width: width, height: height)
        
        // rather than doing this:
        // self.origin = origin
        // self.size = size
        
        // delegate the initialization
        self.init(origin: origin, size: size)
    }
}

// Initializer Delegation -- Reference Types

class Vehicle {
    let name: String
    
    // designated initializer
    // A designated initializer is responsible for assigning values to stored properties and calling the superclass' initializer.
    

    init(name: String) {
        self.name = name
    }
    
    // convenience initializer
    convenience init() {
        self.init(name: "Unnamed")
    }
    
}

let aa = Vehicle().name

// Initializer Delegation -- Super classes

class Car: Vehicle {
    let numberOfDoors: Int
    
    init(name: String, numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        super.init(name: name)
    }
    
    // we need to use override here since this signature matches the superclass's designated init
    convenience override init(name: String) {
        self.init(name: name, numberOfDoors: 4)
    }
    
    // note: don't need to use override keyword since we're not conflicting/shadowing with a designated init
    convenience init() {
        self.init(name: "Unnamed")
    }
}


//: Required Initializers
// when we want all subclasses to provide an implementation for a specific init method/signature

class SomeClass {
    required init() {
        
    }
}

class AnotherClass: SomeClass {
    init(test: String) {}
    required init() {
    }
}


