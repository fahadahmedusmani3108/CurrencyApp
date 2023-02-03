//
//  APIClient.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 1/2/2023.
//

import Foundation
import Combine

class APIClient{
    
    @discardableResult
    static func performRequest<T>(route: APIConfiguration) async throws -> T where T: Decodable {
        do{
            let (data, _) = try await URLSession.shared.data(for: route.asURLRequest())
            print(try JSONDecoder().decode(T.self, from: data))
            return try JSONDecoder().decode(T.self, from: data)
        }
        catch{
            throw Errors.invalidJsonFromServer
        }
    }
}
