//
//  HTTPClient.swift
//  AIR
//
//  Created by Denisse Zavala on 25/07/2018.
//  Copyright © 2018 Daniela Bulgaru. All rights reserved.
//

import Foundation

class HTTPClient {
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func get(URL: URL, completion: @escaping (Data?, AIRError?) -> Void) {
        let task = session.dataTask(with: URL) { (data, response, error) in
            switch(data, response, error) {
            case(let data?, _, _):
                completion(data, nil)
            default:
                completion(nil, .NetworkError)
            }
        }
        task.resume()
    }
}
