//
//  CurrencyQuote.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 02/02/2023.
//

import Foundation

class CurrencyQuote : Codable, ObservableObject{
    
    var usd : String?
    var price : Float?
    var change: Float?
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case price = "price"
        case change = "percent_change_1h"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let usd = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .usd)
        
        price = try usd.decode(Float.self, forKey: .price)
        change = try usd.decode(Float.self, forKey: .change)
    }
}
