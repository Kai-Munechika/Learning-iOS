//
//  ViewController.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/9/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: MockData.mockChapter.imageUrls[9])
        imageView.kf.setImage(with: url)
        

        //KissMangaScraper.scrape()
    }
}

