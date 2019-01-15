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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false;
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

