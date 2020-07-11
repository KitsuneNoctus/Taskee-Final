//
//  TasksCell.swift
//  Taskee
//
//  Created by Henry Calderon on 7/6/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class TasksCell: UITableViewCell {
    static var identifier = "TasksCell"
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let check = CheckBox.init()
//        check.frame = CGRect(x: 25, y: 25, width: 35, height: 35)
//        check.style = .tick
//        check.borderStyle = .roundedSquare(radius: 8)
//        check.addTarget(self, action: #selector(todoChecked(_:)), for: .valueChanged)
//        self.contentView.addSubview(check)
        
        self.contentView.addSubview(taskLabel)
//        self.addSubview(taskLabel)
        NSLayoutConstraint.activate([
//            taskLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            taskLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            taskLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
        
//        NSLayoutConstraint.activate([
//            check.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
//            taskLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
//            check.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
//            taskLabel.leadingAnchor.constraint(equalTo: check.trailingAnchor, constant: 20)
//        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func todoChecked(_ sender: CheckBox) {
        print(sender.isChecked)
    }
    
}
