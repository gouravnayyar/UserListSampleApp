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
    let dispatchGroup = DispatchGroup()

    func firstCall(_ decoder: JSONDecoder, with urlString: String) {
        dispatchGroup.enter()
        decoder.decode([User].self, fromURL: urlString) { users in
            print("Call 1")
            self.users.append(contentsOf: users)
            self.dispatchGroup.leave()
        }
    }

    func secondCall(_ decoder: JSONDecoder, with urlString: String) {
        dispatchGroup.enter()
        decoder.decode([User].self, fromURL: urlString) { users in
            print("Call 2")
            self.users.append(contentsOf: users)
            self.dispatchGroup.leave()
        }
    }

    func thirdCall(_ decoder: JSONDecoder, with urlString: String) {
        dispatchGroup.enter()
        decoder.decode([User].self, fromURL: urlString) { users in
            print("Call 3")
            self.users.append(contentsOf: users)
            self.dispatchGroup.leave()
        }
    }


    func fetch(_ urlString: String) {

        let decoder = JSONDecoder()
        firstCall(decoder, with: urlString)
        secondCall(decoder, with: urlString)
        thirdCall(decoder, with: urlString)
        dispatchGroup.notify(queue: .main) {
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
