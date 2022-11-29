//
//  ContentView.swift
//  FlightOffers
//
//  Created by Mohammed Hassan on 24.11.2022.
//

import SwiftUI

struct ContentView: View {
        var body: some View {
            NavigationStack {
                OffersView()
            }
            .navigationTitle("Today Offers")
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
