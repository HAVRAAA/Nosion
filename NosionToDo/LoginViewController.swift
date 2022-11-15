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
        logotype.text = "Tasks in your life"
        logotype.textColor = .black
        logotype.textAlignment = .center
        logotype.backgroundColor = .clear
        logotype.numberOfLines = 0
        logotype.translatesAutoresizingMaskIntoConstraints = false
        return logotype
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Press your name"
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.textAlignment = .center
        textField.borderStyle = .line
        textField.clipsToBounds = true
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 20
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Press your password"
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.textAlignment = .center
        textField.layer.cornerRadius = 20
        textField.borderStyle = .line
        textField.clipsToBounds = true
        textField.layer.borderWidth = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(segueButton), for: .touchUpInside)
        button.setImage(UIImage(named: "taskEmpty"), for: .normal)
        button.setImage(UIImage(named: "taskFull"), for: .highlighted)
        button.backgroundColor = .clear
        button.tintColor = .black
        button.contentMode = .scaleToFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addedImageToNavBar()
        
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(startButton)
        view.addSubview(logotypeNosion)
        
        setupConstraint()
    }
    
    func addedImageToNavBar() {
        if let navController = navigationController {
            let imageLogo = UIImage(named: "NosionLogo.png")
            let widthNavBar = navController.navigationBar.frame.width
            let heightNavBar = navController.navigationBar.frame.height
            let widthForView = widthNavBar * 0.4
            let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: widthForView, height: heightNavBar))
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: widthForView, height: heightNavBar))
                                       
            imageView.image = imageLogo
            imageView.contentMode = .scaleAspectFit
            logoContainer.addSubview(imageView)
            
            navigationItem.titleView = logoContainer
        }
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
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -25),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            startButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/7),
            
            logotypeNosion.topAnchor.constraint(equalTo: margins.topAnchor, constant: 50),
            logotypeNosion.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            logotypeNosion.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/10),
            logotypeNosion.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 9/10),
        ])
    }
    
    @objc func segueButton() {
        let thirdViewController = ListViewController();
        thirdViewController.nameUser = nameTextField.text!
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
}
