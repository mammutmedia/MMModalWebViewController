//
//  MMModalWebViewController.swift
//  MMModalWebViewController
//
//  Created by MAMMUT Nithammer on 05.09.20.
//  Copyright © 2020 Mammut Media Marketing UG. All rights reserved.
//

import UIKit
import WebKit

open class MMModalWebViewController: UIViewController {
    private var container = UIView(frame: .zero)
    private var headerView: MMHeaderView?
    private var webView = WKWebView()
    private var progressView = UIProgressView(progressViewStyle: .bar)
    private var url: URL?
    private var lastLocation: CGPoint = .zero

    private weak var delegate: MMModalWebViewControllerDelegate?

    /// Get a MMModalWebViewController with the specified configuration.
    public required init(url: URL, configuration: MMModalWebViewControllerConfiguration) {
        var newConfig = configuration
        if configuration.tint == nil {
            if #available(iOS 13.0, *) {
                newConfig.tint = .label
            } else {
                newConfig.tint = .black
            }
        }
        if configuration.backgroundColor == nil {
            if #available(iOS 13.0, *) {
                newConfig.backgroundColor = .systemBackground
            } else {
                newConfig.backgroundColor = .white
            }
        }
        if configuration.urlColor == nil {
            if #available(iOS 13.0, *) {
                newConfig.urlColor = .systemGray2
            } else {
                newConfig.urlColor = UIColor(red: 174 / 255, green: 174 / 255, blue: 178 / 255, alpha: 1.0)
            }
        }
        MMModalWebViewControllerConfiguration.shared = newConfig

        self.url = url

        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func viewDidLoad() {
        setheaderView()
        addPanGestureRecognizer()
        setWebView()
        setMainLayout()
        setConfiguration()
        navigateToWebsite()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        addObserver()

        delegate?.willAppear?(self, webView: webView)
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        delegate?.didAppear?(self, webView: webView)
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        delegate?.willDisappear?(self, webView: webView)
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        removeObserver()
        delegate?.didDisappear?(self, webView: webView)
    }

    override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            let progress = Float(webView.estimatedProgress)
            if progress == 1.0 {
                progressView.isHidden = true
            } else {
                progressView.isHidden = false
                progressView.progress = progress
            }
        }
    }

    private func navigateToWebsite() {
        let request = URLRequest(url: url!)
        webView.load(request)
    }

    private func setMainLayout() {
        container.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(container)

        let progressViewContainer = UIView(frame: .zero)

        progressViewContainer.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false

        progressViewContainer.addSubview(progressView)
        container.addSubview(progressViewContainer)

        NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: progressViewContainer, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: progressView, attribute: .top, relatedBy: .equal, toItem: progressViewContainer, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: progressView, attribute: .leading, relatedBy: .equal, toItem: progressViewContainer, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: progressViewContainer, attribute: .trailing, relatedBy: .equal, toItem: progressView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: progressView, attribute: .bottom, relatedBy: .equal, toItem: progressViewContainer, attribute: .bottom, multiplier: 1, constant: 0).isActive = true

        NSLayoutConstraint(item: progressViewContainer, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: progressViewContainer, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: container, attribute: .trailing, relatedBy: .equal, toItem: progressViewContainer, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: progressViewContainer, attribute: .top, relatedBy: .equal, toItem: headerView!, attribute: .bottom, multiplier: 1, constant: 0).isActive = true

        NSLayoutConstraint(item: container, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: MMConfig.topMargin).isActive = true
        NSLayoutConstraint(item: container, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: container, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: container, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
    }

    private func setWebView() {
        webView.navigationDelegate = self

        webView.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(webView)

        NSLayoutConstraint(item: webView, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: webView, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }

    private func setheaderView() {
        headerView = MMHeaderView()

        headerView?.backButton.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
        headerView?.forwardButton.addTarget(self, action: #selector(goForward(_:)), for: .touchUpInside)
        headerView?.closeButton.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)

        headerView?.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(headerView!)

        NSLayoutConstraint(item: headerView!, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: headerView!, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: headerView!, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: headerView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
    }

    private func setConfiguration() {
        delegate = MMConfig.controllerDelegate

        container.backgroundColor = MMConfig.backgroundColor
        headerView?.backgroundColor = MMConfig.backgroundColor
        headerView?.backButton.backgroundColor = MMConfig.backgroundColor
        headerView?.forwardButton.backgroundColor = MMConfig.backgroundColor
        headerView?.titleLabel.backgroundColor = MMConfig.backgroundColor
        headerView?.urlLabel.backgroundColor = MMConfig.backgroundColor
        headerView?.closeButton.backgroundColor = MMConfig.backgroundColor
        headerView?.backButton.tintColor = MMConfig.tint
        headerView?.forwardButton.tintColor = MMConfig.tint
        headerView?.closeButton.tintColor = MMConfig.tint
        headerView?.titleLabel.textColor = MMConfig.tint
        headerView?.urlLabel.textColor = MMConfig.urlColor
        progressView.progressTintColor = MMConfig.progressBarColor

        container.layer.cornerRadius = MMConfig.cornerRadius
        container.clipsToBounds = true
    }

    private func addObserver() {
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }

    private func removeObserver() {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
    }

    @IBAction private func goBack(_ sender: UIButton) {
        webView.goBack()
    }

    @IBAction private func goForward(_ sender: UIButton) {
        webView.goForward()
    }

    @IBAction private func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension MMModalWebViewController: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print(#function)
        headerView!.titleLabel.text = MMConfig.loadingText
        headerView!.backButton.isEnabled = webView.canGoBack
        headerView!.forwardButton.isEnabled = webView.canGoForward
    }

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print(#function)
        headerView!.urlLabel.text = webView.url?.absoluteString
        headerView!.titleLabel.text = webView.title
        headerView!.backButton.isEnabled = webView.canGoBack
        headerView!.forwardButton.isEnabled = webView.canGoForward

        delegate?.contentDidLoad?(self, webView: webView)
    }
}

extension MMModalWebViewController: UIGestureRecognizerDelegate {
    fileprivate func addPanGestureRecognizer() {
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        panRecognizer.delegate = self
        panRecognizer.maximumNumberOfTouches = 1
        panRecognizer.minimumNumberOfTouches = 1
        panRecognizer.cancelsTouchesInView = true
        headerView!.gestureRecognizers?.forEach {
            $0.require(toFail: panRecognizer)
        }
        headerView!.gestureRecognizers = [panRecognizer]
    }

    @IBAction private func handlePan(_ gestureRecognizer: UIPanGestureRecognizer?) {
        if gestureRecognizer?.state == .began {
            lastLocation = view.center
        }

        if gestureRecognizer?.state != .cancelled {
            guard let translation: CGPoint = gestureRecognizer?.translation(in: view) else { return }
            view.center = CGPoint(x: view.center.x, y: lastLocation.y + translation.y)
        }

        if gestureRecognizer?.state == .ended {
            if view.frame.origin.y > view.frame.size.height / 2.0 {
                dismiss(animated: true, completion: nil)
                return
            }

            UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: .allowUserInteraction, animations: {
                self.view.center = self.lastLocation
        })
        }
    }
}
