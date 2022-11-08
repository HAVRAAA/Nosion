//
//  GeneralListViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 25.10.2022.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    struct Constant {
        static let entity = "Task"
        static let sortTask = "task"
        static let sortDone = "done"
    }
    
    var identifier = "idCell"
    var listToDo: [String] = []
    
    // Створення контролера
    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.entity)
        let sortDescriptor = NSSortDescriptor(key: Constant.sortTask, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataManager.instatnce.context, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(cleaned), for: .touchUpInside)
        button.backgroundColor = UIColor.systemPink
        button.setTitle("C L E A N", for: .normal)
        button.tintColor = UIColor.black
        button.layer.zPosition = 2
        button.layer.cornerRadius = 20
        return button
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(doneTrans), for: .touchUpInside)
        button.backgroundColor = UIColor.systemPink
        button.setTitle("DONE", for: .normal)
        button.tintColor = UIColor.black
        button.layer.zPosition = 2
        button.layer.cornerRadius = 20
        return button
    }()
    
    let undoneButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(undoneTrans), for: .touchUpInside)
        button.backgroundColor = UIColor.systemPink
        button.setTitle("UNDONE", for: .normal)
        button.tintColor = UIColor.black
        button.layer.zPosition = 2
        button.layer.cornerRadius = 20
        return button
    }()
    
    let transitionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(transitionClicked), for: .touchUpInside)
        button.backgroundColor = UIColor.systemPink
        button.setTitle("TRANSITION", for: .normal)
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
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableSheet)
        view.addSubview(clearButton)
        view.addSubview(doneButton)
        view.addSubview(undoneButton)
        view.addSubview(transitionButton)
        
        // UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addedNewElement))
        // UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addSecondElement))
        
        // Navigation
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addedNewElement))
        
        self.title = "This is title"
        
        // For TableView
        self.tableSheet.delegate = self
        self.tableSheet.dataSource = self
        self.tableSheet.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        // Style ViewController
        view.backgroundColor = .systemRed
        
        // Helpful Function
        setupAnchors()
        fetchCoreData() // Показуємо дані з таблиці
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
            tableSheet.bottomAnchor.constraint(equalTo: margins.centerYAnchor, constant: 100),
            tableSheet.leftAnchor.constraint(equalTo: margins.leftAnchor),
            tableSheet.rightAnchor.constraint(equalTo: margins.rightAnchor),
            tableSheet.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            
            clearButton.topAnchor.constraint(equalTo: tableSheet.bottomAnchor, constant: 10),
            clearButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1/15),
            clearButton.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10),
            clearButton.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10),
            
            doneButton.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 20),
            doneButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            doneButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 1/4),
            doneButton.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10),
            
            undoneButton.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 20),
            undoneButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            undoneButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 1/4),
            undoneButton.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10),
            
            transitionButton.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: 20),
            transitionButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            transitionButton.rightAnchor.constraint(equalTo: undoneButton.leftAnchor, constant: -15),
            transitionButton.leftAnchor.constraint(equalTo: doneButton.rightAnchor, constant: 15)
        ])
    }
    
    @objc func addedNewElement() {
        let alertCont = UIAlertController(title: "New task", message: "Print a new task", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            let text = alertCont.textFields!.first!.text
            let managedObject = Task()
            
            if text!.count != 0 {
                managedObject.task = text
                CoreDataManager.instatnce.saveContext()
                self.fetchCoreData()
                self.tableSheet.reloadData()
            }
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
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.entity)
        do {
            let results = try CoreDataManager.instatnce.context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                CoreDataManager.instatnce.context.delete(result)
            }
        } catch {
            print(error)
        }
        CoreDataManager.instatnce.saveContext()
        self.fetchCoreData()
        self.tableSheet.reloadData()
    }
    
    @objc func doneTrans() {
        
    }
    
    @objc func undoneTrans() {
        
    }
    
    @objc func transitionClicked() {
        let destination = ChangesViewController()
        destination.transTwoV = listToDo
        navigationController?.pushViewController(destination, animated: true)
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
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let taskInCell = fetchResultController.object(at: indexPath) as! Task
        cell.textLabel!.text = taskInCell.task
        // cell.textLabel!.text = self.listToDo[indexPath.row]
        if taskInCell.done {
            cell.backgroundColor = .systemGreen
        } else {
            cell.backgroundColor = .red
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let taskInCell = fetchResultController.object(at: indexPath) as! Task
        taskInCell.done = !taskInCell.done
        CoreDataManager.instatnce.saveContext()
        self.fetchCoreData()
        self.tableSheet.reloadData()
    }
}
