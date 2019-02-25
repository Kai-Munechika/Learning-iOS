//
//  ViewController.swift
//  PasswordManager
//
//  Created by Kai Munechika on 2/25/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [AccountItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 68
        
        items.append(AccountItem(appName: "M1 Finance", email: "kaim808@gmail.com", password: "testpassword123"))
        items.append(AccountItem(appName: "Robinhood", email: "kaim808@gmail.com", password: "testpassword123"))
    }
    
    @IBAction func addClicked(_ sender: UIBarButtonItem) {
    }
}


// MARK: - UITableViewDataSource methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath) as! AccountPrototypeCell
        let item = items[indexPath.row]
        cell.appNameLabel.text = item.appName
        cell.emailLabel.text = item.email
        return cell
    }
}

// MARK: - UITableViewDelegate methods
extension ViewController: UITableViewDelegate {
    
}

