//
//  CurrencyListView.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 28/12/2022.
//

import SwiftUI

struct CurrencyListView<vm: CurrencyListViewModelProtocol> : View {
    
    @StateObject private var viewModel : vm
    @State var refresh : Bool = false
    
    init(viewModel: vm) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            
            ZStack{
                VStack(alignment: .trailing, spacing: 0){
                    
                    ListView(currencyList: viewModel.currencyList, refresh: $refresh, fetchNextPage: $viewModel.fetchNextPage)
                    Spacer()
                }
                
                LoaderView()
                    .hidden($viewModel.isLoading.wrappedValue ? false : true)
            }
            .navigationTitle(AppStrings.currencies)
            .toolbar {
            }
        }
        .errorAlert(error: $viewModel.error)
        .onChange(of: refresh) { newValue in
            viewModel.loadCurrencies()
                    }
    }
}

struct CurrencyListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListView(viewModel: CurrencyListViewModel(repository: CurrencyRepository.init(networkService: CurrencyNetworkService.init())))
    }
}
