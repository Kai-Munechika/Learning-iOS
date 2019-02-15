//
//  ViewController.swift
//  ExerciseTracker
//
//  Created by Kai Munechika on 2/13/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var exercises = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - UI Event Listeners
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        let alert = getTextFieldAlert(title: "Add new exercise", textFieldPlaceholder: "Exercise name", actionTitle: "Add") { (textField) in
            self.exercises.append(textField.text!)
            
            let indexPath = IndexPath(row: self.exercises.count - 1, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Utility Methods
    func getTextFieldAlert(title: String, textFieldPlaceholder: String, actionTitle: String, actionCallback: @escaping (UITextField) -> Void) -> UIAlertController {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = textFieldPlaceholder }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel)) 
        alert.addAction(UIAlertAction(title: actionTitle, style: .default) { (action) in
            let textField = alert.textFields![0]
            if textField.text!.isEmpty { return } // todo: notify/halt user -- empty string is invalid 
            
            actionCallback(textField)
        })
        
        return alert
    }
}


// MARK: - TableView Delegate/DataSource Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseListTableCell", for: indexPath)
        cell.textLabel?.text = exercises[indexPath.row]
        
        return cell
    }    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { action, index in
            self.exercises.remove(at: index.row)
            self.tableView.deleteRows(at: [index], with: .automatic)
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            let alert = self.getTextFieldAlert(title: "Change exercise name", textFieldPlaceholder: "Exercise name", actionTitle: "Save") { (textField) in
                self.exercises[index.row] = textField.text!
                tableView.reloadRows(at: [index], with: .automatic)
            }
            self.present(alert, animated: true, completion: nil)
        }
        
        return [deleteAction, editAction]
    }
}
