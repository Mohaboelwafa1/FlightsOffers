//
//  OfferView.swift
//  FlightOffers
//
//  Created by Mohammed Hassan on 27.11.2022.
//

import SwiftUI

struct OfferView: View {
    let model: OfferModel
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: model.getImageURL()))
                .aspectRatio(contentMode: .fit )
                .padding()
            
            VStack {
                HStack {
                    Text(model.destination)
                        .font(.system(size: 30))
                        .padding()
                    Text(model.getPrice())
                        .font(.system(size: 30))
                        .foregroundColor(Color(.secondaryLabel))
                        .padding()
                }
            }

            VStack {
                HStack {
                    Text(model.getDepartureDate())
                        .font(.system(size: 30))
                        .padding()
                    Text(model.getStops())
                        .font(.system(size: 30))
                        .foregroundColor(Color(.secondaryLabel))
                        .padding()
                }
            }
            
        }
    }
}
