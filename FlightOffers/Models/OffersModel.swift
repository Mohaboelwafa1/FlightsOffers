import Foundation

struct Offers: Codable {
    let currency: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id, flyFrom, flyTo, cityFrom: String
    let cityCodeFrom, cityTo, cityCodeTo: String
    let countryFrom, countryTo: Country
    let dTime, dTimeUTC, aTime, aTimeUTC: Int
    let distance: Double
    let duration: Duration
    let flyDuration: String
    let price: Int
    let availability: Availability
    let route: [Route]

    
    enum CodingKeys: String, CodingKey {
        case id, flyFrom, flyTo, cityFrom, cityCodeFrom, cityTo, cityCodeTo, countryFrom, countryTo, dTime, dTimeUTC, aTime, aTimeUTC, distance, duration
        case flyDuration = "fly_duration"
        case price, availability, route
    }
}

// MARK: - Availability
struct Availability: Codable {
    let seats: Int?
}

// MARK: - Country
struct Country: Codable {
    let code, name: String
}

// MARK: - Duration
struct Duration: Codable {
    let departure, durationReturn, total: Int
    
    enum CodingKeys: String, CodingKey {
        case departure
        case durationReturn = "return"
        case total
    }
}

// MARK: - Route
struct Route: Codable {
    let cityCodeFrom: String
}

// MARK: - Seats
struct Seats: Codable {
    let passengers, adults, children, infants: Int
}
