import Foundation

struct Weather {
    let temperature: Double
    let humidity: Double
    let chanceOfRain: Double
    let icon: String
    let highTemperature: Double
    let lowTemperature: Double
    let sunrise: Date
    let sunset: Date
    
}

let current = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04, icon: "Cloudy", highTemperature: 67, lowTemperature: 50, sunrise: Date(), sunset: Date())


protocol PrettyPrintable {
    var prettyDescription: String { get }
}

extension Weather: PrettyPrintable {
    var prettyDescription: String {
        return "Temperature: \(temperature)\nHumidity: \(humidity)\nChance of Rain: \(chanceOfRain)\nIcon: \(icon)\nHigh Temperature: \(highTemperature)\nLow Temperature: \(lowTemperature)\nSunrise time: \(sunrise)\nSunset time: \(sunset)"
    }
}

print(current.prettyDescription)

let tuesday = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04, icon: "Cloudy", highTemperature: 67, lowTemperature: 50, sunrise: Date(), sunset: Date())

let wednesday = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04, icon: "Cloudy", highTemperature: 67, lowTemperature: 50, sunrise: Date(), sunset: Date())

let thursday = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04, icon: "Cloudy", highTemperature: 67, lowTemperature: 50, sunrise: Date(), sunset: Date())

let week = [current, tuesday, wednesday, thursday]


//extension Array where Element: PrettyPrintable {
//    var prettyDescription: String {
//        var output = ""
//        
//        for (index, element) in self.enumerated() {
//            output += "\n\n*******\n\nIndex: \(index)\n\n\(element.prettyDescription)"
//        }
//        
//        return output
//    }
//}

// print(week.prettyDescription)

extension Sequence where Iterator.Element == Weather {
    var prettyDescription: String {
        var output = ""
        
        for (index, element) in self.enumerated() {
            output += "\n\n*******\n\nIndex: \(index)\n\n\(element.prettyDescription)"
        }
        
        return output
    }
}

print(week.prettyDescription)

dump(current)


//: Exercise
protocol PrefixContaining {
    func hasPrefix(_ prefix: String) -> Bool
}

extension String: PrefixContaining {}

extension Array where Element: PrefixContaining {
    func filter(byPrefix prefix: String) -> [Element] {
        var output = [Element]()
        for elem in self {
            if elem.hasPrefix(prefix) {
                output.append(elem)
            }
        }
        return output
    }
}

