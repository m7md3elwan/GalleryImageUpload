//
//  BaseViewController.swift
//  GalleryImageUpload
//
//  Created by Mohamed Mostafa on 8/12/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation
import SwiftMessages
import GeometricLoaders

class BaseViewController: UIViewController {

    lazy var container: Infinity = {
        return Infinity.createGeometricLoader()
    }()
    
    func showErrorMessage(text: String?) {
        let view = MessageView.viewFromNib(layout: .messageView)
        view.configureTheme(Theme.error, iconStyle: IconStyle.none)
        view.configureDropShadow()
        view.button?.isHidden = true
        view.configureContent(title: nil, body: text, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: nil, buttonTapHandler: nil)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        var config = SwiftMessages.Config.init()
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        SwiftMessages.show(config: config, view: view)
    }
    
    func showSuccessMessage(text: String?) {
        let view = MessageView.viewFromNib(layout: .messageView)
        view.configureTheme(Theme.success, iconStyle: IconStyle.none)
        view.configureDropShadow()
        view.button?.isHidden = true
        view.configureContent(title: nil, body: text, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: nil, buttonTapHandler: nil)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        SwiftMessages.show(view: view)
    }
    
    func showLoader() {
        container.startAnimation()
    }
    
    func hideLoader() {
        container.stopAnimation()
    }
}
