//
//  Buttons.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 21.11.2022.
//

import Foundation
import UIKit




class CustomButtons {
    
    
    let segueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "taskEmpty"), for: .normal)
        button.setImage(UIImage(named: "taskFull"), for: .highlighted)
        button.backgroundColor = .clear
        button.tintColor = .black
        button.contentMode = .scaleToFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    
    
    
}
