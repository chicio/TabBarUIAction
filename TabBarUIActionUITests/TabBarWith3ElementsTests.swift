//
//  TabBarWith3ElementsTests.swift
//  TabBarUIActionDemoUITests
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import XCTest

class TabBarWith3ElementsTests: XCTestCase {
    func testTabBarWith3Elements() throws {
        let app = XCUIApplication()
        app.launch()
        app.tables.buttons["TabBar3items"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen 1\""),
            evaluatedWith: app.staticTexts["ScreenText"].label as NSString
        )

        app.images["Tabitem2SystemImage"].tap()
        app.staticTexts["Tabitem2Text"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen 2\""),
            evaluatedWith: app.staticTexts["ScreenText"].label as NSString
        )

        app.images["Tabitem1SystemImage"].tap()
        app.staticTexts["Tabitem1Text"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen 1\""),
            evaluatedWith: app.staticTexts["ScreenText"].label as NSString
        )

        waitForExpectations(timeout: 5)
    }
}
