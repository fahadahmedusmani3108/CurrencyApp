//
//  CurrencyListAppApp.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 28/12/2022.
//

import SwiftUI

@main
struct CurrencyListAppApp: App {
    var body: some Scene {
        WindowGroup {
            CurrencyListView(viewModel: CurrencyListViewModel(repository: CurrencyRepository.init(networkService: CurrencyNetworkService.init()), currentPage: 0, maxPages: 5, numberOfRecords: 30))
        }
    }
}
