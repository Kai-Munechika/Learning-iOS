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
    
    @IBOutlet weak var tapButton: UIButton!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Counter"
        
        let done = UIBarButtonItem(title: "Reset", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ViewController.resetClicked) )
        navigationItem.setLeftBarButton(done, animated: false)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        tapButton.addGestureRecognizer(longGesture)
    }
    
    @objc func resetClicked() {
        count = 0
    }
    
    @IBAction func tap(_ sender: Any) {
        count += 1
    }
    
    @objc func longTap(_ sender: UIGestureRecognizer) {
        if sender.state == .ended {
            timer?.invalidate()
            timer = nil
        }
        else if sender.state == .began {
            print(sender.state)
            timer = Timer.scheduledTimer(withTimeInterval: 0.025, repeats: true) { [unowned self] timer in
                self.count += 1
            }
        }
    }
}

