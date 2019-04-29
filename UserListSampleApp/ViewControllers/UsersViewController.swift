//
//  ViewController.swift
//  UserListSampleApp
//
//  Created by Gourav Nayyar on 24/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import UIKit

class UsersViewController: UITableViewController {

    var userViewModel: UsersListDetails?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard  let userViewModel = userViewModel else { return }
        userViewModel.fetch("https://jsonplaceholder.typicode.com/users") {_,error in
            if error == nil {
                self.tableView.reloadData()
            }
        }
    }
}

extension UsersViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let userCount = self.userViewModel?.users.count else { return 0 }
        return userCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        guard let vm = userViewModel else { return cell }
        let user = vm.users[indexPath.row]
        cell.textLabel?.text = user.username
        cell.detailTextLabel?.text = user.email
        return cell
    }
}
