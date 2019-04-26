//
//  GNUIApplication.swift
//  UserListSampleAppUITests
//
//  Created by Gourav Nayyar on 26/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import Foundation
import XCTest


open class GNUIApplication: GNApplicationProtocol {
    public var application: XCUIApplication
    private var bundleID: String?

    open lazy var homeScreen: HomeScreen = HomeScreen(application: self.application)

    public convenience init(bundleIdentifier: String) {
        let application = XCUIApplication(bundleIdentifier: bundleIdentifier)
        self.init(application: application)
        self.bundleID = bundleIdentifier
    }

    private init(application: XCUIApplication) {
        self.application = application
    }

}
