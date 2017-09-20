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
        // New for Xcode 9
        // https://developer.apple.com/documentation/xctest/xcuielement/2879412-waitforexistence?changes=latest_minor
        // more handy than https://github.com/KazuCocoa/XCUITestExample/blob/master/TestAppUITests/TestAppUITests.swift#L81

        XCTAssert(self.app.staticTexts["First View"].exists)

        // We can check screenshots which took automatically: https://kazucocoa.wordpress.com/2015/11/29/swiftxcuitestにおけるcoverageとscreenshotの在り処/
        // XCUITest is good for running on Xcode, but its a bit difficult to run on CI.
        // XCUITest has no failure handler which means we can manage something after failing tests.
    }
    
}
