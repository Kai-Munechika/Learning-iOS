//
//  MangaEden.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/22/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import Foundation
import Alamofire

class MangaEden {
    
    static func fetchChapterPages(chapterId: String = "5bba7301719a168f49c02240", completion: @escaping ([ChapterPage]) -> ()) {
        let url = URL(string: "https://www.mangaeden.com/api/chapter/\(chapterId)/")!
        
        guard let data = try? Data(contentsOf: url), 
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any],
            let images = json["images"] as? [[Any]] 
            else { return }
        
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
}
