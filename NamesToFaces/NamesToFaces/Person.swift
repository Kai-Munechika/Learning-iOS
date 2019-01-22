//
//  Person.swift
//  NamesToFaces
//
//  Created by Kai Munechika on 1/21/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
