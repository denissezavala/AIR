//
//  Service.swift
//  AIR
//
//  Created by Denisse Zavala on 25/07/2018.
//  Copyright © 2018 Daniela Bulgaru. All rights reserved.
//

import Foundation

class Service {
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func getStockData(completion: @escaping ((Stock?) -> ())) {
        let stockDataURL = URL(string: "https://api.iextrading.com/1.0/stock/pvtl/batch?types=quote")!
        
        httpClient.get(URL: stockDataURL) { (data, error) in
            switch(data, error) {
            case (let data?, nil):
                let stock = try? JSONDecoder().decode(Stock.self, from: data)
                completion(stock)
            default:
                completion(nil)
            }
        }
    }
}
