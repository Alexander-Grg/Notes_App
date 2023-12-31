//
//  Notes_AppUITestsLaunchTests.swift
//  Notes_AppUITests
//
//  Created by Alexander Grigoryev on 2023-12-04.
//

import XCTest
// swiftlint:disable type_name
final class Notes_AppUITestsLaunchTests: XCTestCase {
// swiftlint:enable type_name
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
