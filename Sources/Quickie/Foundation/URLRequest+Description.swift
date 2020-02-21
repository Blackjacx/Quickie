//
//  URLRequest+Description.swift
//  Quickie
//
//  Created by Stefan Herold on 21.02.20.
//  Copyright © 2020 Stefan Herold. All rights reserved.
//

import Foundation

public extension URLRequest {

    var extendedDescription: String {

        let methodDescription: String = {
            let title = "HTTP-Method"
            let value = "[\(httpMethod ?? "VOID")] \(url?.absoluteString ?? "VOID")"
            return "\(title):\n\(value)"
        }()

        let timeoutDescription: String = {
            let title = "Timeout: \(timeoutInterval)"
        }

        let headerDescription: String = {
            let title = "HTTP-Header"
            var value = "VOID"
            if let headerFields = allHTTPHeaderFields {
                value = headerFields.map { (key, value) in
                    "\(key) = \(value)"
                }.joined(separator: "\n")
            }
            return "\(title):\n\(value)"
        }()

        let body: String = {
            let title = "HTTP-Body"
            var value: String = "VOID"
            if let body = httpBody, let bodyDescr = String(data: body, encoding: .utf8) {
                value = bodyDescr
            }
            return "\(title):\n\(value)"
        }()

        return """
        \(methodDescription)
        \(timeoutDescription)
        \(headerDescription)
        \(body)
        """
    }
}
