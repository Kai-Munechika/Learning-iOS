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
        
        loadItems()
    }
    
    @IBAction func addClicked(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add account", message: "", preferredStyle: .alert)
        
        alert.addTextField { $0.placeholder = "App name" }
        alert.addTextField { $0.placeholder = "Email" }
        alert.addTextField { $0.placeholder = "Password"; $0.isSecureTextEntry = true }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel)) 
        alert.addAction(UIAlertAction(title: "Add", style: .default) { [unowned self] (action) in
            let item = AccountItem(context: self.context)
            item.appName = alert.textFields?[0].text
            item.email = alert.textFields?[1].text
            item.password = alert.textFields?[2].text
            
            self.items.append(item)
            self.saveItems()
            
            let indexPath = IndexPath(row: self.items.count - 1, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        })
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Data Persistence Methods
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


// MARK: - UITableViewDataSource Methods
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

// MARK: - UITableViewDelegate Methods
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { [unowned self] action, index in
            self.context.delete(self.items[index.row])
            self.saveItems()
            
            self.items.remove(at: index.row)
            self.tableView.deleteRows(at: [index], with: .automatic)
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { [unowned self] action, index in
            let selectedItem = self.items[index.row]
            let alert = UIAlertController(title: "Edit account", message: "", preferredStyle: .alert)
            
            alert.addTextField { $0.placeholder = "App name"; $0.text =  selectedItem.appName }
            alert.addTextField { $0.placeholder = "Email"; $0.text = selectedItem.email }
            alert.addTextField { $0.placeholder = "Password"; $0.isSecureTextEntry = true; $0.text = selectedItem.password }
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel)) 
            alert.addAction(UIAlertAction(title: "Save", style: .default) {(action) in
                selectedItem.appName = alert.textFields?[0].text
                selectedItem.email = alert.textFields?[1].text
                selectedItem.password = alert.textFields?[2].text
                
                self.saveItems()
                self.tableView.reloadRows(at: [index], with: .automatic)
            })   
            self.present(alert, animated: true, completion: nil)
        }
        return [deleteAction, editAction]
    }
}

