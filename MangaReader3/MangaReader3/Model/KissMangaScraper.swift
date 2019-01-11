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
    let number: String
    let name: String
    let imageUrls: [String]
}

class KissMangaScraper {
    
    static func scrape() {
        let url = "https://kissmanga.com/Manga/Hunter-Age/Ch-167---Constant-Changes?id=474157"
        let callback = KissMangaScraper.printChapterData
        
        KissMangaScraper.parseWebPage(url: url, callback: callback)
    }
    
    static func isPreScreen(html: String) -> Bool {
        let waitString = "Please wait 5 seconds..."
        
        do {
            let doc: SwiftSoup.Document = try SwiftSoup.parse(html)    
            return try doc.text().prefix(waitString.count) == waitString
        } catch Exception.Error(_, let message) {
            print(message)
        } catch {
            print("error")
        }
        
        return false
    }
    
    static func parseWebPage(url: String, callback: @escaping (String) -> Void) {
        Erik.visit(url: URL(string: url)!) { object, error in
            if let e = error {
                print(e)
                return
            } else if let doc = object {
                guard let html = doc.body?.toHTML else { return }
                
                print(html)
                
                if !isPreScreen(html: html) {
                    callback(html)
                } else {
                    // Todo: handle prescreen case
                }
            }
        }
    }
    
    static func printChapterData(html: String) {
        do {
            let doc: SwiftSoup.Document = try SwiftSoup.parse(html)
            
            // Image URLs
            var imageUrls: [String] = []
            let imgElements = try doc.select("#divImage img")            
            for elem in imgElements {
                try imageUrls.append(elem.attr("src"))
            }
            
            // Chapter number and title
            let headerElem = (try doc.select("select option[selected]")).get(2) // the third select element contains the chapter num and name text
            let chapterHeaderText = String(try headerElem.text().dropFirst(3))  // the first 3 chars are "Ch."
            let components: [String] = chapterHeaderText.components(separatedBy: CharacterSet(charactersIn: "-")).map { $0.trimmingCharacters(in: .whitespaces)}
            let (chapterNum, chapterName) = (components[0], components[1])
            
            let chapter = Chapter(number: chapterNum, name: chapterName, imageUrls: imageUrls)
            print(chapter)
            
        } catch Exception.Error(_, let message) {
            print(message)
        } catch {
            print("error")
        }
    }
}
