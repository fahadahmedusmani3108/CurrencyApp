//
//  CurrencyListViewModel.swift
//  CurrencyListApp
//
//  Created by Fahad Ahmed Usmani on 02/02/2023.
//

import Combine
import SwiftUI

protocol CurrencyListViewModelProtocol : ObservableObject, Identifiable{
    var currencyList: [Currency] { get set }
    var isLoading: Bool { get set }
    var fetchNextPage: (any Identifiable)? { get set }
    var error: Errors? { get set }
    func loadCurrencies()
    func updateCurrencies()
}

class CurrencyListViewModel: CurrencyListViewModelProtocol{
    
    @Published var currencyList : [Currency]
    @Published var isLoading : Bool
    @Published var error: Errors?
    @Published var fetchNextPage: (any Identifiable)?
    private var cancellables = Set<AnyCancellable>()
    
    //Properties used for pagination
    private var currentPage: Int
    private var maxPages: Int
    private var numberOfRecords: Int
    
    var repository: CurrencyRepositoryProtocol
    
    init(repository: CurrencyRepositoryProtocol, currentPage: Int = 1, maxPages: Int = 10, numberOfRecords: Int = 30) {
        self.repository = repository
        self.isLoading = false
        self.currencyList = []
        self.currentPage = currentPage
        self.maxPages = maxPages
        self.numberOfRecords = numberOfRecords
        configurePublishers()
    }
    
    private func configurePublishers(){
        
        //Pusblisher used for pagination
        $fetchNextPage
            .receive(on: DispatchQueue.main)
            .subscribe(on: DispatchQueue.global())
            .sink(receiveValue: { [weak self] newVal in
                
                guard let self = self, let value = newVal else{
                    return
                }
                
                if self.currencyList.isLastItem(value){
                    DispatchQueue.main.async {
                        self.updateCurrencies()
                    }
                }
            })
            .store(in: &cancellables)
    }
    
    //Method for updating currencies list for pagination functionality
    @MainActor
    func updateCurrencies(){
        isLoading = true
        
        guard self.currentPage < self.maxPages else{
            return
        }
        Task(){
            do{
                currentPage += 1
                await self.currencyList.append(contentsOf: try fetchCurrencies(start: currentPage, limit: numberOfRecords))
            }
            catch(let exception){
                error = exception as? Errors
            }
        }
    }
    
    
    //Method for loading/refreshing all currencies list
    @MainActor
    func loadCurrencies(){
        isLoading = true
 
        Task(){
            do{
                currentPage = 1
                self.currencyList = try await fetchCurrencies(start: currentPage, limit: numberOfRecords)
            }
            catch(let exception){
                error = exception as? Errors
            }
        }
    }
    
    //fetching Currencies from repository
    @MainActor
    private func fetchCurrencies(start: Int, limit: Int) async throws -> [Currency]{
        do{
            let currencies = try await repository.getCurrencies(start: String(describing: start), limit:  String(describing: limit), convert: "USD") ?? []
            isLoading = false
            return currencies
        }
        catch(let exception){
            isLoading = false
            throw exception
        }
    }
    
}
