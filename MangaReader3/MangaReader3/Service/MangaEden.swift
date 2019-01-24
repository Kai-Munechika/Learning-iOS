//
//  MangaEden.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/22/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import Foundation
import Alamofire

// todo: add status code checks on api calls and handle unsuccessful calls
class MangaEden {
    
    static func fetchChapterPages(chapterId: String = "55a2c124719a165e76366bf1", completion: @escaping ([ChapterPage]) -> ()) {
        let url = URL(string: "https://www.mangaeden.com/api/chapter/\(chapterId)/")!
        
        guard let data = try? Data(contentsOf: url), 
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any],
            let images = json["images"] as? [[Any]] 
            else { 
                print("fetchChapterPages error")
                return 
        }
        
        var chapterPages = [ChapterPage]()
        
        for image in images {
            let (imageUrl, width, height) = (
                "https://cdn.mangaeden.com/mangasimg/" + (image[1] as! String),
                image[2] as! Int,
                image[3] as! Int
            )
            
            let chapterPage = ChapterPage(imageUrl: imageUrl, width: width, height: height)
            chapterPages.insert(chapterPage, at: 0)
        }
        
        completion(chapterPages)
    }
    
    static func fetchManga(mangaId: String = "540f32ba45b9ef2a4977009e", completion: @escaping (Manga) -> ()) {
        let url = URL(string: "https://www.mangaeden.com/api/manga/\(mangaId)/")!
        
        guard let data = try? Data(contentsOf: url), 
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any],
            let name = json["title"] as? String,
            var imageUrl = json["imageURL"] as? String,
            let status = Status.init(rawValue: (json["status"] as! Int)),
            let genres = json["categories"] as? [String],
            let numViews = json["hits"] as? Int,
            let description = json["description"] as? String,
            let author = json["author"] as? String,
            let artist = json["artist"] as? String,
            let chapters = (json["chapters"] as? [[Any]])?.map({ (arr: [Any]) -> Chapter in
                let chapterNum = arr[0] as! Double
                let dateAdded = arr[1] as! Int
                let title: String? = arr[2] is NSNull ? nil : (arr[2] as! String)
                let id = arr[3] as! String
                return Chapter(number: chapterNum, epochDateAdded: dateAdded, title: title, id: id)
            })
            else {
                print("fetchManga error")
                return 
        }
        
        // try to use https scheme
        var components = URLComponents(string: imageUrl)!
        components.scheme = "https"
        imageUrl = components.string!
        
        let manga = Manga(id: mangaId, imageUrl: imageUrl, name: name, status: status, genres: genres, numViews: numViews, description: description, author: author, artist: artist, chapters: chapters)
        
        completion(manga)
    }
}
