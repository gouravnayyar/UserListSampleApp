//
//  TestUtil.swift
//  UserListSampleAppTests
//
//  Created by Gourav Nayyar on 26/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import Foundation

class TestUtil {

    static func sampleUserJson() -> [[String: Any]] {
        let users: [[String: Any]] = []

        if let path = Bundle(for: type(of: TestUtil())).url(forResource: "users_sample", withExtension:
            "json") {
            do {
                let data = try Data(contentsOf: path)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [[String: Any]] {
                    return dictionary
                }
            } catch {

            }
        }
        return users
    }
}
