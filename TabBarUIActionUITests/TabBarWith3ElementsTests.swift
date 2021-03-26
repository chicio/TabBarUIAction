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
            evaluatedWith: app.staticTexts["Screen1ScreenText"].label as NSString
        )

        app.images["TabItem2SystemImage"].tap()
        app.staticTexts["TabItem2Text"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen 2\""),
            evaluatedWith: app.staticTexts["Screen2ScreenText"].label as NSString
        )

        app.images["TabItem1SystemImage"].tap()
        app.staticTexts["TabItem1Text"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen 1\""),
            evaluatedWith: app.staticTexts["Screen1ScreenText"].label as NSString
        )

        app.images["TabBarModalButton"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Modal\""),
            evaluatedWith: app.staticTexts["ModalScreenText"].label as NSString
        )

        app.buttons["TabBarModalCloseButton"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen 1\""),
            evaluatedWith: app.staticTexts["Screen1ScreenText"].label as NSString
        )

        waitForExpectations(timeout: 5)
    }
}
