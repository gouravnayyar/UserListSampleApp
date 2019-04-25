//
//  ViewController.swift
//  UserListSampleApp
//
//  Created by Gourav Nayyar on 24/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var users:[User] = []
    let dataSource = UserDataSource()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadData()
    }

    func loadData() {
        dataSource.dataChanged = { [weak self] in
            self?.tableView.reloadData()
        }

        dataSource.fetch("https://jsonplaceholder.typicode.com/users")
        tableView.dataSource = dataSource
    }
}
