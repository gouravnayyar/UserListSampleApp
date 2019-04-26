//
//  HomeScreen.swift
//  UserListSampleAppUITests
//
//  Created by Gourav Nayyar on 26/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import Foundation
import XCTest

open class HomeScreen: GNScreenProtocol {
    let app: XCUIApplication

    private lazy var homeTitle: XCUIElement = self.app.navigationBars["Users"]

    public init(application: XCUIApplication) {
        self.app = application
    }



    public func waitForScreen(time: TimeInterval = 5) -> Bool {
        let isHittablePredicate = NSPredicate(format: "exists == true AND hittable == true AND enabled == true")
        let expectation = XCTNSPredicateExpectation(predicate: isHittablePredicate, object: self.homeTitle)
        let result = XCTWaiter().wait(for: [expectation], timeout: time)
        return result == .completed
    }

}
