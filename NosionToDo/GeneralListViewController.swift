//
//  GeneralListViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 25.10.2022.
//

import UIKit

class GeneralListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var identifier = "idCell"
    var transOne = "Maks, everything is working normally"
    var listToDo = ["Buy a fish", "Buy a bread", "Buy a unicorn"]
    
    let addButtonNav = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addedNewElement))
    let clearButtonNav = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addSecondElement))
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(cleaned), for: .touchUpInside)
        button.backgroundColor = UIColor.systemPink
        button.setTitle("This is button", for: .normal)
        button.layer.zPosition = 2
        button.layer.cornerRadius = 25
        return button
    }()
    
    var tableSheet: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableSheet)
        view.addSubview(clearButton)
        
        self.navigationItem.rightBarButtonItem = addButtonNav
        self.navigationController!.navigationBar.barTintColor = UIColor.red
        self.title = "This is title"
        self.tableSheet.delegate = self
        self.tableSheet.dataSource = self
        self.tableSheet.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        view.backgroundColor = .systemRed
        setupAnchors()
    }
    
    func setupAnchors() {
        NSLayoutConstraint.activate([
            tableSheet.topAnchor.constraint(equalTo: view.topAnchor),
            tableSheet.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableSheet.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableSheet.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableSheet.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            clearButton.topAnchor.constraint(equalTo: tableSheet.bottomAnchor),
            clearButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10),
            clearButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            clearButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            clearButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
        ])
    }
    
    @objc func addedNewElement() {
        print("Everything is working good")
    }
    
    @objc func addSecondElement() {
        print("Second ")
    }
    
    @objc func cleaned() {
        let dest = ChangesViewController(nibName:"ChangesViewController", bundle: nil)
        dest.transTwoV = transOne
        navigationController?.pushViewController(ChangesViewController(), animated: true)
    }
    
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
