//
//  Manga.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/20/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import Foundation

struct Manga {
    let name: String
    let otherNames: [String]
    let numViews: Int
    let genres: [Genre]
    let description: String
    let status: Status
    let authors: [String]
    let imageUrl: String
}

enum Status: String {
    case completed
    case ongoing
    case err
}

enum Genre: String {
    case fourKoma = "4-Koma"
    case action = "Action"
    case adult = "Adult"
    case adventure = "Adventure"
    case comedy = "Comedy"
    case comic = "Comic"
    case cooking = "Cooking"
    case doujinshi = "Doujinshi"
    case drama = "Drama"
    case ecchi = "Ecchi"
    case fantasy = "Fantasy"
    case genderBender = "Gender Bender"
    case harem = "Harem"
    case historical = "Historical"
    case horror = "Horror"
    case isekai = "Isekai"
    case josei = "Josei"
    case lolicon = "Lolicon"
    case manga = "Manga"
    case manhua = "Manhua"
    case manhwa = "Manhwa"
    case martialArts = "Martial Arts"
    case mature = "Mature"
    case mecha = "Mecha"
    case medical = "Medical"
    case music = "Music"
    case mystery = "Mystery"
    case oneShot = "One shot"
    case psychological = "Psychological"
    case romance = "Romance"
    case schoolLife = "School Life"
    case sci_fi = "Sci-fi"
    case seinen = "Seinen"
    case shotacon = "Shotacon"
    case shoujo = "Shoujo"
    case shoujoAi = "Shoujo Ai"
    case shounen = "Shounen"
    case shounenAi = "Shounen Ai"
    case sliceOfLife = "Slice of Life"
    case smut = "Smut"
    case sports = "Sports"
    case supernatural = "Supernatural"
    case tragedy = "Tragedy"
    case webtoon = "Webtoon"
    case yaoi = "Yaoi"
    case yuri = "Yuri"
    case err = ""
}



