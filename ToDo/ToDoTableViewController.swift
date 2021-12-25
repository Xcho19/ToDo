//
//  ToDoTableViewController.swift
//  ToDo
//
//  Created by Xcho on 08.12.21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDos = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = ToDo.loadToDos() ?? ToDo.loadToDosSamples()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        cell.textLabel?.text = toDo.title
        
        return cell
    }
    
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue){
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! ToDoDetailTableViewController
        
        if let todo = sourceViewController.todo {
            if let indexOfExistingToDo = toDos.firstIndex(of: todo) {
                toDos[indexOfExistingToDo] = todo
                tableView.reloadRows(
                    at: [IndexPath(row: indexOfExistingToDo, section: 0)],
                    with: .automatic
                )
            } else {
                let newIndexPath = IndexPath(row: toDos.count, section: 0)
                toDos.append(todo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    @IBSegueAction func editToDo(_ coder: NSCoder, sender: Any?) -> ToDoDetailTableViewController? {
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell)
        else { return nil }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailController = ToDoDetailTableViewController(coder: coder)
        detailController?.todo = toDos[indexPath.row]
        
        return detailController
    }
}
