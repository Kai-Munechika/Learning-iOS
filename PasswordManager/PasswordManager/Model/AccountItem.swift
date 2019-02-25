//
//  AccountItem.swift
//  PasswordManager
//
//  Created by Kai Munechika on 2/25/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import Foundation

class AccountItem {
    
    var appName: String
    var email: String
    var password: String
    
    init(appName: String, email: String, password: String) {
        self.appName = appName
        self.email = email
        self.password = password
    }
}
