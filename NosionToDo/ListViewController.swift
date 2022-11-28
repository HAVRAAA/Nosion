//
//  GeneralListViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 25.10.2022.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var identifier = "idCell"
    var idSegue = 0
    var nameUser = ""
    var user: User?
    
    
    init(user: User) {
        self.user = user
        self.nameUser = "\(user.name!)..."
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    // Create controller
    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.entityTask)
        let sortDescriptor = NSSortDescriptor(key: Constant.sortTitle, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                 managedObjectContext: CoreDataManager.shared.context,
                                                                 sectionNameKeyPath: nil,
                                                                 cacheName: nil)
        return fetchedResultController
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.white
        label.tintColor = UIColor.black
        label.numberOfLines = 0
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 2
        label.layer.zPosition = 4
        label.text = "Hello, world"
        label.textAlignment = .center
        label.clipsToBounds = true
        
        
        return label
    }()

    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(cleaned), for: .touchUpInside)
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 2
        button.setTitle("C L E A N", for: .normal)
        button.tintColor = UIColor.black
        button.layer.zPosition = 2
        button.layer.cornerRadius = 20
        button.isHidden = true
        return button
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(doneTrans), for: .touchUpInside)
        button.backgroundColor = UIColor.clear
        button.setImage(UIImage(named: "taskFull.png"), for: .normal)
        button.contentMode = .scaleToFill
        button.tintColor = UIColor.black
        button.layer.zPosition = 2
        button.layer.cornerRadius = 20
        return button
    }()
    
    let undoneButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(undoneTrans), for: .touchUpInside)
        button.backgroundColor = UIColor.clear
        button.setImage(UIImage(named: "taskEmpty.png"), for: .normal)
        button.contentMode = .scaleToFill
        button.tintColor = UIColor.black
        button.layer.zPosition = 2
        button.layer.cornerRadius = 20
        return button
    }()
    
    let transitionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(transitionClicked), for: .touchUpInside)
        button.backgroundColor = UIColor.clear
        button.setImage(UIImage(named: "arrow.png"), for: .normal)
        button.tintColor = UIColor.black
        button.layer.zPosition = 2
        button.layer.cornerRadius = 20
        return button
    }()
    
    var tableSheet: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.layer.cornerRadius = 20
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.borderWidth = 2
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableSheet)
        view.addSubview(clearButton)
        view.addSubview(welcomeLabel)
        view.backgroundColor = .gray
        // UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addedNewElement))
        // UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addSecondElement))
        
        // Navigation
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addedNewElement))
        
        // For TableView
        tableSheet.delegate = self
        tableSheet.dataSource = self
        tableSheet.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        // Style ViewController
        view.backgroundColor = .white
        
        // Helpful Function
        greetingMessage()
        setupAnchors()
        fetchCoreData() // Показуємо дані з таблиці
        addedImageToNavBar()
    }
    func greetingMessage() {
        if !nameUser.isEmpty {
            welcomeLabel.text = "Hello, \(nameUser)."
        } else {
            welcomeLabel.text = "Hello, world"
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            self.welcomeLabel.isHidden = true
        })
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
    
    func fetchCoreData() {
        do {
            try fetchResultController.performFetch()
        } catch {
            print(error)
        }
    }
    
    func setupAnchors() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            tableSheet.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10),
            tableSheet.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10),
            tableSheet.leftAnchor.constraint(equalTo: margins.leftAnchor),
            tableSheet.rightAnchor.constraint(equalTo: margins.rightAnchor),
            tableSheet.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            
            clearButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20),
            clearButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/15),
            clearButton.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10),
            clearButton.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10),
            
            welcomeLabel.topAnchor.constraint(equalTo: tableSheet.topAnchor, constant: 100),
            welcomeLabel.rightAnchor.constraint(equalTo: tableSheet.rightAnchor, constant: -20),
            welcomeLabel.leftAnchor.constraint(equalTo: tableSheet.leftAnchor, constant: 20),
            welcomeLabel.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1.5/10)
            
//            doneButton.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 20),
//            doneButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
//            doneButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 1/4),
//            doneButton.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10),
//
//            undoneButton.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 20),
//            undoneButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
//            undoneButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 1/4),
//            undoneButton.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10),
//
//            transitionButton.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 20),
//            transitionButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
//            transitionButton.rightAnchor.constraint(equalTo: undoneButton.leftAnchor, constant: -15),
//            transitionButton.leftAnchor.constraint(equalTo: doneButton.rightAnchor, constant: 15)
        ])
    }
    
    @objc func addedNewElement() {
//      let loginVC = LoginViewController()
        
        let alertCont = UIAlertController(title: "New task", message: "Print a new task", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "Ok", style: .default) { [self] (action) in
            let text = alertCont.textFields!.first!.text!
            let user = user
                if text.count != 0 {
                    let newTask = Task()
                    newTask.title = text
                    newTask.status = false
                    user?.addToTask(newTask)
                    CoreDataManager.shared.saveContext()
                    self.fetchCoreData()
                    self.tableSheet.reloadData()
                }
                // new changes
//              print(loginVC.newUser.task!)
//              managedObject.task = text
//              loginVC.newUser.addToTask(managedObject)
//                CoreDataManager.shared.saveContext()
//                self?.fetchCoreData()
//                self?.tableSheet.reloadData()
        }
        
        let secondAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertCont.addAction(firstAction)
        alertCont.addAction(secondAction)
        alertCont.addTextField(configurationHandler: nil)
        self.present(alertCont, animated: true, completion: nil)
    }
    
    @objc func addSecondElement() {
        
    }
    
    @objc func cleaned() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.entityTask)
        do {
            let results = try CoreDataManager.shared.context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                CoreDataManager.shared.context.delete(result)
            }
        } catch {
            print(error)
        }
        CoreDataManager.shared.saveContext()
        fetchCoreData()
        tableSheet.reloadData()
        clearButton.isHidden = true
    }
    
    @objc func doneTrans() {
        idSegue = 2
    }
    
    @objc func undoneTrans() {
        idSegue = 1
    }
    
    @objc func transitionClicked() {
    }
    
    // Alert
//    func alertNewTask(title: String, message:String, style: UIAlertController.Style) {
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
//        let actionFirst = UIAlertAction(title: "Ok", style: .default) { (action) in
//            let text = alertController.textFields?.first?.text
//        }
//        let secondAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        alertController.addTextField { (textField) in
//        }
//
//        alertController.addAction(actionFirst)
//        alertController.addAction(secondAction)
//        self.present(alertController, animated: true, completion: nil)
//    }
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchResultController.sections {
            if sections[section].numberOfObjects > 0 {
                clearButton.isHidden = false
            } else {
                clearButton.isHidden = true
            }
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let taskInCell = fetchResultController.object(at: indexPath) as! Task
        cell.textLabel!.text = taskInCell.title!
        // cell.textLabel!.text = self.listToDo[indexPath.row]
        if taskInCell.status {
            cell.backgroundColor = .systemGreen
        } else {
            cell.backgroundColor = .red
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskInCell = fetchResultController.object(at: indexPath) as! Task
        taskInCell.status = !taskInCell.status
        CoreDataManager.shared.saveContext()
        fetchCoreData()
        tableSheet.reloadData()
    }
}
