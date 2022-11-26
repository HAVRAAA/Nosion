//
//  ViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 17.10.2022.
//

import UIKit

class IntroductionViewController: UIViewController {

    let logotypeToDo = CustomLabels().sloganLabel
    let transitionButton = CustomButtons().segueButton
    
    let logotypeNosion: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "NosionLogo")
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        transitionButton.addTarget(self, action: #selector(segueButton), for: .touchUpInside)
        transitionButton.frame = CGRect(x: 0, y: 0, width: 30, height: 50)
        
        view.addSubview(logotypeToDo)
        view.addSubview(logotypeNosion)
        view.addSubview(transitionButton)
        view.backgroundColor = .white
        setupConstraint()
        startAnimate()
        
        
        
        
    }
    
    func startAnimate() {
        UIView.animate(withDuration: 3, delay: 0) { [self] in
            
            transitionButton.layoutIfNeeded()
            logotypeToDo.layoutIfNeeded()
            logotypeNosion.layoutIfNeeded()
            

        } completion: { action in
            print("animation finished")
        }
    }

    func setupConstraint() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            
            transitionButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -50),
            transitionButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 2/3),
            transitionButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/3),
            transitionButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            
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
    
    @objc func segueButton() {
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
