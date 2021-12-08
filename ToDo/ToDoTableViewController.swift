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
        
        if let savedToDos = ToDo.loadToDos() {
            toDos = savedToDos
        } else {
            toDos = ToDo.loadToDosSamples()
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        cell.textLabel?.text = toDo.title

        return cell
    }
}
