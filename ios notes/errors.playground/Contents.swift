
//: Errors

struct Friend {
    let name: String
    let age: String
    let address: String?
}

enum FriendError: Error {
    case invalidData(description: String)
    case someError
}

func friend(from dict: [String : String]) throws -> Friend {
    guard let name = dict["name"] else {
        throw FriendError.invalidData(description: "invalid name")
    }

    guard let age = dict["age"] else {
        throw FriendError.invalidData(description: "invalid age")
    }
    
    let address = dict["address"]
    
    return Friend(name: name, age: age, address: address)
}

func send(message: String, to friend: Friend) {}

let response = ["name": "Pasan", "afdage": "28", "address": "someAddress"]

//: error handling approach 1
// let someFriend = try friend(from: response)  // code after this line will not be called if try is not successful
// print(someFriend)

// error handling approach 2
do {
    let myFriend = try friend(from: response)
    send(message: "Test", to: myFriend)
} catch FriendError.invalidData(let description) {      // pattern matching on the enum
    print(description)
} catch FriendError.someError {
    print("other error")
}

// defer statements: https://medium.com/@rwgrier/swift-defer-statement-e16526b34f93

