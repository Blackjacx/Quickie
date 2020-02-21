//
//  UserDefaults+Extensions.swift
//  Quickie
//
//  Created by Stefan Herold on 21.02.20.
//  Copyright © 2020 Stefan Herold. All rights reserved.
//

import Foundation

public extension UserDefaults {

    subscript(key: String) -> Any? {
        get { return value(forKey: key) }
        set { set(newValue, forKey: key) }
    }

    subscript(key: String) -> Bool {
        get { return bool(forKey: key) }
        set { set(newValue, forKey: key) }
    }
}
