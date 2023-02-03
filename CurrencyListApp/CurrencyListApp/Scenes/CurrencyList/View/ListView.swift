//
//  ListView.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 29/12/2022.
//

import SwiftUI

struct ListView: View {
    
    var currencyList : [Currency]
    @Binding var refresh : Bool
    @Binding var fetchNextPage : (any Identifiable)?
    
    var body: some View {
        
        List(currencyList, id: \.name) { currency in
            CurrencyListRow(currency: currency)
                .listRowSeparator(.hidden)
                .onAppear{
                    fetchNextPage = currency
                }
        }
        .onAppear{
            refresh.toggle()
        }
        .listStyle(.inset)
        .refreshable {
            refresh.toggle()
        }
    }
}

