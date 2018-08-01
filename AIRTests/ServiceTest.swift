//
//  ServiceTest.swift
//  AIRTests
//
//  Created by Denisse Zavala on 25/07/2018.
//  Copyright © 2018 Daniela Bulgaru. All rights reserved.
//

import XCTest

@testable import AIR

class ServiceTest: XCTestCase {
    var data: Data?
    var httpClient: HTTPClient!
    var mockURLSession = MockURLSession()
    var service: Service!
    
    override func setUp() {
        httpClient = HTTPClient(session: mockURLSession)
        service = Service(httpClient: httpClient)
    }
    
    func test_getStock() {
        let expectedURL = URL(string: "https://api.iextrading.com/1.0/stock/pvtl/batch?types=quote")
        let expectedStock = Stock(name: "PVTL", market: "New York Stock Exchange", currentPrice: 25.1)
        
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Download stock data")
        
        service.getStockData() { stock in
            XCTAssertEqual(stock!, expectedStock)
            expectation.fulfill()
        }
        
        XCTAssertEqual(mockURLSession.lastURL!, expectedURL)
        
        // Wait until the expectation is fulfilled, with a timeout of 5 seconds.
        wait(for: [expectation], timeout: 5.0)
    }
}
