//
//  UserDataSource.swift
//  UserListSampleApp
//
//  Created by Gourav Nayyar on 25/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import Foundation

class UserDataSource: NSObject {

    var users = [User]()
    var dataChanged:(()-> Void)?


    func fetch(_ urlString: String) {
        let decoder = JSONDecoder()
        decoder.decode([User].self, fromURL: urlString) { users in
            self.users = users
            self.dataChanged?()
        }
    }


}
