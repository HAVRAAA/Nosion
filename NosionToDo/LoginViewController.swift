//
//  LoginViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 17.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let logotypeNosion: UILabel = {
        let logotype = UILabel()
        logotype.text = "LogoThis"
        logotype.textColor = .black
        logotype.textAlignment = .center
        logotype.backgroundColor = .orange
        logotype.numberOfLines = 0
        logotype.translatesAutoresizingMaskIntoConstraints = false
        return logotype
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Press your name"
        textField.backgroundColor = .systemGreen
        textField.textColor = .black
        textField.textAlignment = .center
        textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Press your password"
        textField.backgroundColor = .systemGreen
        textField.textColor = .black
        textField.textAlignment = .center
        textField.layer.cornerRadius = 20
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
        view.addSubview(passwordTextField)
        view.addSubview(segueButton)
        view.addSubview(logotypeNosion)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            nameTextField.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            nameTextField.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 2/3),
            nameTextField.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/10),
        
            passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 2/3),
            passwordTextField.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/10),
            
            segueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segueButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -25),
            segueButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            segueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10),
            
            logotypeNosion.topAnchor.constraint(equalTo: margins.topAnchor, constant: 50),
            logotypeNosion.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            logotypeNosion.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/10),
            logotypeNosion.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 9/10)
            
        ])
    }
    
    @objc func segueButtonAction() {
        let thirdViewController = ListViewController();
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
}
