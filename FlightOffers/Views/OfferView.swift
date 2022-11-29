//
//  OfferView.swift
//  FlightOffers
//
//  Created by Mohammed Hassan on 27.11.2022.
//

import SwiftUI

struct OfferView: View {

    var model: OfferModel
    @State var isFavourite: Bool = false

    var body: some View {
        VStack (alignment: .center, spacing: 5) {
            
            Text(model.countryTo)
                .font(.system(size: 30))
                .padding()
        
            AsyncImage(url: URL(string: model.imageURL))
                .aspectRatio(contentMode: .fit )
                .frame(width: 300, height: 300, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding()

            HStack {
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "airplane.departure")
                            .resizable()
                            .padding()
                            .frame(width: 50, height: 50, alignment: .leading)
                        Text(model.flyFrom)
                            .font(.system(size: 16))
                            .padding()
                            .multilineTextAlignment(.center)
                    }

                    HStack {
                        Image(systemName: "airplane.arrival")
                            .resizable()
                            .padding()
                            .frame(width: 50, height: 50, alignment: .leading)
                        Text(model.destination)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.center)
                            .padding()
                    }

                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .padding()
                            .frame(width: 50, height: 50, alignment: .leading)
                        Text(model.flightDuration)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.trailing)
                            .padding()
                    }

                    HStack {
                        Image("seat")
                            .resizable()
                            .padding()
                            .frame(width: 50, height: 50, alignment: .leading)
                        Text(model.numberOfSeats)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                }

                VStack (alignment: .trailing) {
                    
                    HStack {
                        Text(model.getPrice)
                            .font(.system(size: 16))
                            .padding()
                            .multilineTextAlignment(.trailing)
                        
                        Button {
                            print("Added to favourites")
                            isFavourite.toggle()
                        } label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .padding()
                                .foregroundColor( isFavourite ? Color.red : Color.gray)
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                    }

                    HStack {
                        Text(model.getStops.stops)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.trailing)
                            .padding()
                        Image(model.getStops.directFlight ? "directFlight" : "flightStop")
                            .resizable()
                            .padding()
                            .frame(width: 50, height: 50, alignment: .leading)
                    }

                    HStack {
                        Text(model.departureDate)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.center)
                            .padding()
                        Image("airport")
                            .resizable()
                            .padding()
                            .frame(width: 50, height: 50, alignment: .leading)
                    }

                    HStack {
                        Button(action: {}) {
                            Text("Interested?")
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 100, height: 30, alignment: .center)
                                .background(Color.green)
                                .font(.system(size: 16))
                                .cornerRadius(5)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        let route = Route(cityCodeFrom: "Amsterdam")
        let model = OfferModel(
            cityTo: "Paris",
            countryTo: "France",
            countryToCode: "fr",
            destination: "Paris",
            price: 150,
            currency: "Eur",
            date: 1669808700,
            route: [route],
            flyFrom: "Amsterdam",
            flightDuration: "2 h",
            seats: 5)
        OfferView(model: model)
    }
}
