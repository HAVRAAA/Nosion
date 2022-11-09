//
//  ChangesViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 25.10.2022.
//

import UIKit

class ChangesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listOfTodo: [String] = []
    
    /* let segment: UISegmentedControl = {
        let array = ["Done", "Undone"]
        let segment = UISegmentedControl(items: array)
        segment.backgroundColor = UIColor.white
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.addTarget(self, action: #selector(selectorFunc), for: .valueChanged)
        return segment
    }()
    */
    
    let label: UILabel = {
        let label = UILabel()
        label.tintColor = .black
        label.backgroundColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = 4
        return label
    }()
    
    var doneSheet: UITableView = {
        let table = UITableView()
        table.layer.cornerRadius = 20;
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemGreen
        return table
    }()
    
    var undoneSheet: UITableView = {
        let table = UITableView()
        table.layer.cornerRadius = 20;
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemRed
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(doneSheet)
        view.addSubview(undoneSheet)
        
        label.text = listOfTodo.first
        print(listOfTodo)
        
        view.backgroundColor = UIColor.white
        
        undoneSheet.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.idCellUndone)
        undoneSheet.dataSource = self
        undoneSheet.delegate = self
        
        doneSheet.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.doneIdentifier)
        doneSheet.dataSource = self
        doneSheet.delegate = self
        setupAnchors()
    }
 
    func setupAnchors() {
        NSLayoutConstraint.activate([
            doneSheet.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            doneSheet.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            doneSheet.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2),
            doneSheet.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            doneSheet.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
          
            undoneSheet.topAnchor.constraint(equalTo: doneSheet.bottomAnchor, constant: 5),
            undoneSheet.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            undoneSheet.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            undoneSheet.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            undoneSheet.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
        /*
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            label.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 100),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
        
            segment.topAnchor.constraint(equalTo: doneSheet.bottomAnchor, constant: 10),
            segment.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            segment.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            segment.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10)
          */
        ])
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("200")
        if tableView == doneSheet {
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.doneIdentifier, for: indexPath);
            cell.backgroundColor = UIColor.systemGreen
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.idCellUndone, for: indexPath);
            cell.backgroundColor = UIColor.systemRed
            cell.textLabel!.text = listOfTodo.first
            return cell
        }
    }
}
