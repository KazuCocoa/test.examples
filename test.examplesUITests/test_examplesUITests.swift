//
//  test_examplesUITests.swift
//  test.examplesUITests
//
//  Created by kazuaki matsuo on 2017/09/20.
//  Copyright © 2017 kazuaki matsuo. All rights reserved.
//

import XCTest

class test_examplesUITests: XCTestCase {

    let app: XCUIApplication = XCUIApplication()

    override func setUp() {
        super.setUp()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        var textField: XCUIElement? = nil
        // New for Xcode 9
        // https://developer.apple.com/documentation/xctest/xcuielement/2879412-waitforexistence?changes=latest_minor
        // more handy than https://github.com/KazuCocoa/XCUITestExample/blob/master/TestAppUITests/TestAppUITests.swift#L81
        waitForExpectations(timeout: 30) { _ in
            // something
            textField = self.app.textFields["example"]
        }

        if textField != nil {
            XCTAssert((textField?.exists)!)
        } else {
            XCTFail()
        }

        // We can check screenshots took automatically: https://kazucocoa.wordpress.com/2015/11/29/swiftxcuitestにおけるcoverageとscreenshotの在り処/
        // Previously, I investigated the place save screenshot.
        // XCUITest is good for running on Xcode, but its a bit difficult to run on CI.
    }
    
}
