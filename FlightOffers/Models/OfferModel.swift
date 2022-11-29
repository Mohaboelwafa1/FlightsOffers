//
//  OfferModel.swift
//  FlightOffers
//
//  Created by Mohammed Hassan on 27.11.2022.
//

import Foundation

struct OfferModel {
    
    init(cityTo: String,
        countryTo: String,
        countryToCode: String,
        destination: String,
        price: Int,
        currency: String,
        date: Int,
        route: [Route],
        flyFrom: String,
        flightDuration: String,
        seats: Int) {
        self.cityTo = cityTo
        self.countryTo = countryTo
        self.countryToCode = countryToCode
        self.destination = destination
        self.price = price
        self.currency = currency
        self.date = date
        self.route = route
        self.flyFrom = flyFrom
        self.flightDuration = flightDuration
        self.seats = seats
    }

    private let cityTo: String
    private let price: Int
    private let currency: String
    private let date: Int
    private let route: [Route]
    private let seats: Int
    
    let countryTo: String
    let countryToCode: String
    let destination: String
    let flyFrom: String
    let flightDuration: String

    var imageURL: String {
        "https://images.kiwi.com/photos/600x330/\(cityTo.lowercased())_\(countryToCode.lowercased()).jpg"
    }

    var departureDate: String {
        let timeInterval = TimeInterval(date)
        let departureDate = Date(timeIntervalSince1970: timeInterval)
        let formatter = DateFormatter()
        //formatter.dateFormat = "HH:mm E, d MMM y"
        formatter.dateFormat = "HH:mm, d MMM"
        return formatter.string(from: departureDate)
    }

    var getPrice: String {
        "\(price) \(currency)"
    }

    var getStops: (stops: String, directFlight: Bool) {
        guard route.count > 1 else {
            return ("Direct Flight", true)
        }

        var stops: [String] = [String]()
        for index in 1...route.count - 1 {
            stops.append(route[index].cityCodeFrom)
        }

        return (stops.joined(separator: ", "), false)
    }

    var numberOfSeats: String {
        guard seats > 1 else {
            if seats == 0 { return "No seats"}
            return "1 seat"
        }

        return "\(seats) seats"
    }
}
