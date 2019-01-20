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

class KissMangaScraper {
    
    // todo: persist chapter names, links, and dates
    static func fetchManga(url: String, completion: @escaping (Manga) -> ()) {
        fetchWebpage(url: url) { html in
            do {
                let doc: SwiftSoup.Document = try SwiftSoup.parse(html)
                
                let mangaName = try doc.select(".bigChar").first()?.text() ?? ""
                
                let barContent = try doc.select(".barContent").first()! 
                let dataContainer = barContent.children().get(1)
                let dataParagraphs = try dataContainer.select("p")
                
                let (otherNameElem, genresElem, authorsElem, statusAndViewsElem, descriptionElem) = (dataParagraphs.get(0), dataParagraphs.get(1), dataParagraphs.get(2), dataParagraphs.get(3), dataParagraphs.get(5))
                
                let otherNames = try otherNameElem.text().dropFirst("Other name: ".count).components(separatedBy: "; ")
                let genres = try genresElem.text().dropFirst("Genres: ".count).components(separatedBy: ", ").map { Genre.init(rawValue: $0) ?? .err }
                let authors = try authorsElem.text().dropFirst("Author: ".count).components(separatedBy: ", ")
                
                let components = try statusAndViewsElem.text().components(separatedBy: "           ")
                let (status, numViews) = (
                    Status.init(rawValue: components[0].dropFirst("Status: ".count).lowercased()) ?? .err, 
                    Int(components[1].dropFirst("Views: ".count).dropLast("Bookmark".count).trimmingCharacters(in: .whitespaces).replacingOccurrences(of: ",", with: ""))!
                )
                
                let description = try descriptionElem.text()
                let imgUrl = try (doc.select("img").last()?.attr("src"))!
                
                var chapters = [Chapter]()
                
                // each of these rows contain chapter data
                let chapterTableRows = try doc.select("tr").dropFirst(2)
                
                for row in chapterTableRows {
                    let chapterUrl = try "https://kissmanga.com" + row.select("a").attr("href")
                    let chapterName = try row.select("a").text()
                    let date = try row.select("td").last()?.text()
                    
                    chapters.append(Chapter(name: chapterName, url: chapterUrl, dateAdded: date!))
                }
                
                let manga = Manga(name: mangaName, otherNames: otherNames, numViews: numViews, genres: genres, description: description, status: status, authors: authors, imageUrl: imgUrl, chapters: chapters)
                completion(manga)
                
            } catch {
                print(error)
            }
        }
    }
    
    static func fetchChapterImageUrls(url: String, completion: @escaping ([String]) -> ()) {
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
                // let headerElem = (try doc.select("select option[selected]")).get(2)
                // let chapterName = String(try headerElem.text())
                
                completion(imageUrls)
                
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
                                
                func isPreScreen(html: String) -> Bool {
                    do {
                        let waitString = "Please wait 5 seconds..."
                        let doc: SwiftSoup.Document = try SwiftSoup.parse(html)    
                        return try doc.text().prefix(waitString.count) == waitString
                    } catch { print(error) }
                    
                    return false
                }
                
                if !isPreScreen(html: html) {
                    print("prescreen passed; success")
                    completion(html)
                } else {
                    print("prescreen hit; try again in a few seconds")
                    // Todo: handle prescreen case
                }
            }
        }
    }
}
