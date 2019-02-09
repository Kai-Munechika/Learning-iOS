//
//  TodoItem.swift
//  Todoey
//
//  Created by Kai Munechika on 2/9/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import Foundation

class TodoItem {
    var title: String = ""
    var isChecked: Bool = false
    
    init(title: String, isChecked: Bool) {
        self.title = title
        self.isChecked = isChecked
    }
}
