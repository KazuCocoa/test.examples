//
//  test_examplesEarlGreyTests.swift
//  test.examplesEarlGreyTests
//
//  Created by kazuaki matsuo on 2017/09/21.
//  Copyright © 2017 kazuaki matsuo. All rights reserved.
//

import XCTest
import EarlGrey

class test_examplesEarlGreyTests: XCTestCase {


    override func setUp() {
        super.setUp()
        configureEarlGrey()
        let myHandler = myFailureHandler()
        EarlGrey.setFailureHandler(handler: myHandler)

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    private func configureEarlGrey() {
        // To disable sending Google Analytics to Google
        GREYConfiguration.sharedInstance().setValue(false, forConfigKey: kGREYConfigKeyAnalyticsEnabled)

        let kMaxAnimationInterval: CFTimeInterval = 5.0
        GREYConfiguration.sharedInstance().setValue(kMaxAnimationInterval, forConfigKey: kGREYConfigKeyCALayerMaxAnimationDuration)
        GREYTestHelper.enableFastAnimation()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCheckIfCurrentProcessIsXctest() {
        XCTAssert(NSClassFromString("XCTest") != nil)
        XCTAssert(NSClassFromString("XCTestCase") != nil)

        print(ProcessInfo.processInfo.environment)
        XCTAssert(ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil)
    }

    // https://github.com/google/EarlGrey/blob/master/Demo/EarlGreyExample/EarlGreyExampleSwiftTests/EarlGreyExampleSwiftTests.swift
    func testExample() {
        // FIXME

        // Define a layout constraint.
        let onTheRight: GREYLayoutConstraint =
            GREYLayoutConstraint(attribute: GREYLayoutAttribute.left,
                                 relatedBy: GREYLayoutRelation.equal,
                                 toReferenceAttribute: GREYLayoutAttribute.right,
                                 multiplier: 1.0,
                                 constant: 1.0)
        EarlGrey.select(elementWithMatcher: grey_accessibilityID("first")).atIndex(0)
            .assert(with: grey_layout([onTheRight], grey_accessibilityID("second")))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

private class myFailureHandler : NSObject, GREYFailureHandler {
    public func handle(_ exception: GREYFrameworkException!, details: String!) {
        // We can insert taking screenshot or other related methods to be able to understand the reason easily.
        print("Test Failed With Reason : \(exception.reason!) and details \(details)")
    }
}
