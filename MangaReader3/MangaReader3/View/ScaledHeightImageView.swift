//
//  ScaleAspectFitImageView.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/12/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit

class ScaledHeightImageView: UIImageView {
    
    override var intrinsicContentSize: CGSize {
        
        if let image = self.image {
            let imageWidth = image.size.width
            let imageHeight = image.size.height
            let imageViewWidth = self.frame.size.width
            
            let ratio = imageViewWidth/imageWidth
            let scaledHeight = imageHeight * ratio
            
            return CGSize(width: imageViewWidth, height: scaledHeight)
        }
        
        return CGSize(width: -1.0, height: -1.0)
    }
}
