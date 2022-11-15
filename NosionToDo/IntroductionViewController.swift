//
//  ViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 17.10.2022.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(startClicked), for: .touchUpInside)
        button.setImage(UIImage(named: "taskEmpty"), for: .normal)
        button.setImage(UIImage(named: "taskFull"), for: .highlighted)
        button.backgroundColor = .clear
        button.tintColor = .black
        button.contentMode = .scaleToFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let logotypeNosion: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "NosionLogo")
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let logotypeToDo: UILabel = {
        let logotype = UILabel()
        logotype.text = "Tasks in your life"
        logotype.textColor = .black
        logotype.textAlignment = .center
        logotype.numberOfLines = 1
        logotype.translatesAutoresizingMaskIntoConstraints = false
        return logotype
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(startButton)
        view.addSubview(logotypeNosion)
        view.addSubview(logotypeToDo)
        view.backgroundColor = .white
        setupConstraint()
    }

    func setupConstraint() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -50),
            startButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 2/3),
            startButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/3),
            startButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            
            logotypeNosion.bottomAnchor.constraint(equalTo: logotypeToDo.topAnchor, constant: 10),
            logotypeNosion.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 2/3),
            logotypeNosion.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/10),
            logotypeNosion.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            
            logotypeToDo.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/10),
            logotypeToDo.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 2/3),
            logotypeToDo.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            logotypeToDo.centerYAnchor.constraint(equalTo: margins.centerYAnchor)
            
        ])
    }
    
    @objc func startClicked() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
 
/*
 @objc func buttonClicked() -> () {
     self.alert(title: "Print your name", message: "What is your name?", style: .alert)
 }
 
 func alert(title: String, message:String, style: UIAlertController.Style) {
     let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
     let actionFirst = UIAlertAction(title: "ok", style: .default) { (action) in
         let text = alertController.textFields?.first?.text
         self.logotype.text! = "Hello, \(text!)"
         
         let secondViewController = LoginViewController();
         self.navigationController?.pushViewController(secondViewController, animated: true)
     }
     alertController.addTextField { (textField) in
         
     }
     alertController.addAction(actionFirst)
     self.present(alertController, animated: true, completion: nil)
 */
