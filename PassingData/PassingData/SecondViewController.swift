//
//  SecondViewController.swift
//  PassingData
//
//  Created by Kai Munechika on 2/7/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit

protocol CanReceiveData {
    func dataReceived(data: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    var delegate: CanReceiveData?
    var data = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel.text = data
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        delegate?.dataReceived(data: textField.text!)
        dismiss(animated: true, completion: nil)
    }
}
