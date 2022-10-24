//
//  ToDoTableViewController.swift
//  NosionToDo
//
//  Created by Максим Гаврилюк on 17.10.2022.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDoArray:[String] = ["Maks"];
    let idCell = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tableView.register(TableViewCell.self, forCellReuseIdentifier: idCell)
    }
    // MARK: - TableViewDataSource
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
        
        cell.textLabel?.text = "Maks"
        
        return cell
    }
    
}
