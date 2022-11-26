//
//  LoginViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 17.10.2022.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    let newUser = User()
    
    var usersArray: [String] = []
        
    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.entityTask)
        let sortDescriptor = NSSortDescriptor(key: Constant.sortTask, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                 managedObjectContext: CoreDataManager.shared.context,
                                                                 sectionNameKeyPath: nil,
                                                                 cacheName: nil)
        return fetchedResultController
    }()
    
    let sloganNosionLabel = CustomLabels().sloganLabel
    let transitionButton = CustomButtons().segueButton
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        transitionButton.addTarget(self, action: #selector(segueButtonAction), for: .touchUpInside)
        
        addedImageToNavBar()
        
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(transitionButton)
        view.addSubview(sloganNosionLabel)
        
        setupConstraint()
        addedImageToNavBar()
    }
    
    func fetchCoreData() {
        do {
            try fetchResultController.performFetch()
        } catch {
            print(error)
        }
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
            
            transitionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transitionButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -25),
            transitionButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            transitionButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/7),
            
            sloganNosionLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 50),
            sloganNosionLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            sloganNosionLabel.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/10),
            sloganNosionLabel.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 9/10),
        ])
    }
    
    @objc func segueButtonAction() {
        let thirdViewController = ListViewController();
        thirdViewController.nameUser = nameTextField.text!
        self.navigationController?.pushViewController(thirdViewController, animated: true)
        
        // ADDED SECOND ENTITY
//        let fetchRequestUser = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.entityUser)
//        do {
//            let results = try CoreDataManager.shared.context.fetch(fetchRequestUser)
//            for result in results as! [User] {
//                print("name: \(result.name!) and he has a password: \(result.password!)")
//                CoreDataManager.shared.saveContext()
//            }
//
//        } catch {
//            print(error)
//        }
//
//        let newUser = User()
//
//        newUser.name = nameTextField.text
//        newUser.password = passwordTextField.text
//
//        CoreDataManager.shared.saveContext()
//        let newUserNameTest = newUser.name
//        let newUserPassTest = newUser.password
//        print("\(newUserNameTest!) and he has a password: \(newUserPassTest!)")
//
//
//
//        self.navigationController?.pushViewController(thirdViewController, animated: true)
//        CoreDataManager.shared.saveContext()
        
        
    }
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
