import Foundation

struct Offers: Codable {
    let currency: String
    let offersList: [Offer]

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case offersList = "data"
    }
}

// MARK: - Datum
struct Offer: Codable {
    let id, flyFrom, flyTo, cityFrom, cityCodeFrom, cityTo, cityCodeTo: String
    let countryFrom, countryTo: Country
    let dTime, dTimeUTC, aTime, aTimeUTC: Int
    let distance: Double
    let duration: Duration
    let fly_duration: String
    let price: Int
    let availability: Availability
    let route: [Route]
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
