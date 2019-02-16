//
//  CategoriesViewController.swift
//  Todoey
//
//  Created by Kai Munechika on 2/15/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit
import CoreData

class CategoriesViewController: UITableViewController  {

    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()   
        loadCategories()
    }
    
    // MARK: - Table view datasource and delegate methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Add new categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        var textField = UITextField()
        alert.addTextField { (_textField) in
            textField = _textField
            textField.placeholder = "Add a new category"
        }
        
        alert.addAction(UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            newCategory.items = NSSet(array: [Item]())
            
            self.categoryArray.append(newCategory)
            self.tableView.reloadData()
            self.saveCategories()
        })
        
        present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - Data manipulation
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print(error)
        }
    }    
}
