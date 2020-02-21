//
//  UIViewController+Extensions.swift
//  Quickie
//
//  Created by Stefan Herold on 21.02.20.
//  Copyright © 2020 Stefan Herold. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UIViewController {

    func setControlsEnabledState(_ isEnabled: Bool) {

        navigationItem.setHidesBackButton(!isEnabled, animated: true)

        navigationItem.leftBarButtonItems?.forEach {
            $0.isEnabled = isEnabled
        }
        navigationItem.leftBarButtonItem?.isEnabled = isEnabled

        navigationItem.rightBarButtonItems?.forEach {
            $0.isEnabled = isEnabled
        }
        navigationItem.rightBarButtonItem?.isEnabled = isEnabled

        toolbarItems?.forEach {
            $0.isEnabled = isEnabled
        }
    }
}
#endif
