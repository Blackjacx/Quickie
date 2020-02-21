//
//  Bundle+Extensions.swift
//  Quickie
//
//  Created by Stefan Herold on 21.02.20.
//  Copyright © 2020 Stefan Herold. All rights reserved.
//

import Foundation

public extension Bundle {

    /// Returns the applications name as specified in the Info.plist
    var appName: String {

        guard let name = object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String else {
            return ""
        }
        return String.trim(name)
    }

    func shortVersion(includeBundleVersion: Bool = false) -> String {

        var components: [String] = []

        if let shortVersion = object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
            let trimmed = String.trim(shortVersion)
            components.append(trimmed)
        }
        if includeBundleVersion {
            components.append("(\(bundleVersion))")
        }
        return components.joined(separator: " ")
    }

    /// Returns the currently set bundle version, often referred to as
    /// build number. If nothing could be found a value of `0` is returned.
    /// - note: Setting a value of `0` and let the CI set the final bundle
    /// version can be used to detect local deug builds.
    var bundleVersion: String {

        guard let version = object(forInfoDictionaryKey: "CFBundleVersion") as? String else {
            return "0"
        }
        return String.trim(version)
    }

    // MARK: - Comparing Versions

    static func isAppVersion(_ currentVersion: String = Bundle.main.shortVersion(),
                             higherThan comparingVersion: String?) -> Bool {
        guard let comparingVersion = comparingVersion else { return true }
        return currentVersion.compare(comparingVersion, options: .numeric) == .orderedDescending
    }
}
