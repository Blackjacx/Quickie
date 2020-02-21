//
//  URL+Extensions.swift
//  Quickie
//
//  Created by Stefan Herold on 21.02.20.
//  Copyright © 2020 Stefan Herold. All rights reserved.
//

import Foundation

public extension URL {

    static func createFrom(scheme: String,
                           host: String,
                           path: String,
                           parameters: [String: String]) -> URL? {

        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        return components.url
    }
}
