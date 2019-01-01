//
//  ViewController.swift
//  FunFacts
//
//  Created by Kai Munechika on 12/31/18.
//  Copyright © 2018 Kai Munechika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var funFactButton: UIButton!
    
    let factProvider = FactProvider()
    let backgroundColorProvider = BackgroundColorProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        funFactLabel.text = factProvider.randomFact()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showFact() {
        funFactLabel.text = factProvider.randomFact()
        let randomColor = backgroundColorProvider.randomColor()
        view.backgroundColor = randomColor
        funFactButton.tintColor = randomColor 
    }
}

