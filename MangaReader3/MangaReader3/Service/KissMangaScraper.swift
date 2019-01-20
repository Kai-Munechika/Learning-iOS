//
//  KissMangaScraper.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/9/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import Foundation
import Erik
import SwiftSoup


struct Chapter {
    let name: String
    let imageUrls: [String]
}

class KissMangaScraper {
    
    static func fetchChapter(url: String, completion: @escaping (Chapter) -> ()) {
        fetchWebpage(url: url) { html in
            do {
                let doc: SwiftSoup.Document = try SwiftSoup.parse(html)
                
                // Image URLs
                var imageUrls: [String] = []
                let imgElements = try doc.select("#divImage img")            
                for elem in imgElements {
                    try imageUrls.append(elem.attr("src"))
                }
                
                // Chapter name
                let headerElem = (try doc.select("select option[selected]")).get(2)
                let chapterName = String(try headerElem.text())
                
                let chapter = Chapter(name: chapterName, imageUrls: imageUrls)
                completion(chapter)
                
            } catch {
                print(error)
            }
        }
    }
    
    private static func fetchWebpage(url: String, completion: @escaping (_ html: String) -> ()) {
        Erik.visit(url: URL(string: url)!) { object, error in
            if let e = error {
                print(e)
                return
            } else if let doc = object {
                guard let html = doc.body?.toHTML else { return }
                
                print(html)
                
                func isPreScreen(html: String) -> Bool {
                    do {
                        let waitString = "Please wait 5 seconds..."
                        let doc: SwiftSoup.Document = try SwiftSoup.parse(html)    
                        return try doc.text().prefix(waitString.count) == waitString
                    } catch { print(error) }
                    
                    return false
                }
                
                if !isPreScreen(html: html) {
                    completion(html)
                } else {
                    // Todo: handle prescreen case
                }
            }
        }
    }
}
