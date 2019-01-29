//
//  MangaViewController.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/20/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit
import Kingfisher
import CoreImage

class MangaViewController: UIViewController {
    
    @IBOutlet weak var mangaImageView: UIImageView!
    @IBOutlet weak var background: UIImageView!
    
    let darkGray = UIColor(red: 0x1D, green: 0x1D, blue: 0x2F)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        background.image = UIImage.from(color: darkGray)
        
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            MangaEden.fetchManga() { [weak self] manga in
                
                self?.mangaImageView.kf.setImage(with: URL(string: manga.imageUrl))
                
                DispatchQueue.main.async {
                    self?.background.kf.setImage(with: URL(string: manga.imageUrl)) { result in
                        if (result.isSuccess) {
                            self?.background.image = self?.mangaImageView.image
                            self?.applyBlurEffect(imageView: (self?.background)!)
                        }
                    }
                }
            }
        }
    }
    
    func applyBlurEffect(imageView: UIImageView) {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = imageView.frame
        imageView.addSubview(blurView)
    }
}


// to create UIColors from rgb hex values
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


// to create a UIImage from UIColor
extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
