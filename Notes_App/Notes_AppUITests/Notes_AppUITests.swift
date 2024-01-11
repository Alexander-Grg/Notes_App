//
//  Notes_AppUITests.swift
//  Notes_AppUITests
//
//  Created by Alexander Grigoryev on 2023-12-04.
//

import XCTest
// swiftlint:disable type_name
final class Notes_AppUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
        app = nil
        try super.tearDownWithError()
    }

    func testToTheNextScreen() throws {
        app.buttons["loginButton"].tap()
        XCTAssertTrue(app.tables["tableView"].exists)
    }

    func testControl() throws {
        app.buttons["loginButton"].tap()
        XCTAssertTrue(app.segmentedControls["tableGrid"].isEnabled)
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
