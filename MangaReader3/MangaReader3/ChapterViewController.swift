//
//  ViewController.swift
//  MangaReader3
//
//  Created by Kai Munechika on 1/9/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit
import Kingfisher

// todo: handle/fix error where app crashes if we navigate backwards when images are still loading
// todo: update expected cell height to be moving average of imageView cells' heights loaded so far
class ChapterViewController: UITableViewController {
    
    var chapterId: String = ""
    var chapterPages = [ChapterPage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false;
        
        DispatchQueue.global(qos: .userInteractive).async { [unowned self] in
            MangaEden.fetchChapterPages(chapterId: self.chapterId) { [weak self] chapterPages in
                DispatchQueue.main.async {
                    self?.chapterPages = chapterPages
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    deinit {
        print ("ChapterViewController deallocated")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapterPages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Page", for: indexPath) as! ChapterTableViewCell
        cell.pageImageView.kf.setImage(with: URL(string: chapterPages[indexPath.row].imageUrl)) { _ in
            cell.setNeedsLayout()
            
            UIView.performWithoutAnimation {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let chapterPage = chapterPages[indexPath.row]
        
        let screenWidth = view.frame.width
        let ratio = screenWidth / CGFloat(integerLiteral: chapterPage.width)
        let scaledHeight = ratio * CGFloat(integerLiteral: chapterPage.height)
        
        return scaledHeight
    }
}

