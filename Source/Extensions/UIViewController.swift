//
//  UIViewController.swift
//  TestApp
//
//  Created by MAMMUT Nithammer on 06.09.20.
//  Copyright © 2020 Mammut Media Marketing UG. All rights reserved.
//

import UIKit

public extension UIViewController {
    func present(url: URL, configuration: MMModalWebViewControllerConfiguration, completion: (() -> Void)? = nil) {
        let vc = MMModalWebViewController(url: url, configuration: configuration)
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: completion)
    }
}
