//
//  ViewController.swift
//  Todoey
//
//  Created by Kai Munechika on 2/9/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    var itemArray = [String]() {
        didSet {
            self.defaults.setValue(self.itemArray, forKey: "TodoListArray")
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoListTableCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)!
        switch cell.accessoryType {
        case .checkmark:
            cell.accessoryType = .none
        default:
            cell.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add new Todoey", message: "", preferredStyle: .alert)
        
        var textField = UITextField()
        alert.addTextField { (_textField) in
            textField = _textField
            textField.placeholder = "Create new item"
        }
        
        alert.addAction(UIAlertAction(title: "Add Todoey", style: .default) { (action) in
            self.itemArray.append(textField.text!)
        })
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

