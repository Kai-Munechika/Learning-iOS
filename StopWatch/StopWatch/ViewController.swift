//
//  ViewController.swift
//  StopWatch
//
//  Created by Kai Munechika on 1/8/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!

    var timer = Timer()    
    var currentSeconds = 0.0 { 
        didSet { timeLabel.text = String(format: "%.1f", self.currentSeconds) }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(currentSeconds)
        pauseButton.isEnabled = false
    }
    
    @IBAction func startTimer() {
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseTimer() {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
    }
    

    @IBAction func resetTimer() {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        
        currentSeconds = 0.0
    }
    
    @objc func updateTimer() {
        currentSeconds += 0.1
    }
    
}

