//
//  OffersView.swift
//  FlightOffers
//
//  Created by Mohammed Hassan on 27.11.2022.
//

import SwiftUI

struct OffersView: View {

    @StateObject var viewModel: OffersViewModel =  OffersViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State var isLoaderHidden: Bool = false

    var body: some View {
        VStack {
            if viewModel.offers.isEmpty {
                LoaderView(tintColor: .gray, scaleSize: 3.0).padding(.bottom,50).hidden(isLoaderHidden)
            } else {
                Text("Pick your offer today")
                    .font(.system(size: 20))
                    .padding()
                TabView {
                    ForEach(viewModel.offers, id: \.id) { offer in
                        let model : OfferModel = OfferModel(
                            cityTo: offer.cityTo,
                            countryTo: offer.countryTo.name,
                            countryToCode: offer.countryTo.code,
                            destination: offer.cityTo,
                            price: offer.price,
                            currency: viewModel.currency,
                            date: offer.dTime,
                            route: offer.route,
                            flyFrom: offer.cityFrom,
                            flightDuration: offer.fly_duration,
                            seats: offer.availability.seats ?? 0)
                        OfferView(model: model)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(alignment: .center)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [.white, .blue, .orange, .gray]),
                        startPoint: .top,
                        endPoint: .bottom))
                .onAppear {
                    setupAppearance()
                }
            }
        }.task {
            try? await viewModel.getOffersList()
        }
    }
    
    func setupAppearance() {
        isLoaderHidden.toggle()
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView()
    }
}

struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
