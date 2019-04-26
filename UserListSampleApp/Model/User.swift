//
//  User.swift
//  UserListSampleApp
//
//  Created by Gourav Nayyar on 24/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import Foundation

struct User: Codable {

    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let company: [String: String]
}
