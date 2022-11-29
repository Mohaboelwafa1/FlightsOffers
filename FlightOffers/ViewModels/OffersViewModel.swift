import Foundation
import Combine

@MainActor
final class OffersViewModel: ObservableObject {

    @Published var offers: [Datum] = [Datum]()
    @Published var currency: String = String()
    let serviceProvider = DataService.shared

    func getOffersList() async throws {
        let result = try await serviceProvider.fetchOffersWithAsyncURLSession()
        offers = result.data.filter {
            $0.availability.seats ?? 0 > 0
        }
        currency = result.currency
        if offers.isEmpty {
            throw OffersError.noData
        }
    }
}
