//
//  UserDataSource.swift
//  UserListSampleApp
//
//  Created by Gourav Nayyar on 25/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import UIKit

class UserDataSource: NSObject, UITableViewDataSource {

    var users = [User]()
    var dataChanged:(()-> Void)?

    func fetch(_ urlString: String) {

        let decoder = JSONDecoder()

        // Creating async calls

        decoder.decode([User].self, fromURL: urlString) { users in
            print("Result 1")
            self.users = users
            self.dataChanged?()
        }
        decoder.decode([User].self, fromURL: urlString) { users in
            print("Result 2")
            self.users.append(contentsOf: users)
            self.dataChanged?()
        }
        decoder.decode([User].self, fromURL: urlString) { users in
            print("Result 3")
            self.users.append(contentsOf: users)
            self.dataChanged?()
        }

        decoder.decode([User].self, fromURL: urlString) { users in
            print("Result 4")
            self.users.append(contentsOf: users)
            self.dataChanged?()
        }

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let user = self.users[indexPath.row]
        cell.textLabel?.text = user.username
        cell.detailTextLabel?.text = user.email

        return cell
    }

}
