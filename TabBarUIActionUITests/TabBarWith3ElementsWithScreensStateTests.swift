//
//  TabBarWith3ElementsWithScreensStateTests.swift
//  TabBarUIAction UITests
//
//  Created by Fabrizio Duroni on 27/03/21.
//

import XCTest

class TabBarWith3ElementsWithScreensStateTests: XCTestCase {
    func testTabBarWith3Elements() throws {
        let app = XCUIApplication()
        app.launch()
        app.tables.buttons["TabBar3itemsWithScreenState"].tap()

        app.tables["TabScreen1"].textFields["Form1Field"].tap()
        app.tables["TabScreen1"].textFields["Form1Field"].typeText("Text form field 1")
        app.keyboards.buttons["return"].tap()

        app.images["TabItem2SystemImage"].tap()
        app.staticTexts["TabItem2Text"].tap()

        // Remember for ci
        // swiftlilnt:disable:line_length
        // https://stackoverflow.com/questions/32184837/ui-testing-failure-neither-element-nor-any-descendant-has-keyboard-focus-on-se
        app.tables["TabScreen2"].textFields["Form2Field"].tap()
        app.tables["TabScreen2"].textFields["Form2Field"].typeText("Text form field 2")
        app.buttons["Return"].tap()

        app.images["TabItem1SystemImage"].tap()
        app.staticTexts["TabItem1Text"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Text form field 1\""),
            evaluatedWith: app.tables["TabScreen1"].textFields["Form1Field"].value as? String
        )

        app.images["TabItem2SystemImage"].tap()
        app.staticTexts["TabItem2Text"].tap()

        expectation(
            for: NSPredicate(format: "self == \"Text form field 2\""),
            evaluatedWith: app.tables["TabScreen2"].textFields["Form2Field"].value as? String
        )

        waitForExpectations(timeout: 5)
    }
}
