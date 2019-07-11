//
//  ViewController.swift
//  ToDoApp2
//
//  Created by West Kraemer on 7/10/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class ToDoListVC: UITableViewController {

    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make three new items
        let newItem0 = Item()
        newItem0.title = "Go running"
        itemArray.append(newItem0)
        
        let newItem1 = Item()
        newItem1.title = "Play soccer"
        itemArray.append(newItem1)
       
        let newItem2 = Item()
        newItem2.title = "lift weights"
        itemArray.append(newItem2)
        
    }
    
    //tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    //alert controller
    @IBAction func addButtonPressed(_ sender: Any) {
       var textField = UITextField()
        
        //create alert controller
        let alert = UIAlertController(title: "Add New To Do List Item", message: "", preferredStyle: .alert)
        
       //create action
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.tableView.reloadData()
        }
        
        //add a textfield to the alert controller
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new to do list item"
            textField = alertTextField

        }
      
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

