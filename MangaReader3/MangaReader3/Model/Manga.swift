//
//  Manga.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/20/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import Foundation

struct Manga {
    let id: String
    let imageUrl: String
    let name: String
    let status: Status
    let genres: [String]
    let numViews: Int
    let description: String
    let author: String
    let artist: String
    let chapters: [Chapter]
}

enum Status: Int {
    case suspended = 0
    case ongoing = 1
    case completed = 2
}
