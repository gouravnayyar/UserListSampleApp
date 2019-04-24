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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadData()
    }

    func loadData() {
        let decoder = JSONDecoder()
        decoder.decode([User].self, fromURL: "https://jsonplaceholder.typicode.com/users") { [weak self] (users) in
            self?.users = users
            self?.tableView.reloadData()
        }
    }

}

extension ViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let user = self.users[indexPath.row]
        cell.textLabel?.text = user.username
        cell.detailTextLabel?.text = user.email

        return cell
    }
}
