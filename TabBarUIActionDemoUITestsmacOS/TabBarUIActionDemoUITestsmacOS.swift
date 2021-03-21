//
//  TabBarUIActionDemoUITestsmacOS.swift
//  TabBarUIActionDemoUITestsmacOS
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import XCTest

class TabBarUIActionDemoUITestsmacOS: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws { }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
