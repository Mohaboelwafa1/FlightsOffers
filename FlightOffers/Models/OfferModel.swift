//
//  OfferModel.swift
//  FlightOffers
//
//  Created by Mohammed Hassan on 27.11.2022.
//

import Foundation

struct OfferModel {
    let cityTo: String
    let countryTo: String
    let destination: String
    let price: Int
    let currency: String
    let date: Int
    let stops: Int

    func getImageURL() -> String {
        "https://images.kiwi.com/photos/600x330/\(cityTo)_\(countryTo).jpg"
    }
    
    func getDepartureDate() -> String {
        let timeInterval = TimeInterval(date)
        let departureDate = Date(timeIntervalSince1970: timeInterval)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: departureDate)
    }

    func getPrice() -> String {
        "\(price) \(currency)"
    }

    func getStops() -> String {
        guard stops > 0 else {
            return "Direct Flight"
        }
        return stops > 1 ? "\(stops) stops" : "\(stops) stop"
    }
}
