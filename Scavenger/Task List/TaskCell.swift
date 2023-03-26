//
//  TaskCell.swift
//  Scavenger
//
//  Created by Victoria Nunez on 3/25/23.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var completedImageView: UIImageView!
    
    
    func configure(with task: Task) {
        titleLabel.text = task.title
        titleLabel.textColor = task.isComplete ? .secondaryLabel : .label
        completedImageView.image = UIImage(systemName: task.isComplete ? "circle.inset.filled" : "circle")?.withRenderingMode(.alwaysTemplate)
        completedImageView.tintColor = task.isComplete ? .systemBlue : .tertiaryLabel
    }

}
