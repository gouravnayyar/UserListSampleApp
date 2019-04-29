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
    let dispatchGroup = DispatchGroup()

    let array1 = [1,2,3,4,5]
    let array2 = [5,6,7,8,9]
    let array3 = [11,12,13,14,15]
    let result: Int = 0


    func sum(of elements: [Int], completion: @escaping(Int) -> Void) {
        var result = 0
        DispatchQueue.global(qos: .background).async {
            for index in 0..<elements.count {
                let val = elements[index]
                result += val
            }

            let random = (0...10).random

            sleep(UInt32(random))
            completion(result)
        }
    }

    func printSum() {
        var output = 0

        dispatchGroup.enter()
        sum(of: array1) { (result) in
            print("Result 1 = \(result)")
            output += result
            self.dispatchGroup.leave()
        }


        dispatchGroup.enter()
        sum(of: array2) { (result) in
            print("Result 2 = \(result)")
            output += result
            self.dispatchGroup.leave()
        }

        dispatchGroup.enter()
        sum(of: array3) { (result) in
            print("Result 3 = \(result)")
            output += result
            self.dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: .main) {
            print(output)
        }


    }

    override func viewDidLoad() {
        super.viewDidLoad()

        printSum()
        // Do any additional setup after loading the view, typically from a nib.
//        self.loadData()
    }

    func loadData() {
        dataSource.dataChanged = { [weak self] in
            self?.tableView.reloadData()
        }

        dataSource.fetch("https://jsonplaceholder.typicode.com/users")
        tableView.dataSource = dataSource
    }
}

extension Range where Bound == Int {
    var random: Int {
        return lowerBound + numericCast(arc4random_uniform(numericCast(count)))
    }
    func random(_ n: Int) -> [Int] {
        return (0..<n).map { _ in random }
    }
}
extension ClosedRange where Bound == Int {
    var random: Int {
        return lowerBound + numericCast(arc4random_uniform(numericCast(count)))
    }
    func random(_ n: Int) -> [Int] {
        return (0..<n).map { _ in random }
    }
}
