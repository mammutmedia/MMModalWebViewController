//
//  MMHelper.swift
//  MMModalWebViewController
//
//  Created by MAMMUT Nithammer on 05.09.20.
//  Copyright © 2020 Mammut Media Marketing UG. All rights reserved.
//

import UIKit

internal func imageFromBundle(_ named: String) -> UIImage {
    return UIImage(named: named, in: Bundle(for: MMModalWebViewController.self), compatibleWith: nil) ?? UIImage()
}
