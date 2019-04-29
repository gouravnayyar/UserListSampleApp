//
//  GNApplicationProtocol.swift
//  UserListSampleAppUITests
//
//  Created by Gourav Nayyar on 26/04/19.
//  Copyright © 2019 Gourav Nayyar. All rights reserved.
//

import Foundation
import XCTest


// App needs a bundle id
public protocol GNApplicationProtocol {

    var application: XCUIApplication { get }
}

public protocol GNScreenProtocol {
    var screenIdentifier: String { get }
    func waitForScreen(time: TimeInterval) -> Bool
    func waitForScrenToDisappear(time: TimeInterval) -> Bool
}

public extension GNScreenProtocol {
    var screenIdentifier: String {
        return "default"
    }

    func waitForScrenToDisappear(time: TimeInterval = 10) -> Bool {
        return false
    }
}
