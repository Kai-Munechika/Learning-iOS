//
//  MangaViewController.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/20/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit
import WebKit
import Kingfisher
import Erik

class MangaViewController: UIViewController {
    
    @IBOutlet weak var mangaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KissMangaScraper.fetchManga(url: MockData.mockMangaUrl) { [weak self] manga in
            WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
                
                print()
                print(cookies)
                
                let headerFields = HTTPCookie.requestHeaderFields(with: cookies)
                    
                print(headerFields)
                print()
                
//                let modifier = AnyModifier { request in
//                    var r = request    
//                    r.setValue(headerFields["Cookie"], forHTTPHeaderField: "Cookie")
//                    r.setValue("Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B411 Appended Custom User Agent", forHTTPHeaderField: "User-Agent")
//                    return r
//                }
//                
                
                var r = URLRequest(url: URL(string: manga.imageUrl)!)    
                r.setValue(headerFields["Cookie"], forHTTPHeaderField: "Cookie")
                r.setValue("Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B411 Appended Custom User Agent", forHTTPHeaderField: "User-Agent")
                
               let task = URLSession.shared.dataTask(with: r) { data, response, error in 
                    if let data = data {
                        print(data)
                    }
                    
                    if let response = response {
                        print(response)
                    }
                    
                    if let error = error {
                        print(error)
                    }
                }
                
                task.resume()

                // self?.mangaImageView.kf.setImage(with: URL(string: manga.imageUrl), options: [.requestModifier(modifier)])
            }
        }
    }
}

//extension Erik {
//    func getUserAgent() -> String {
//        let t = (self.layoutEngine as! WebKitLayoutEngine).webView.userAgent
//        print()
//        print("USER AGENT")
//        print(t)
//        print()
//        return t
//    }
//}

