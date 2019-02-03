//
//  ViewController.swift
//  Counter
//
//  Created by Kai Munechika on 2/2/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    var count = 0 {
        didSet {
            countLabel.text = String(count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Counter"
        
        let done = UIBarButtonItem(title: "Reset", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ViewController.resetClicked) )
        navigationItem.setLeftBarButton(done, animated: false)
    }
    
    @objc func resetClicked() {
        count = 0
    }

    @IBAction func tap(_ sender: Any) {
        count += 1
    }
}

