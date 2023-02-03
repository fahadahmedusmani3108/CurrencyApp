//
//  CurrencyNetworkService.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 03/02/2023.
//

import Foundation

protocol CurrencyNetworkServiceProtocol{
    func getCurrencies(start: String, limit: String, convert: String) async throws -> [Currency]?
}

class CurrencyNetworkService: CurrencyNetworkServiceProtocol{
    
    func getCurrencies(start: String, limit: String, convert: String) async throws -> [Currency]? {
        do{
            let response : GetCurrencyListResponse = try await APIClient.performRequest(route: CurrencyRouter.getCurrencyList(start: start, limit: limit, convert: convert))
            return response.data
        }
        catch(let exception){
            throw exception
        }
    }
    
}
