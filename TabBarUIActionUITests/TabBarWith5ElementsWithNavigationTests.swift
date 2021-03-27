//
//  TabBarWith5ElementsWithNavigationTests.swift
//  TabBarUIAction UITests
//
//  Created by Fabrizio Duroni on 27/03/21.
//

import XCTest

class TabBarWith5ElementsWithNavigationTests: XCTestCase {
    func testTabBarWith5ElementsWithNavigation() {
        let app = XCUIApplication()
        app.launch()
        app.tables.buttons["TabBar5itemsWithNavigationDetail"].tap()

        app.images["TabItem2SystemImage"].tap()
        app.staticTexts["TabItem2Text"].tap()
        app.buttons["GoToDetailButton"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Detail Screen\""),
            evaluatedWith: app.staticTexts["DetailScreenScreenText"].label
        )

        app.navigationBars["Detail Screen"].buttons["Screen with detail"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen with detail\""),
            evaluatedWith: app.staticTexts["ScreenDetailContent"].label as NSString
        )

        waitForExpectations(timeout: 5)
    }
}
