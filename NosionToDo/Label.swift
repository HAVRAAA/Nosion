//
//  File.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 22.11.2022.
//

import Foundation
import UIKit



class CustomLabels: UILabel {
    let sloganLabel: UILabel = {
        let logotype = UILabel()
        logotype.text = "Tasks in your life"
        logotype.textColor = .black
        logotype.textAlignment = .center
        logotype.backgroundColor = .clear
        logotype.numberOfLines = 0
        logotype.translatesAutoresizingMaskIntoConstraints = false
        return logotype
    }()
}
