//
//  AddViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 02.11.2022.
//

import UIKit

class AddViewController: UIViewController {

    let textFieldName: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Task"
        textField.backgroundColor = .clear
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let textFieldAge: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Age"
        textField.backgroundColor = .clear
        textField.tintColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let buttonAdd: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ADD", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .systemGreen
        button.addTarget(nil, action: #selector(buttonClicked), for: .touchUpInside)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textFieldName)
        view.addSubview(buttonAdd)
        setupAnchors()
    }
    
    func setupAnchors() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            textFieldName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textFieldName.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10),
            textFieldName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
           /*
            textFieldName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldName.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10),
            textFieldName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            textFieldName.bottomAnchor.constraint(equalTo: textFieldAge.topAnchor, constant: 20)
        */
            buttonAdd.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            buttonAdd.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -50),
            buttonAdd.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/10),
            buttonAdd.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 2.5/4),
        ])
    }
    
    @objc func buttonClicked() {
        let newTask = textFieldName.text
        let destination = ListViewController()
        destination.listToDo.append(newTask!)
        destination.tableSheet.reloadData()
    }

}
