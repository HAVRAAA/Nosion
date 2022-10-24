//
//  ViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 17.10.2022.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    
    var displaySecondButton = UIButton()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        button.setTitle(String("Start"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let logotype: UILabel = {
        let logotype = UILabel()
        logotype.text = "Logo"
        logotype.textColor = .black
        logotype.textAlignment = .center
        logotype.numberOfLines = 0
        logotype.translatesAutoresizingMaskIntoConstraints = false
        return logotype
    }()

    let helpText: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.textAlignment = .center
        text.text = "Press \"Start\" for continue"
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        view.addSubview(startButton)
        view.addSubview(logotype)
        view.addSubview(helpText)
        view.backgroundColor = .systemPink
        setupConstraint()
        
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 5/6),
            startButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10),
            
            logotype.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            logotype.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logotype.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 5/6),
            logotype.bottomAnchor.constraint(equalTo: startButton.topAnchor),
            
            helpText.topAnchor.constraint(equalTo: startButton.bottomAnchor),
            helpText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helpText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/7),
            helpText.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
    
    @objc func buttonClicked() -> () {
        self.alert(title: "Your name", message: "What is your name", style: .alert)
        
        
        
    }
    
    //2
    
    func alert(title: String, message:String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionFirst = UIAlertAction(title: "ok", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.logotype.text! = "Hello"
            
            let secondViewController = LoginViewController();
            self.navigationController?.pushViewController(secondViewController, animated: true)
        
        }
        
        
        
        alertController.addTextField { (textField) in
            
        }
        alertController.addAction(actionFirst)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
 
