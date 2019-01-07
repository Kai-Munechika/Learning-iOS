//: Optionals

// declaring an optional:
var someValue: Int? = nil
var someValue2: Optional<Int> = nil

// example
struct Person {
    let firstName: String
    let middleName: String? // optionals allow values to be nil
    let lastName: String
    
    func fullName() -> String {
        // bang == force unwrapping; avoid this!!!
        // return firstName + " " + middleName! + " " + lastName  
        
        // use optional binding instead
        // if self.middleName is not nil, and we assign it to a local const named middleName
        if let middleName = self.middleName {
            return firstName + " " + middleName + " " + lastName 
        } else {
            return firstName + " " + lastName
        }
    }
}

let me = Person(firstName: "Kai", middleName: "Alexander", lastName: "Munechika")
let me2 = Person(firstName: "Kai", middleName: nil, lastName: "Munechika")
me.fullName()
me2.fullName()

// the optional enum is modeled as:
//  enum Optional<T> {
//      case some(T)
//      case none
//  }

// note: all types can be made into optionals, just by adding a question mark
type(of: me.middleName)

// when getting a value from a dictionary, we receive an optional
let weatherDict: [String : [String : String]] = [
    "currently" : ["temperature": "22.3"],
    "daily" : ["temperature": "22.3"],
    "weekly": ["temperature": "22.3"]
]

print(type(of: weatherDict["daily"]))

// nested optional bindings
if let dailyWeather = weatherDict["daily"] {
    if let highTemperature = dailyWeather["temperature"] {
        print(highTemperature)
    }
}

// do without nesting: will evaluate left to right and short circuit if we get a nil 
if let dailyWeather = weatherDict["daily"], let highTemperature = dailyWeather["temperature"] {
    print(highTemperature)
}

struct Friend {
    let name: String
    let age: String
    let address: String?
    
    init(name: String, age: String, address: String?) {
        self.name = name 
        self.age = age 
        self.address = address
    }
    
    // failable initializer
    init?(dict: [String : String]) {
        guard let name = dict["name"], let age = dict["age"] else { return nil }
        let address = dict["address"]
        
        self.name = name
        self.age = age
        self.address = address
    }
}

func newFriend(friendDictionary: [String : String]) -> Friend? {
    
    // guard allows for early exit and keeps the optional binding value in the current scope 
    guard let name = friendDictionary["name"], let age = friendDictionary["age"] else { return nil }
    let address = friendDictionary["address"]
    
    return Friend(name: name, age: age, address: address)    
}




