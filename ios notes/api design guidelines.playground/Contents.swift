//: API Design Guidelines 
// https://swift.org/documentation/api-design-guidelines/

/*
 
 Point of Use -- write code that is easier to read/understand when it is called, preferred over its definition
 
 Clarity over Brevity -- Write code with clear intent over short/unreadable code
 
 */

//: Naming Types

// Name things according to their goal

// not this
// var someValue = 12

// this
var counter = 12

struct View {}

class ViewController {
    
    // not this
    // let view: View
    
    // this
    let contentView: View?
    
    init() { contentView = nil }
}

// Names of types properties, variables, and constants should read as nouns

// Exceptions:

/*
 
 Boolean properties should read as asserts about the receiver
 e.g.   .isEmpty
        .isGreaterThan
        .contains
 
 
 Protocols that Model Capabilities
    use the -able, -ible, or -int suffixes
    e.g.
        Equatable
        Comparable
        ExpressibleByStringLiteral
 */


//: Guidelines for Naming Methods

/*
 
 Rule #1 - Omit Needless Words
 
     definition:
        func insert(element: Element, position: Int)
     
     usage:
        insert(element: "a", position: 1)
     
     "element" is redundant 
      -->

         definition:
            func insert(_ element: Element, position: Int)
         
         usage:
            insert("a", position: 1)
     
 
 Rule #2 - Include all words needed to avoid ambiguity
        and compensate for weak type information
 
    e.g.
 
    func add(_ observer: AnyObject)
    add(self)
    
    -->
 
     func addObserver(_ observer: AnyObject)
     addObserver(self)
 
 */

//: Fluent Usage

/*
 
 Methods and functions should read as grammatical English phrases at the use site
 
 // not this
 insert("A", position: 1)
 
 // this
 insert("A", at: 2)
 
 */

//: Prepositional vs Grammatical Phrases

/*
 
 A preposition is a word that describes a relationship between 2 nouns
 
 e.g.
    The laptop ON* the desk
    Susan arrived AFTER* the movie
    Nick went TO* the library
 
 When writing out a method, when the first argument forms part of a prepositional phrase with a base name, then we give the argument a label.
 
 In contrast, if it's just a grammatical phrase, then we don't
 
 
 func move(toPosition position: Int)
 Because the type here is int and it doesn't provide sufficient context, we include the word position in the external argument name
 
 x.removeBoxes(havingLength: 12)
 
 
 // multiple arguments part of a single preposition' abstract idea
 func move(toX: Int, y: Int) 
 --> func moveTo(x: Int, y: Int)
 
 */

/*
 Grammatical phrases
 
 for grammatical phrases, add the external label to the function's base name
 
    view.addSubview(someOtherView)
 */

/* 
 Neither
 
 If the first argument forms neither a prepositional phrase nor a grammatical one, we should include the external argument label

 func dismiss(animated: Bool)
 
 */

//: Side-effects and mutation

/*
 
 Methods with side effects should be named using verb phrases
    e.g. func append(_ newElement: Element)
 
 Methods without should be named using noun phrases
    e.g. func distance(to point: Point)

 
 When we have both a mutating and non mutating counterpart:
    Mutating Version:
        array.sort()
 
    Non-mutating Version:
        let sortedArray = array.sorted()
 
 If -ed doesn't make grammatical sense, use -ing
    e.g. 
        mutating:       .stripWhiteSpace()
        non-mutating:   .strippingWhiteSpace()
 
 
 Naming Method Pairs - Noun
 
    Use the noun form for the non-mutating methods, then use the form prefix for the mutating counter part 
 
 Mutating Version:
    array.formUnion(with: anotherArray)
 
 Non-mutating Version:
    let union = array.union(with: anoterArray)
 
 */


//: Conventions

// Boolean methods; read as assertions

struct Point {}
func isInRange(of point: Point)

// Parameters
/* 
 
 - Choose parameter names to serve documentation
 - Use default values where possible to simplify function signatures
 
 */










