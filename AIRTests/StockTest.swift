//
//  StockTest.swift
//  AIRTests
//
//  Created by Daniela Bulgaru on 12/07/2018.
//  Copyright © 2018 Daniela Bulgaru. All rights reserved.
//

import XCTest

// imports framework so that internal properties and
// implementation cand be used/tested
@testable import AIR

class StockTest: XCTestCase {
    
    func test_parseStock() {
        // get the path of the file
        let path = Bundle(for: type(of: self)).path(forResource: "stock", ofType: "json")!
        
        // transform it in raw data
        let stockData = NSData(contentsOfFile: path)!
        
        // decode the raw data
        let pvtlStock = try? JSONDecoder().decode(Stock.self, from: stockData as Data)
        
        guard let stock = pvtlStock else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(stock.currentPrice, 25.1)
        XCTAssertEqual(stock.name, "PVTL")
        XCTAssertEqual(stock.market, "New York Stock Exchange")
    }
}

