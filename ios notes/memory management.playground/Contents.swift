//: ARC -- Automatic Reference Counting
// as long as there are objects holding onto a reference for some object X, X won't be freed up and deallocated in memory
// these are referred to strong references

class Woop {
    var name: String
    
    init(name: String) {
        self.name = name
        print("Initialized")
    }
    
    deinit {
        print("Deinitialized; object is removed from memory")
    }
}

var a: Woop? = Woop(name: "Kai")
a = nil

// We get memory leaks when we have a strong reference cycle between reference objects
// We can denote as variable as weak to denote a weak reference, and therefore ARC will ignore that var in calcaulting the reference count

// doing this ensures that only classes can conform to the protocol
protocol Loan: class {
    var payee: Customer { get set }
}

class Customer {
    weak var loan: Loan?
}
