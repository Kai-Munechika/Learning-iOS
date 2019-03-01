//
//  ViewController.swift
//  PasswordManager
//
//  Created by Kai Munechika on 2/25/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit
import CoreData
import LocalAuthentication


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items = [AccountItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 102
        
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
        cell.passwordLabel.text = item.password
        return cell
    }
}

// MARK: - UITableViewDelegate Methods
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // uncomment this if we want to force users to authenticate before viewing passwords
        // authenticationWithTouchID(item: items[indexPath.row])
        
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
            alert.addTextField { $0.placeholder = "Password"; $0.isSecureTextEntry = true; }
            
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


// MARK: - Authentication with Touch ID // Passcode methods
// source: https://codeburst.io/biometric-authentication-using-swift-bb2a1241f2be
extension ViewController {
    
    func authenticationWithTouchID(item: AccountItem) {
        let localAuthenticationContext = LAContext()
        localAuthenticationContext.localizedFallbackTitle = "Enter Passcode"
        
        var authError: NSError?
        let reasonString = "To access secure data"
        
        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
            
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reasonString) { success, evaluateError in
                if success {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "\(item.appName!) ", 
                            message: "\(item.email!)\nPassword: \(item.password!)",
                            preferredStyle: .alert)
                        
                        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
                        self.present(alertController, animated: true, completion: nil)
                    }
                } else {
                    guard let error = evaluateError else { return }
                    print(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error._code))
                }
            }
        } else {
            guard let error = authError else { return }
            
            //TODO: Show appropriate alert if biometry/TouchID/FaceID is lockout or not enrolled
            print(self.evaluateAuthenticationPolicyMessageForLA(errorCode: error.code))
        }
    }
    
    func evaluatePolicyFailErrorMessageForLA(errorCode: Int) -> String {
        var message = ""
        if #available(iOS 11.0, macOS 10.13, *) {
            switch errorCode {
            case LAError.biometryNotAvailable.rawValue:
                message = "Authentication could not start because the device does not support biometric authentication."
                
            case LAError.biometryLockout.rawValue:
                message = "Authentication could not continue because the user has been locked out of biometric authentication, due to failing authentication too many times."
                
            case LAError.biometryNotEnrolled.rawValue:
                message = "Authentication could not start because the user has not enrolled in biometric authentication."
                
            default:
                message = "Did not find error code on LAError object"
            }
        } else {
            switch errorCode {
            case LAError.biometryLockout.rawValue:
                message = "Too many failed attempts."
                
            case LAError.biometryNotAvailable.rawValue:
                message = "TouchID is not available on the device"
                
            case LAError.biometryNotEnrolled.rawValue:
                message = "TouchID is not enrolled on the device"
                
            default:
                message = "Did not find error code on LAError object"
            }
        }
        
        return message;
    }
    
    func evaluateAuthenticationPolicyMessageForLA(errorCode: Int) -> String {
        
        var message = ""
        
        switch errorCode {
            
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.notInteractive.rawValue:
            message = "Not interactive"
            
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.userCancel.rawValue:
            message = "The user did cancel"
            
        case LAError.userFallback.rawValue:
            message = "The user chose to use the fallback"
            
        default:
            message = evaluatePolicyFailErrorMessageForLA(errorCode: errorCode)
        }
        
        return message
    }
}

