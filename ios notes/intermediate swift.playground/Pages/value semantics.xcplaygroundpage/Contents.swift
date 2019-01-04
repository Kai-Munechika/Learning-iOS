//: Value Semantics

struct Point {
    var x: Double
    var y: Double
    
    // mutating creates a new instance with the different vals and returns it
    mutating func moveLeft(steps: Double) {
        x -= steps
    }
}

var p1 = Point(x: 1, y: 2)
var p2 = p1

p1.x = 4    // this creates a new instance and assigns the new struct to p1
p2.x

// because structs are value types, they're copied over when assigned; another instance is made

// because this is immutable, the object's vals cannot be changed
let p3 = Point(x: 2, y: 4)

// this will give us an error
// p3 = Point(x: 1, y: 2)



//: Reference Semantics

class Robot {
    var model: String
    
    init(model: String) {
        self.model = model
    }
}

var someRobot = Robot(model: "T1999")
var anotherRobot = someRobot

someRobot.model = "T2000"
anotherRobot.model

// the let here refers to the reference, not the actual values
let thirdRobot = Robot(model: "T3000")
thirdRobot.model = "T4000"  



