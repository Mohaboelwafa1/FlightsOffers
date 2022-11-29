
import Foundation

enum OffersError: Error {
    case invalidData, noData
}

class DataService {
    static let shared = DataService()

    func fetchOffersWithAsyncURLSession() async throws -> Offers {
        guard let url = URL(string: prepareRequestURL()) else {fatalError("Missing URL")}
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(Offers.self, from: data)
        return result
    }
    
    private func prepareRequestURL() -> String {
        let todayDate = getOffersDateRange().current
        let futureDate = getOffersDateRange().future
        let offersLimit = 5
        let stringURL = "https://api.skypicker.com/flights?v=3&sort=popularity&asc=0&locale=en&daysInDestinationFrom=&daysInDestinationTo=&affilid=&children=0&infants=0&flyFrom=49.2-16.61-250km&to=anywhere&featureName=aggregateResults&dateFrom=\(todayDate)&dateTo=\(futureDate)&typeFlight=oneway&returnFrom=&returnTo=&one_per_date=0&oneforcity=1&wait_for_refresh=0&adults=1&limit=\(offersLimit)&partner=skypicker"
        return stringURL
    }

    private func getOffersDateRange() -> (current: String, future: String){
        let currentDate = Date()
        var monthComponent = DateComponents()
        monthComponent.month = 1
        let futureDate = Calendar.current.date(byAdding: monthComponent, to: currentDate)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.string(from: currentDate) // currentDate
        formatter.string(from: futureDate!) // futureDate
        return (formatter.string(from: currentDate), formatter.string(from: futureDate!))
    }

}
