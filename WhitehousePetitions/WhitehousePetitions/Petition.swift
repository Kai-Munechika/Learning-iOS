//
//  Petition.swift
//  WhitehousePetitions
//
//  Created by Kai Munechika on 1/17/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
