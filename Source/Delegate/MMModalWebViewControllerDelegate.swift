//
//  MMModalWebViewControllerDelegate.swift
//  MMModalWebViewController
//
//  Created by MAMMUT Nithammer on 06.09.20.
//  Copyright © 2020 Mammut Media Marketing UG. All rights reserved.
//

import UIKit
import WebKit

@objc protocol MMModalWebViewControllerDelegate: AnyObject {
    @objc optional func willAppear(_ webViewController: MMModalWebViewController, webView: WKWebView)
    @objc optional func didAppear(_ webViewController: MMModalWebViewController, webView: WKWebView)
    @objc optional func willDisappear(_ webViewController: MMModalWebViewController, webView: WKWebView)
    @objc optional func didDisappear(_ webViewController: MMModalWebViewController, webView: WKWebView)
    @objc optional func contentDidLoad(_ webViewController: MMModalWebViewController, webView: WKWebView)
}
