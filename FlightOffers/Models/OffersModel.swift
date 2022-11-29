import Foundation

struct Offers: Codable {
    let searchID, currency: String
    let fxRate: Int
    let data: [Datum]
    let results: Int
    let bestResults: [JSONAny]
    let searchParams: SearchParams
    let hashtags: [Hashtag]
    let locationHashtags: [String]
    let airlinesList: [AirlinesList]
    let airportsList: [AirportsList]
    let allAirlines, allStopoverAirports, allStopoverCountries: [String]
    let allPrices: [String: Int]
    let sortVersion: Int

    enum CodingKeys: String, CodingKey {
        case searchID = "search_id"
        case currency
        case fxRate = "fx_rate"
        case data
        case results = "_results"
        case bestResults = "best_results"
        case searchParams = "search_params"
        case hashtags
        case locationHashtags = "location_hashtags"
        case airlinesList, airportsList
        case allAirlines = "all_airlines"
        case allStopoverAirports = "all_stopover_airports"
        case allStopoverCountries = "all_stopover_countries"
        case allPrices = "all_prices"
        case sortVersion = "sort_version"
    }
}

// MARK: - AirlinesList
struct AirlinesList: Codable {
    let filterName: String
}

// MARK: - AirportsList
struct AirportsList: Codable {
    let filterName, name: String
}

// MARK: - Datum
struct Datum: Codable {
    let id, flyFrom, flyTo, cityFrom: String
    let cityCodeFrom, cityTo, cityCodeTo: String
    let countryFrom, countryTo: Country
    let dTime, dTimeUTC, aTime, aTimeUTC: Int
    let nightsInDest: JSONNull?
    let quality: Double
    let popularity: Int
    let distance: Double
    let duration: Duration
    let flyDuration: String
    let price: Int
    let conversion: Conversion
    let bagsPrice: BagsPrice
    let baglimit: [String: Int]
    let availability: Availability
    let airlines: [String]
    let route: [Route]
    let bookingToken: String
    let deepLink, trackingPixel: String
    let facilitatedBookingAvailable: Bool
    let pnrCount: Int
    let hasAirportChange: Bool
    let technicalStops: Int
    let throwAwayTicketing, hiddenCityTicketing, virtualInterlining: Bool
    let mapIdfrom, mapIdto: String
    let hashtags: [String]
    let mrpRefreshed: Bool

    enum CodingKeys: String, CodingKey {
        case id, flyFrom, flyTo, cityFrom, cityCodeFrom, cityTo, cityCodeTo, countryFrom, countryTo, dTime, dTimeUTC, aTime, aTimeUTC, nightsInDest, quality, popularity, distance, duration
        case flyDuration = "fly_duration"
        case price, conversion
        case bagsPrice = "bags_price"
        case baglimit, availability, airlines, route
        case bookingToken = "booking_token"
        case deepLink = "deep_link"
        case trackingPixel = "tracking_pixel"
        case facilitatedBookingAvailable = "facilitated_booking_available"
        case pnrCount = "pnr_count"
        case hasAirportChange = "has_airport_change"
        case technicalStops = "technical_stops"
        case throwAwayTicketing = "throw_away_ticketing"
        case hiddenCityTicketing = "hidden_city_ticketing"
        case virtualInterlining = "virtual_interlining"
        case mapIdfrom, mapIdto, hashtags
        case mrpRefreshed = "mrp_refreshed"
    }
}

// MARK: - Availability
struct Availability: Codable {
    let seats: Int?
}

// MARK: - BagsPrice
struct BagsPrice: Codable {
    let the1, hand: Double
    let the2: Double?
    let personalItem: Int?

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
        case hand
        case the2 = "2"
        case personalItem = "personal_item"
    }
}

// MARK: - Conversion
struct Conversion: Codable {
    let eur: Int

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
    }
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
    let id, combinationID, flyFrom, flyTo: String
    let cityFrom, cityCodeFrom, cityTo, cityCodeTo: String
    let dTime, dTimeUTC, aTime, aTimeUTC: Int
    let airline: String
    let flightNo: Int
    let operatingCarrier, operatingFlightNo, fareBasis, fareCategory: String
    let fareClasses, fareFamily: String
    let routeReturn: Int
    let latFrom, lngFrom, latTo, lngTo: Double
    let mapIdfrom, mapIdto: String
    let bagsRecheckRequired, viConnection, guarantee: Bool
    let equipment: JSONNull?
    let vehicleType: String
    let originalReturn: Int

    enum CodingKeys: String, CodingKey {
        case id
        case combinationID = "combination_id"
        case flyFrom, flyTo, cityFrom, cityCodeFrom, cityTo, cityCodeTo, dTime, dTimeUTC, aTime, aTimeUTC, airline
        case flightNo = "flight_no"
        case operatingCarrier = "operating_carrier"
        case operatingFlightNo = "operating_flight_no"
        case fareBasis = "fare_basis"
        case fareCategory = "fare_category"
        case fareClasses = "fare_classes"
        case fareFamily = "fare_family"
        case routeReturn = "return"
        case latFrom, lngFrom, latTo, lngTo, mapIdfrom, mapIdto
        case bagsRecheckRequired = "bags_recheck_required"
        case viConnection = "vi_connection"
        case guarantee, equipment
        case vehicleType = "vehicle_type"
        case originalReturn = "original_return"
    }
}

// MARK: - Hashtag
struct Hashtag: Codable {
    let count: Int
    let name: String
}

// MARK: - SearchParams
struct SearchParams: Codable {
    let flyFromType, toType: String
    let seats: Seats

    enum CodingKeys: String, CodingKey {
        case flyFromType = "flyFrom_type"
        case toType = "to_type"
        case seats
    }
}

// MARK: - Seats
struct Seats: Codable {
    let passengers, adults, children, infants: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
