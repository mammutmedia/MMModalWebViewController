//
//  MMModalWebViewControllerTests.swift
//  MMModalWebViewControllerTests
//
//  Created by MAMMUT Nithammer on 06.09.20.
//  Copyright © 2020 Mammut Media Marketing UG. All rights reserved.
//

import XCTest

@testable import MMModalWebViewController
class MMModalWebViewControllerTests: XCTestCase {

    private var vc: MockViewController!

    class MockViewController: UIViewController {
        var webViewController: MMModalWebViewController!

        required init() {
            let config = MMConfig
            webViewController = MMModalWebViewController(url: URL(string: "https://github.com")!, configuration: config)

            super.init(nibName: nil, bundle: nil)
        }

        public required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    override func setUp() {
        super.setUp()

        vc = MockViewController()
    }


    func testDefaults() {
        XCTAssertTrue(MMConfig.showNavigation)
        XCTAssertNotNil(MMConfig.backgroundColor)
        XCTAssertNotNil(MMConfig.tint)
        XCTAssertNotNil(MMConfig.urlColor)
        XCTAssertNotNil(MMConfig.icons)
        XCTAssertEqual(MMConfig.loadingText, "Loading...")
        XCTAssertEqual(MMConfig.cornerRadius, 16.0)
        XCTAssertEqual(MMConfig.topMargin, 40.0)
        XCTAssertEqual(MMConfig.progressBarColor, UIColor.blue)
    }
}
