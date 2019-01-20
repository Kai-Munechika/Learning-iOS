//
//  MangaViewController.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/20/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit

class MangaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        KissMangaScraper.fetchManga(url: MockData.mockMangaUrl) { manga in
            print(manga)            
        }
    }
}
