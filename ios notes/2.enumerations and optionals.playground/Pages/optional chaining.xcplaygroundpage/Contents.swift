
// as a note, these classes don't need initializers since they all have default values (nil for optionals)

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
}

class Residence {
    var numberOfRooms = 1
    var address: Address?
}

class Person {
    var residence: Residence?
}

let susan = Person()
let address = Address()
address.buildingName = "Building"
address.buildingNumber = "10"

let residence = Residence()
residence.address = address

susan.residence = residence

//: optional chaining; will return evaluate to nil if any of the chained vals are nil
if let buildingNumber = susan.residence?.address?.buildingNumber {
    print(buildingNumber)
}


