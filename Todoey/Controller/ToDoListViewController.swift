//
//  ViewController.swift
//  Todoey
//
//  Created by Guillaume Ramey on 28/12/2018.
//  Copyright © 2018 Guillaume Ramey. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    override func viewDidLoad() {
        super.viewDidLoad()

        loadItems()
    }

    // MARK: - Datasource methods
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

    // MARK: - Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        itemArray[indexPath.row].done.toggle()
        saveItems()
    }

    // MARK: - Actions
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let actionAdd = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.itemArray.append(Item(textField.text!))
            self.saveItems()
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter new item"
            textField = alertTextField
        }
        alert.addAction(actionAdd)
        alert.addAction(actionCancel)

        present(alert, animated: true, completion: nil)
    }

    func saveItems() {
        let encoder = PropertyListEncoder()

        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }

        tableView.reloadData()
    }

    func loadItems() {
        let decoder = PropertyListDecoder()

        do {
            let data = try Data(contentsOf: dataFilePath!)
            itemArray = try decoder.decode([Item].self, from: data)
        } catch {
            print("Error loding item array, \(error)")
        }

        tableView.reloadData()
    }
}

