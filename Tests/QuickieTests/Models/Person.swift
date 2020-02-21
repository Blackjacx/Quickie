//
//  File.swift
//  
//
//  Created by Stefan Herold on 21.02.20.
//

import Foundation

struct Person {
    var name: String {
        return firstName + " " + lastName
    }
    let firstName: String
    let lastName: String
}
