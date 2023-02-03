//
//  CurrencyRepositoryTests.swift
//  CurrencyListAppTests
//
//  Created by Fahad Ahmed Usmani on 03/01/2023.
//

import XCTest
@testable import CurrencyListApp


final class CurrencyRepositoryTests: XCTestCase {
    
    var repository : CurrencyRepository!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        repository = CurrencyRepository.init(networkService: CurrencyNetworkService())
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        repository = nil
    }
    
    
    //This will test server api
    func testCheckIfCurrenciessAreFetchedFromServerAsync() async throws{
        let response = try await repository.getCurrencies(start: "1", limit: "50", convert: "USD")
        XCTAssertNoThrow(response, "successfull response from server")
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
