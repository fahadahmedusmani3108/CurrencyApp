//
//  GetCurrencyListRequest.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 01/02/2023.
//

import Foundation

struct GetCurrencyListRequest: Codable{
    var start : String
    var limit : String
    var convert : String
}
