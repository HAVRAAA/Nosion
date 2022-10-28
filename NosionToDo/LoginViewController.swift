//
//  LoginViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 17.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "What is your job?"
        textField.backgroundColor = .systemGreen
        textField.textColor = .black
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let segueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.systemGreen
        button.addTarget(nil, action: #selector(segueButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.setTitle("Enter to List", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(nameTextField)
        view.addSubview(segueButton)
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            nameTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10),
        
            segueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segueButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 100),
            segueButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            segueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10)
        ])
    }
    
    @objc func segueButtonAction() {
        let thirdViewController = GeneralListViewController();
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
}
