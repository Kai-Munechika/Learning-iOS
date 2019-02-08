//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var currencies: [String: Double] = [:]
    
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        getPriceData()
    }
    
    
    //MARK: - UIPickerView delegate methods
    /***************************************************************/
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(currencies)[row].key
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let value = Array(currencies)[row].value
        bitcoinPriceLabel.text = String(format: "%.2f", value)
    }
    
    
    //MARK: - Networking
    /***************************************************************/
    
    func getPriceData(url: String = "https://blockchain.info/ticker", parameters: [String: String] = [:]) {
        Alamofire.request(url, method: .get, parameters: parameters)
            .responseJSON { [weak self] response in
                if response.result.isSuccess {
                    
                    let bitcoinData : JSON = JSON(response.result.value!)
                    self?.updatePrices(json: bitcoinData)
                    
                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self?.bitcoinPriceLabel.text = "Connection Issues"
                }
        }
    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    func updatePrices(json: JSON) {
        for (key, subJson) in json {
            currencies[key] = subJson["last"].doubleValue
        }
        currencyPicker.reloadComponent(0)
    }
}

