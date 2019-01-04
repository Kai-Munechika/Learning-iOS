let firstName: String? = "Pasan"
let username = "Pasanpr"

// approach 1 with ternary op
let displayName = firstName != nil ? firstName! : username

// using nil coalescing operator; this is equivalent
// if firstName is not nil, use the unwrapped val, otherwise use username
let displayName2 = firstName ?? username
