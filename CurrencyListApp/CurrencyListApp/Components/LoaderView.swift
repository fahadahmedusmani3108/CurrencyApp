//
//  LoaderView.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 1/2/2023.
//

import SwiftUI

struct LoaderView: View {
 
    var scaleSize : CGFloat = 2.0
    var tintColor : Color = .blue
   
    var body: some View {
        VStack{
            ProgressView()
                .scaleEffect(scaleSize, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
            Text("Loading...")
                .font(.subheadline)
                .padding(.top, 20)
        }
    }
}

