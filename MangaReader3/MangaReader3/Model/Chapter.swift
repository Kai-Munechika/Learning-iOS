//
//  Chapter.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/20/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import Foundation

struct Chapter {
    let number: Double
    let epochDateAdded: Int
    let title: String?
    let id: String
    
    var formattedTitle: String {
        return "Chapter \(number.isInt ? String(Int(number)) : String(number))" 
    }
}

extension Double {
    var isInt: Bool {
        return floor(self) == self
    }
}
