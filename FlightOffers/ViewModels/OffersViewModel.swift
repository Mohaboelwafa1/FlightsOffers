import Foundation
import Combine

final class OffersViewModel: ObservableObject {

    @Published var offers: [Datum] = [Datum]()
    @Published var currency: String = String()

    var cancellables: Set<AnyCancellable> = []
    let serviceProvider = DataService.shared
   
    func getOffersList() async throws {
        let result = try await serviceProvider.fetchOffersWithAsyncURLSession()
        offers = result.data
        currency = result.currency
        if offers.isEmpty {
            throw OffersError.noData
        }
    }
}
