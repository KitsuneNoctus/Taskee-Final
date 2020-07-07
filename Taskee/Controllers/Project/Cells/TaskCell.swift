//
//  TaskCell.swift
//  Taskee
//
//  Created by Henry Calderon on 7/6/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var colorTag: UIImageView!
    @IBOutlet weak var projectTitleLabel: UILabel!
    @IBOutlet weak var pendingTasksLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
