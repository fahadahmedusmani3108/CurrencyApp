//
//  Errors.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 01/02/2023.
//

import Foundation

enum Errors: LocalizedError {
    
    case invalidResponseFromServer
    case invalidCurrencyList
    case invalidHost
    case invalidRequestParameters
    case invalidJsonFromServer
    
    var errorDescription: String? {
        switch self {
        case .invalidResponseFromServer:
            return "Unable to process your request at the moment."
        case .invalidJsonFromServer:
            return "Unable to parse json data."
        case .invalidHost:
            return "Invalid URL exception"
        case .invalidRequestParameters:
            return "Invalid Request Parameters exception"
        case .invalidCurrencyList:
            return "Currency List not found"
        }
    }
}

struct LocalizedAlertError: LocalizedError {
    
    let underlyingError: LocalizedError
    var errorDescription: String? {
        underlyingError.errorDescription
    }
    var recoverySuggestion: String? {
        underlyingError.recoverySuggestion
    }
    
    init?(error: Errors?) {
        guard let localizedError = error else { return nil }
        underlyingError = localizedError
    }
}
