//
//  UsersViewModelTests.swift
//  UserListSampleAppTests
//
//  Created by Gourav Nayyar on 26/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import XCTest
@testable import UserListSampleApp

class UsersViewModelTests: XCTestCase {


    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testUsersCount() {
        let expectation = XCTestExpectation(description: "Verify count")
        let usersViewModel = MockUsersViewModel()
        usersViewModel.fetch("www.test.com") { users, error in
            XCTAssertTrue(users.count == 10)
            expectation.fulfill()
        }

        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 2.0)
    }
    
}

class MockUsersViewModel: UsersViewModel {

    override func fetch(_ urlString: String, completion: @escaping ([User], Error?) -> Void) {

        let users: [User] = []
        let json = TestUtil.sampleUserJson()
        let data = jsonToData(json: json)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            let response = try decoder.decode([User].self, from: data!)
            completion(response, nil)
        } catch {
            completion(users,error)
        }
    }

    func jsonToData(json: Any) -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }

}
