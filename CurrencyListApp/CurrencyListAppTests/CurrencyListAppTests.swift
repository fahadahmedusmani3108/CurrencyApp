//
//  CurrencyListAppTests.swift
//  CurrencyListAppTests
//
//  Created by Fahad Ahmed Usmani on 28/12/2022.
//

import XCTest
@testable import CurrencyListApp

final class CurrencyListAppTests: XCTestCase {
    
    var sut : CurrencyListViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CurrencyListViewModel.init(repository: CurrencyRepository(networkService: CurrencyNetworkService.init()))
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    @MainActor
    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    
     
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
