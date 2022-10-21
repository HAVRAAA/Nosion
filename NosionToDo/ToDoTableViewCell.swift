//
//  ToDoTableViewCell.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 18.10.2022.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        return label
    }()
    
    
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(nameLabel)
        self.addSubview(detailLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
