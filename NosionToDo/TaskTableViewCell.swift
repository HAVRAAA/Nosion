//
//  TaskTableViewCell.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 19.11.2022.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    
    static let cellIdentifier = "TaskTableViewCell"
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    }
    
    /*
    func setupConstraint() {
        let margins = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            taskLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/2),
            taskLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 10),
            
            statusImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            statusImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            statusImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/4),
            statusImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: -10),
        ])
    }
    */
    
    
    func configuration() {
        //
    }
    

}
