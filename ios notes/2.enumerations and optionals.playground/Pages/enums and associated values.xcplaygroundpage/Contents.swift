import UIKit

//: Enums :: are value types

// capitalized enum name, lowercased enum vals is the convention
enum Day {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

enum DayType {
    case weekday
    case weekend
}

func dayType(for day: Day) -> DayType {
    switch day {
    // we can remove all the "Day" and "DayType" prefixes since the compiler can infer them
    case Day.saturday, Day.sunday: return DayType.weekend
    case .monday, .tuesday, .wednesday, .thursday, .friday: return .weekday
    }
}

dayType(for: Day.friday)

// note: enums go well with switch statements
func isNotificationMuted(on type: DayType) -> Bool {
    switch type {
    case DayType.weekday: return false
    case DayType.weekend: return true
    }
}

//: associated enums; we can store custom values with enums
// we can also add methods to enums, but we can't add stored properties
// enums cannot have default associated values

enum ColorComponent {
    case rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    case hsb(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)
    
    func color() -> UIColor {
        switch self {
        case .rgb(let red, let green, let blue, let alpha):
            return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
        case .hsb(let hue, let saturation, let brightness, let alpha):
            return UIColor(hue: hue/100.0, saturation: saturation/100.0, brightness: brightness/100.0, alpha: alpha)
        }
    }
}

let t = ColorComponent.rgb(red: 2.3, green: 203.1, blue: 40.2, alpha: 1.0)
t.color()

// accessing associated values; bind them in a switch case
switch (t) {
case .rgb(let red, let green, let blue, let alpha):
    print(red)
default:
    print("wop")
}




