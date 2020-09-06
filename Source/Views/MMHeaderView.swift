//
//  MMHeaderView.swift
//  MMModalWebViewController
//
//  Created by MAMMUT Nithammer on 05.09.20.
//  Copyright © 2020 Mammut Media Marketing UG. All rights reserved.
//

import UIKit

class MMHeaderView: UIView {
    let backButton = UIButton()
    let forwardButton = UIButton()
    let closeButton = UIButton()
    let titleLabel = UILabel()
    let urlLabel = UILabel()

    convenience init() {
        self.init(frame: .zero)

        isUserInteractionEnabled = true

        let hairline = UIView()
        hairline.backgroundColor = .systemGray

        backButton.setImage(MMConfig.icons.backIcon, for: .normal)
        backButton.tintColor = MMConfig.tint

        forwardButton.setImage(MMConfig.icons.forwardIcon, for: .normal)
        forwardButton.tintColor = MMConfig.tint

        titleLabel.font = .systemFont(ofSize: 15.0, weight: .semibold)
        titleLabel.textColor = MMConfig.tint
        titleLabel.textAlignment = .center

        urlLabel.font = .systemFont(ofSize: 12.0)
        urlLabel.textColor = MMConfig.urlColor
        urlLabel.textAlignment = .center

        closeButton.setImage(MMConfig.icons.closeIcon, for: .normal)
        closeButton.tintColor = MMConfig.tint

        let titleView = UIView()
        titleView.backgroundColor = .clear

        backButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        hairline.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false

        titleView.addSubview(titleLabel)
        titleView.addSubview(urlLabel)
        addSubview(titleView)
        addSubview(closeButton)
        addSubview(hairline)

        if MMConfig.showNavigation {
            addSubview(backButton)
            addSubview(forwardButton)

            NSLayoutConstraint(item: backButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 8).isActive = true
            NSLayoutConstraint(item: backButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: backButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
            NSLayoutConstraint(item: backButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20).isActive = true

            NSLayoutConstraint(item: forwardButton, attribute: .leading, relatedBy: .equal, toItem: backButton, attribute: .trailing, multiplier: 1, constant: 16).isActive = true
            NSLayoutConstraint(item: forwardButton, attribute: .trailing, relatedBy: .equal, toItem: titleView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: forwardButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: forwardButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
            NSLayoutConstraint(item: forwardButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20).isActive = true
        } else {
            NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: titleView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        }

        /// Hairline bottom to view
        NSLayoutConstraint(item: hairline, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        /// Hairline leading to view
        NSLayoutConstraint(item: hairline, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        /// Hairline trailing to view
        NSLayoutConstraint(item: hairline, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        /// Hairline height
        NSLayoutConstraint(item: hairline, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0.5).isActive = true

        /// close button leading to title view
        NSLayoutConstraint(item: closeButton, attribute: .leading, relatedBy: .equal, toItem: titleView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        /// title view center y
        NSLayoutConstraint(item: titleView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true

        /// title label leading to title view
        NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: titleView, attribute: .leading, multiplier: 1, constant: 8).isActive = true
        /// title label trailing to title view
        NSLayoutConstraint(item: titleView, attribute: .trailing, relatedBy: .greaterThanOrEqual, toItem: titleLabel, attribute: .trailing, multiplier: 1, constant: 8).isActive = true
        /// title label top to title view
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: titleView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        /// title label center x
        NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true

        /// url label leading to title view
        NSLayoutConstraint(item: urlLabel, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: titleView, attribute: .leading, multiplier: 1, constant: 8).isActive = true
        /// url label trailing to title view
        NSLayoutConstraint(item: titleView, attribute: .trailing, relatedBy: .greaterThanOrEqual, toItem: urlLabel, attribute: .trailing, multiplier: 1, constant: 8).isActive = true
        /// url label bottom to title view
        NSLayoutConstraint(item: urlLabel, attribute: .bottom, relatedBy: .equal, toItem: titleView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        /// url label center x
        NSLayoutConstraint(item: urlLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        /// url label top to title label bottom
        NSLayoutConstraint(item: urlLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 0).isActive = true

        /// title view trailing to close button
        NSLayoutConstraint(item: titleView, attribute: .trailing, relatedBy: .equal, toItem: closeButton, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        /// close button trailing to view
        NSLayoutConstraint(item: closeButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -8).isActive = true
        /// close button center y
        NSLayoutConstraint(item: closeButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        /// close button height
        NSLayoutConstraint(item: closeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
        /// close button width
        NSLayoutConstraint(item: closeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
    }
}
