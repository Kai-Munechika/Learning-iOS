//
//  ViewController.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/9/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit
import Kingfisher


class ChapterViewController: UITableViewController {
        
    let imageUrls: [String] = MockData.mockChapter.imageUrls    
    let images: [UIImage] = [#imageLiteral(resourceName: "image15"), #imageLiteral(resourceName: "image0"), #imageLiteral(resourceName: "image16"), #imageLiteral(resourceName: "image3"), #imageLiteral(resourceName: "imagen"), #imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Page", for: indexPath) as! ChapterTableViewCell
        cell.pageImageView.image = images[indexPath.row] 
        return cell
    }
    
    
}

