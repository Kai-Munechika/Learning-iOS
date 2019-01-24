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
        
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            MangaEden.fetchManga() { [weak self] manga in
                
                DispatchQueue.main.async { [weak self] in
                    self?.mangaImageView.kf.setImage(with: URL(string: manga.imageUrl))
                }
            }
        }
    }
}
