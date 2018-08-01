//
//  MockURLSession.swift
//  AIRTests
//
//  Created by Denisse Zavala on 26/07/2018.
//  Copyright © 2018 Daniela Bulgaru. All rights reserved.
//

import Foundation
@testable import AIR

class MockURLSession: URLSessionProtocol {
    let data: Data
    var lastURL: URL?
    
    init() {
        let path = Bundle(for: type(of: self)).path(forResource: "stock", ofType: "json")!
        self.data = try! NSData(contentsOfFile: path) as Data
    }
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        lastURL = url
        return MockURLSessionDataTask(data: data, completionHandler: completionHandler)
    }
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    let data: Data
    let completionHandler: (Data?, URLResponse?, Error?) -> Void
    
    init(data: Data, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.data = data
        self.completionHandler = completionHandler
    }
    
    func resume() {
        completionHandler(data, nil, nil)
    }
}
