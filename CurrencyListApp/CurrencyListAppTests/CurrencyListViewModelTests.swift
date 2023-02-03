//
//  CurrencyListViewModelTests.swift
//  CurrencyListAppTests
//
//  Created by Fahad Ahmed Usmani on 03/01/2023.
//

import XCTest
@testable import CurrencyListApp
import Combine

final class CurrencyListViewModelTests: XCTestCase {
    
    var currencyListViewModel : CurrencyListViewModel!
    private var cancellables = Set<AnyCancellable>()

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        currencyListViewModel = CurrencyListViewModel.init(repository: CurrencyRepository(networkService: CurrencyNetworkService.init()), currentPage: 1, maxPages: 10, numberOfRecords: 30)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        currencyListViewModel = nil
        cancellables = []
    }
    
    //This will validate that Currencies are loaded or refreshed successfully from repository
    @MainActor
    func testLoadCurrencies(){
        
        //Given
        let expectation = XCTestExpectation(description: "Currencies loaded successfully")
        
        let _ = currencyListViewModel.$currencyList
            .dropFirst()
            .subscribe(on: DispatchQueue.global())
            .sink(receiveValue: { currencies in
                XCTAssertTrue(currencies.count > 0)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        //When
        currencyListViewModel.loadCurrencies()
        
        //Then
        wait(for: [expectation], timeout: 60)
        
    }
    
    
    //This will validate that Currencies are updated successfully during pagination functionality
    @MainActor
    func testUpdateCurrencies(){
        
        //Given
        let expectation = XCTestExpectation(description: "Currencies loaded successfully")
        
        let _ = currencyListViewModel.$currencyList
            .dropFirst()
            .subscribe(on: DispatchQueue.global())
            .sink(receiveValue: { currencies in
                XCTAssertTrue(currencies.count > 0)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        //When
        currencyListViewModel.updateCurrencies()
        
        //Then
        wait(for: [expectation], timeout: 60)
        
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
