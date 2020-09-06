//
//  MMModalWebViewControllerConfiguration.swift
//  MMModalWebViewController
//
//  Created by MAMMUT Nithammer on 05.09.20.
//  Copyright © 2020 Mammut Media Marketing UG. All rights reserved.
//

import UIKit

internal var MMConfig: MMModalWebViewControllerConfiguration { return MMModalWebViewControllerConfiguration.shared }

public struct MMModalWebViewControllerConfiguration {
    public static var shared: MMModalWebViewControllerConfiguration = MMModalWebViewControllerConfiguration()

    public init() {}

    /// Use this property to modify the default icons.
    public var icons = MMIcons()
    /// Use this property to modify the tint of the header items.
    public var tint: UIColor?
    /// Use this property to modify the text color of the url in the header.
    public var urlColor: UIColor?
    /// Use this property to modify the background color of the controller.
    public var backgroundColor: UIColor?
    /// Use this property to show or hide the back and forward buttons.
    public var showNavigation: Bool = true
    /// Use this property to modify the loading text.
    public var loadingText: String = "Loading..."
    /// Use this property to modify the progress bar color
    public var progressBarColor: UIColor = .blue
    /// Use this property to modify the corner radius
    public var cornerRadius: CGFloat = 16.0
    /// Use this property to modify the top margin
    public var topMargin: CGFloat = 40.0
    /// Use this property to set the delegate
    var controllerDelegate: MMModalWebViewControllerDelegate?
}
