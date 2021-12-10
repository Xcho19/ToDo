//
//  ToDo.swift
//  ToDo
//
//  Created by Xcho on 08.12.21.
//

import Foundation

struct ToDo: Equatable {
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool{
        return lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
      return nil
    }
    
    static func loadToDosSamples() -> [ToDo] {
        let toDo1 = ToDo(title: "Do Dishes", isComplete: false, dueDate: Date())
        let toDo2 = ToDo(title: "Homework", isComplete: false, dueDate: Date())
        let toDo3 = ToDo(title: "Buy groceries", isComplete: false, dueDate: Date())
        
        return [toDo1, toDo2, toDo3]
    }
}
