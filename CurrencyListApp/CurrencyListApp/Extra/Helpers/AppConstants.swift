//
//  AppConstants.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 02/02/2023.
//

import SwiftUI

struct Design {
    
    struct Colors{
        static let grayTextColor : Color = Color.init(red: 174/255, green: 174/255, blue: 174/255)
        static let blackTitleColor : Color = Color.init(red: 0, green: 0, blue: 0)
        static let lightGrayBackground : Color = Color(red: 0.875, green: 0.875, blue: 0.875)
    }
    
    struct Fonts {
        static let title : Font = Font.system(size: 18.0, weight: .bold)
        static let body : Font = Font.system(size: 14.0, weight: .regular)
        static let subtitle : Font = Font.system(size: 12.0, weight: .regular)
    }
}

struct API {
    static let baseUrl = "https://pro-api.coinmarketcap.com"
    static let getCurrencysList = "/v1/cryptocurrency/listings/latest"
}

struct AppStrings {
    static let change = "Change"
    static let price = "Price"
    static let title = "Title"
    static let cancel = "Cancel"
    static let currencies = "Currencies"
}
