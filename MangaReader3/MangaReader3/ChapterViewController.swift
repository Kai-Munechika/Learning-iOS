//
//  ViewController.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/9/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit
import Kingfisher

// todo: update expected cell height to be moving average of imageView cells' heights loaded so far
class ChapterViewController: UITableViewController {
        
    var imageUrls = [String]()    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false;
        
        KissMangaScraper.fetchChapter(url: MockData.mockChapterUrl) { [weak self] chapter in
            self?.imageUrls = chapter.imageUrls
            self?.tableView.reloadData()
        }
    }
    
    deinit {
        print ("ChapterViewController deallocated")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Page", for: indexPath) as! ChapterTableViewCell
        cell.pageImageView.kf.setImage(with: URL(string: imageUrls[indexPath.row])) { _ in
            cell.setNeedsLayout()
            
            UIView.performWithoutAnimation {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
        return cell
    }
}

