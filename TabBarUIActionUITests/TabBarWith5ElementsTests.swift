//
//  TabBarWith5ElementsTests.swift
//  TabBarUIActionDemoUITests
//
//  Created by Fabrizio Duroni on 21/03/21.
//

import XCTest

class TabBarWith5ElementsTests: XCTestCase {
    func testTabBarWith5Elements() throws {
        let app = XCUIApplication()
        app.launch()
        app.tables.buttons["TabBar5items"].tap()

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

        app.images["TabItem3SystemImage"].tap()
        app.staticTexts["TabItem3Text"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen 3\""),
            evaluatedWith: app.staticTexts["Screen3ScreenText"].label as NSString
        )

        app.images["TabItem4SystemImage"].tap()
        app.staticTexts["TabItem4Text"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen 4\""),
            evaluatedWith: app.staticTexts["Screen4ScreenText"].label as NSString
        )

        app.images["TabBarModalButton"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Modal\""),
            evaluatedWith: app.staticTexts["ModalScreenText"].label as NSString
        )

        app.buttons["TabBarModalCloseButton"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen 4\""),
            evaluatedWith: app.staticTexts["Screen4ScreenText"].label as NSString
        )

        waitForExpectations(timeout: 5)
    }
}
