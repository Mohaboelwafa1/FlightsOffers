//
//  OffersView.swift
//  FlightOffers
//
//  Created by Mohammed Hassan on 27.11.2022.
//

import SwiftUI
struct OffersView: View {
    @StateObject var viewModel: OffersViewModel =  OffersViewModel()
    var body: some View {
        VStack {
            if viewModel.offers.isEmpty {
                Text("Loading ...")
            }else{
                TabView {
                    ForEach(viewModel.offers, id: \.id) { offer in
                        let model : OfferModel = OfferModel(
                            cityTo: offer.cityTo.lowercased(),
                            countryTo: offer.countryTo.code.lowercased(),
                            destination: offer.cityTo,
                            price: offer.price,
                            currency: viewModel.currency,
                            date: offer.dTime,
                            stops: offer.route.count - 1)
                        OfferView(model: model)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
            }
        }.task {
            try? await viewModel.getOffersList()
        }
    }
}
