//: Enums with raw values

// in situations where we want enum members to always have a default value, we can give them raw values
// these values must all have the same type, and we declare it in the enum signature
// also, raw values can only be primitives types: String, Int, Double, Float, Bool
enum Coin: Double {
    case penny = 0.01
    case nickel = 0.05
    case dime = 0.1
    case quarter = 0.25
}

let coins: [Coin] = [.penny, .nickel, .dime, .dime, .dime, .quarter, .quarter]

func sum(having coins: [Coin]) -> Double {
    var total: Double = 0
    
    for coin in coins {
        total += coin.rawValue
    }
    
    return total
}

sum(having: coins)


// using int or string for the raw value gets us special behavior

// when using Int, the raw values are self incrementing when not specified
// default is 1
enum Day: Int {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

Day.friday.rawValue

// when using String, the raw value is the name of the case itself
enum HTTP: String {
    case post
    case get
    case put
    case delete
}

HTTP.put.rawValue

enum HTTPStatusCode: Int {
    case success = 200
    case forbidden = 403
    case unauthorized = 401
    case notFound = 404
}

let statusCode = 200

// assigning enum given raw value
let httpStatusCode = HTTPStatusCode(rawValue: 200) // this is an optional
let httpStatusCode2 = HTTPStatusCode(rawValue: 2022) // this is an optional


