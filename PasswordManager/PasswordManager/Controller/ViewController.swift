//
//  ViewController.swift
//  PasswordManager
//
//  Created by Kai Munechika on 2/25/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items = [AccountItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 68
        
//        var accountItem = AccountItem(context: context)
//        accountItem.appName = "M1 Finance"
//        accountItem.email = "kaim808@gmail.com" 
//        accountItem.password = "testpassword123"
//                
//        accountItem = AccountItem(context: context)
//        accountItem.appName = "Robinhood"
//        accountItem.email = "kaim808@gmail.com" 
//        accountItem.password = "testpassword123"
//        saveItems()
        
        loadItems()
    }
    
    @IBAction func addClicked(_ sender: UIBarButtonItem) {
    }
    
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    func loadItems() {
        let request: NSFetchRequest<AccountItem> = AccountItem.fetchRequest()
        
        do {
            items = try context.fetch(request)
            tableView.reloadData()
        } catch {
            print("Error loading data \(error)")
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

