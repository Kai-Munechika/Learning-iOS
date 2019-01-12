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
    
    weak var imageView: UIView!
    
    override func loadView() {
        super.loadView()
        
        let imageView = ScaledHeightImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
        
        let url = URL(string: MockData.mockChapter.imageUrls[7]) 
        imageView.kf.setImage(with: url)
        self.imageView = imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.contentMode = .scaleAspectFit
    }
}

