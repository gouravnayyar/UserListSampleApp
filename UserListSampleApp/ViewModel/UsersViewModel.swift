//
//  UsersViewModel.swift
//  UserListSampleApp
//
//  Created by Gourav Nayyar on 26/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import Foundation

//typealias UserCompletionBlock = (_ users: [User], _ error: Error?) -> Void

protocol UsersListDetails {
    var title: String { get }
    var users: [User] { get }
    func fetch(_ urlString: String, completion: @escaping (_ users: [User], _ error: Error?) -> Void)
//    func fetch(_ urlString: String, completion: @escaping UserCompletionBlock)

}

class UsersViewModel: UsersListDetails {
    var users: [User] = []
    var title: String {
        return "Users"
    }

    func fetch(_ urlString: String, completion: @escaping (_ users: [User], _ error: Error?) -> Void) {
        let decoder = JSONDecoder()
        decoder.decode([User].self, fromURL: urlString) { [weak self] users, error  in
            self?.users = users
            completion(users,error)
        }
    }
}


/*

 In Swift 1.x and Swift 2.x, closure parameter was @escaping by default
 In Swift 3.x, Apple made a change: closure parameters became @nonescaping by default

 --------------------------------------------

 @nonescaping closures:

 When passing a closure as the function argument,
 the closure gets execute with the function’s body and returns the compiler back.
 As the execution ends,
 the passed closure goes out of scope and have no more existence in memory.

 Example:

 func getSumOf(array:[Int], handler: ((Int)->Void)) {
    // Do some calculation
    let sum = something
    handler(sum)
 }

 -----------------------------------------------

 @escaping closures:
 When passing a closure as the function argument,
 the closure is being preserve to be execute later and function’s body gets executed,
 returns the compiler back.
 As the execution ends, the scope of the passed closure exist and have existence in memory,
 till the closure gets executed.
 There are several ways to escaping the closure:


 func getSumOf(array:[Int], handler: @escaping ((Int)->Void)) {
     //step 2
     var sum: Int = 0
     for value in array {
        sum += value
     }
     //step 3
     Globals.delay(0.3, closure: {
        handler(sum)
     })
 }

 */
