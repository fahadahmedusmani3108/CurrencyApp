//
//  Currency.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 28/12/2022.
//

import Foundation

class Currency : Codable, ObservableObject, Identifiable{
    
    var name: String?
    var quote : CurrencyQuote?
    
    init(name: String? = nil, quote: CurrencyQuote? = nil) {
        self.name = name
        self.quote = quote
        
    }
}
