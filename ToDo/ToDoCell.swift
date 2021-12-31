//
//  ToDoCell.swift
//  ToDo
//
//  Created by Xcho on 31.12.21.
//

import UIKit

protocol ToDoCellDelegate: AnyObject {
    func checkmarkTapped(sender:ToDoCell)
}

class ToDoCell: UITableViewCell {
    
    weak var delegate: ToDoCellDelegate?

    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
}
