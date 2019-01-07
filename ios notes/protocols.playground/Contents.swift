//: Protocols are the same as interface for other languages
// having subclasses conform to protocols to implement common methods rather than using inheritance is a form of composition

// note: protocols can inherit from multiple protocols (classes only have single inheritance)
// protocols can require init signatures, when implementing in a class, use required keyword
//  e.g. required init(...) {}


protocol FullNameable {
    var fullName: String { get }    
} 

struct User: FullNameable {
    var fullName: String
}

var user = User(fullName: "John Smith")
user.fullName = "hmmm"
user.fullName

struct Friend: FullNameable {
    let firstName: String
    let middleName: String
    let lastName: String
    
    // computed property; creates a property through a computation
    var fullName: String {
        return "\(firstName) \(middleName) \(lastName)"
    }
}

let friend = Friend(firstName: "Taylor", middleName: "Alison", lastName: "Swift")
friend.fullName



protocol Payable {
    func pay() -> Bool
}





