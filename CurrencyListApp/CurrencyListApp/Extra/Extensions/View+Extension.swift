//
//  View+Extension.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 01/2/2023.
//

import SwiftUI

extension View{
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View{
        switch shouldHide{
        case true: self.hidden()
        case false: self
        }
    }
    
    func errorAlert(error: Binding<Errors?>, buttonTitle: String = "Ok") -> some View {
        let localizedAlertError = LocalizedAlertError(error: error.wrappedValue)
        
        if #available(iOS 15.0, *) {
            return alert(isPresented: .constant(localizedAlertError != nil), error: localizedAlertError) { _ in
                Button(buttonTitle) {
                    error.wrappedValue = nil
                }
            } message: { error in
                Text(error.errorDescription ?? "")
            }
        }
        else{
            return alert(isPresented: .constant(localizedAlertError != nil)) {
                Alert(
                    title: Text("Alert"),
                    message: Text(localizedAlertError?.errorDescription ?? ""),
                    dismissButton: .default(Text(buttonTitle))
                )
            }
        }
    }
}
