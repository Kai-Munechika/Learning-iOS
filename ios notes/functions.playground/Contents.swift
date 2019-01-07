//: Functions
let length = 2
let width = 10


// 3 ways of returning "no value"
func area1() {
    print(20)
}

func area0() -> Void {
    print(20)
}

func area00() -> () {
    print(20)
}
//end

func area3(length: Int, width: Int) -> Int {
    return length * width
}

area1()
area3(length: length, width: width)

type(of: 2.2)



// havingValue is both external and local name
func remove1(havingValue: String) {
    print(havingValue)
}

// havingValue is external name, and value is local name
func remove2(havingValue value : String) {
    print(value)
}


// usage
func getRemainder(value a: Int, divisor b:Int) -> Int {
    return a % b
}

let result = getRemainder(value: 10, divisor: 3)

// default parameters

func area4(length l: Int = 10, width w: Int = 20) -> Int {
    return l * w
}

area4(length: 2)


// tuples
func foo() -> (name1: Int, name2: Bool, name3: String) {
    return (2, false, "a")
}

let res = foo()
res.0
res.1
res.2

res.name1
res.name2
res.name3

// function without external name
func bar(_ x: Int) {
    print(x)
}

bar(10)



