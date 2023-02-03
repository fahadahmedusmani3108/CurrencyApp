
import Foundation

protocol CurrencyRepositoryProtocol{
    func getCurrencies(start: String, limit: String, convert: String) async throws -> [Currency]?
}

class CurrencyRepository : CurrencyRepositoryProtocol{
    
    var networkService : CurrencyNetworkServiceProtocol
    
    init(networkService: CurrencyNetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    //try fetching currencies from server
    func getCurrencies(start: String, limit: String, convert: String) async throws -> [Currency]? {
        return try await networkService.getCurrencies(start: start, limit: limit, convert: convert)
    }
}



