enum Coin: Double {
    case penny = 0.01
    case nickel = 0.05
    case dime = 0.1
    case quarter = 0.25
}

let wallet: [Coin] = [.penny, .nickel, .quarter, .penny, .quarter, .penny, .dime]

// we want to count the number of quarters in wallet
// approach 1

var count = 0

for coin in wallet {
    switch coin {
    case .quarter: count += 1
    default: continue
    }
}
print(count)


// approach 2

count = 0
for case .quarter in wallet {
    count += 1
}
print(count)


//: using case in if/else
for coin in wallet {
    if case .quarter = coin {
        print("u rich")
    } else if case .dime = coin {
        print("u still rich")
    }
}
