//
//  Person.swift
//  NamesToFaces
//
//  Created by Kai Munechika on 1/21/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit

// One proviso you ought to be aware of: please don't consider UserDefaults to be safe, because it isn't. If you have user information that is private, you should consider writing to the keychain instead.


// NSCoding is a great way to read and write data when using UserDefaults, and is the most common option when you must write Swift code that lives alongside Objective-C code.

// However, if you’re only writing Swift, the Codable protocol is much easier. We already used it to load petition JSON back in project 7, but now we’ll be loading and saving JSON.

//class Person: NSObject, NSCoding {
class Person: NSObject, Codable {

    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    // If we used NSCoding over Codable
//    
//    // The initializer is used when loading objects of this class, and encode() is used when saving.
//    required init(coder aDecoder: NSCoder) {
//        name = aDecoder.decodeObject(forKey: "name") as! String
//        image = aDecoder.decodeObject(forKey: "image") as! String
//    }
//    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(name, forKey: "name")
//        aCoder.encode(image, forKey: "image")
//    }
}
