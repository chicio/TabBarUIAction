//
//  TabBarWith3ElementsWithProgrammaticTabChangeTests.swift
//  TabBarUIAction UITests
//
//  Created by Fabrizio Duroni on 27/03/21.
//

import XCTest

class TabBarWith3ElementsWithProgrammaticTabChangeTests: XCTestCase {
    func testTabBarWith3ElementsWithProgrammaticTabChange() {
        let app = XCUIApplication()
        app.launch()
        app.tables.buttons["TabBar3itemsWithProgrammaticTabChange"].tap()

        app.buttons["GoToTab2Button"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen 2\""),
            evaluatedWith: app.staticTexts["Screen2ScreenText"].label as NSString
        )

        app.buttons["GoToTab1Button"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Screen 1\""),
            evaluatedWith: app.staticTexts["Screen1ScreenText"].label as NSString
        )

        waitForExpectations(timeout: 5)
    }
}
