//
//  LoginViewController.swift
//  PasswordManager
//
//  Created by Kai Munechika on 2/25/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticationWithTouchID()
    }
    
    @IBAction func loginPressed() {
        authenticationWithTouchID()
    }
    
    func authenticationWithTouchID() {
        let localAuthenticationContext = LAContext()
        localAuthenticationContext.localizedFallbackTitle = "Enter Passcode"
        
        var authError: NSError?
        let reasonString = "To access secure data"
        
        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
            
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reasonString) {[unowned self] success, evaluateError in
                if success {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "gotoMain", sender: nil)
                    }
                } else {
                    if let error = evaluateError { print(error) }
                }
            }
        } 
    }
}
