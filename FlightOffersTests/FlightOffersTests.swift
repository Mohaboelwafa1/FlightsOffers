//
//  FlightOffersTests.swift
//  FlightOffersTests
//
//  Created by Mohammed Hassan on 24.11.2022.
//

import XCTest
@testable import FlightOffers

final class FlightOffersTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOfferModel() throws {
        // Direct Flight
        var model = getDirectFlightModel()
        XCTAssertEqual((model.imageURL), "https://images.kiwi.com/photos/600x330/paris_fr.jpg")
        XCTAssertEqual((model.departureDate), "12:45, 30 Nov")
        XCTAssertEqual((model.getPrice), "150 Eur")
        XCTAssertEqual((model.getStops.stops), "Direct Flight")
        XCTAssertEqual((model.getStops.directFlight), true)
        XCTAssertEqual((model.numberOfSeats), "5 seats")
        XCTAssertFalse(model.numberOfSeats == "5 seat")

        // Indirect Flight
        model = getInDirectFlightModel()
        XCTAssertEqual((model.imageURL), "https://images.kiwi.com/photos/600x330/cairo_eg.jpg")
        XCTAssertEqual((model.departureDate), "12:45, 30 Nov")
        XCTAssertFalse(model.getPrice == "150 Eur")
        XCTAssertFalse(model.getStops.stops == "Direct Flight")
        XCTAssertEqual((model.getStops.directFlight), false)
        XCTAssertFalse(model.numberOfSeats == "1 seats")
        XCTAssertTrue(model.numberOfSeats == "1 seat")
    }
    
    func getDirectFlightModel() -> OfferModel {
        OfferModel(
            cityTo: "Paris",
            countryTo: "France",
            countryToCode: "FR",
            destination: "Paris",
            price: 150,
            currency: "Eur",
            date: 1669808700,
            route: [Route(cityCodeFrom: "Amsterdam")],
            flyFrom: "Amsterdam",
            flightDuration: "2 h",
            seats: 5)
    }

    func getInDirectFlightModel() -> OfferModel {
        OfferModel(
            cityTo: "Cairo",
            countryTo: "Egypt",
            countryToCode: "EG",
            destination: "Egypt",
            price: 170,
            currency: "USD",
            date: 1669808700,
            route: [Route(cityCodeFrom: "Praha"), Route(cityCodeFrom: "Athens"),],
            flyFrom: "Praha",
            flightDuration: "7 h",
            seats: 1)
    }

}
