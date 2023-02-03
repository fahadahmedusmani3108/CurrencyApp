//
//  CurrencyListRow.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 28/12/2022.
//

import SwiftUI

struct CurrencyListRow: View {
    
    @ObservedObject var currency : Currency
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            Image("bitcoin")
                .resizable()
                .frame(width: 30, height: 30)
            
            VStack(alignment: .leading, spacing: 5, content: {
                
                Text(currency.name ?? "")
                    .foregroundColor(Design.Colors.blackTitleColor)
                    .font(Design.Fonts.title)
                
                HStack{
                    Text("\(AppStrings.price) \(currency.quote?.price ?? 0)")
                        .font(Design.Fonts.body)
                        .foregroundColor(Design.Colors.grayTextColor)
                    
                    Spacer()
                    
                    Text("\(AppStrings.change) \(currency.quote?.change ?? 0)")
                        .font(Design.Fonts.body)
                        .foregroundColor(Design.Colors.grayTextColor)
                }
            })
            
            Spacer()
        }
    }
}

struct CurrencyListRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListRow(currency: Currency.init(name: "Bitcoin"))
            .fixedSize()
    }
}
