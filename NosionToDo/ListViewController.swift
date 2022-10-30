//
//  GeneralListViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 25.10.2022.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var identifier = "idCell"
    var transOne = "Maks, everything is working normally"
    var listToDo = ["Buy a fish", "Buy a bread", "Buy a unicorn"]
    
    
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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addedNewElement))
        // self.navigationController!.navigationBar.barTintColor = UIColor.red
        self.title = "This is title"
        self.tableSheet.delegate = self
        self.tableSheet.dataSource = self
        self.tableSheet.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        view.backgroundColor = .systemRed
        setupAnchors()
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
    
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.alertNewTask(title: "New task", message: "Type new task", style: .alert)
            self.tableSheet.reloadData()
        })
        
        
        
        
        
        
        
        
        
        
        
    }
    
    @objc func addSecondElement() {
        print("Second ")
    }
    
    @objc func cleaned() {
        listToDo = []
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
    func alertNewTask(title: String, message:String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionFirst = UIAlertAction(title: "ok", style: .default) { (action) in
            let text = alertController.textFields?.first?.text
            self.listToDo.append(text!)
            self.tableSheet.reloadData()
        }
        
        alertController.addTextField { (textField) in
            
        }
        
        alertController.addAction(actionFirst)
        self.present(alertController, animated: true, completion: nil)
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listToDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel!.text = self.listToDo[indexPath.row]
        cell.backgroundColor = UIColor.systemGreen
        return cell
    }
}
