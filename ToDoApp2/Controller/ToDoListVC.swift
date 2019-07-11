//
//  ViewController.swift
//  ToDoApp2
//
//  Created by West Kraemer on 7/10/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class ToDoListVC: UITableViewController {

    var itemArray = [item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addButtonPressed(_ sender: Any) {
       var textField = UITextField()
        
        //create alert controller
        let alert = UIAlertController(title: "Add New To Do List Item", message: "", preferredStyle: .alert)
        
       //create action
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        //add a textfield to the alert controller
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new to do list item"
            textField = alertTextField
            print("add textfield")
            
        }
      
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

