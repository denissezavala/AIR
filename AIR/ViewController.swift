//
//  ViewController.swift
//  AIR
//
//  Created by Daniela Bulgaru on 12/07/2018.
//  Copyright © 2018 Daniela Bulgaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Service().getStockData { stock in
            DispatchQueue.main.async {
                if let stock = stock {
                    self.priceLabel.text = "$\(String(stock.currentPrice))"
                } else {
                    self.priceLabel.text = "error!"
                }
            }
        }
    }

}

