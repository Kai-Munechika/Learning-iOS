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
    
    weak var scrollView: UIScrollView!
    
    //TODO: USE LAZY LOADING
    override func loadView() {
        super.loadView()
        
        initScrollView()
        
        // add images
        let imageUrls = MockData.mockChapter.imageUrls
        var imageViews = [UIImageView]()
        
        for url in imageUrls {
            
            let imageView = ScaledHeightImageView(frame: .zero)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(imageView)
            
            var constraints = [imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                               imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)]
            
            if let lastView = imageViews.last { constraints.append(imageView.topAnchor.constraint(equalTo: lastView.bottomAnchor)) }
            NSLayoutConstraint.activate(constraints)
            
            imageView.kf.setImage(with: URL(string: url))
            imageView.contentMode = .scaleAspectFit
            imageViews.append(imageView)
        }
        
        // todo: figure out how to dynamically/asynchronously update this as images are loaded in
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 10000)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func initScrollView() {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        scrollView.backgroundColor = .blue
        self.scrollView = scrollView
    }
}

