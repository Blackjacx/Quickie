//
//  String+Extensions.swift
//  Quickie
//
//  Created by Stefan Herold on 21.02.20.
//  Copyright © 2020 Stefan Herold. All rights reserved.
//

import Foundation

public extension String {

    // MARK: - Subscripts

    subscript (i: Int) -> Character {
        self[index(self.startIndex, offsetBy: i)]
    }

    subscript (i: Int) -> String {
        String(self[i])
    }

    // MARK: - Truncation / Replacement

    /// Trims new lines and whitespaces from the beginning and end of a given string.
    ///
    /// - parameter text: The input string that should be trimmed
    /// - returns: The trimmed input string or an empty string if the input string is nil
    static func trim(_ text: String?) -> String {
        (text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Iterates over a srting and removes everything except digits.
    /// - parameter text: An optional string that will be converted to a digits-only string.
    /// - returns: A non-optional String that might be empty
    static func stripAllButDigits(fromText text: String?) -> String {

        let nonDigitsCharset = CharacterSet.decimalDigits.inverted
        let components = text?.components(separatedBy: nonDigitsCharset )
        let stripped = components?.joined()
        return stripped ?? ""
    }

    /// Handy function to capitalize only the first letter of a string
    func capitalizingFirstLetter() -> String {

        let first = String(prefix(1)).capitalized
        let other = String(dropFirst())
        return first + other
    }

    // MARK: - Length Checks

    static func isEmpty(_ string: String?) -> Bool {
        guard let string = string else {
            return true
        }
        return string.isEmpty
    }

    static func count(_ string: String?) -> Int   {
        guard let string = string else {
            return 0
        }
        return string.count
    }

    // MARK: - Random Text Generation

    static let loremIpsumBaseString = "Lorem ipsum dolor sit amet, cons" +
        "ectetuer adipiscing elit. Nam cursus. Morbi ut mi. Nullam enim leo, eg" +
        "estas id, condimentum at, laoreet mattis, massa. Sed eleifend nonummy " +
        "diam. Praesent mauris ante, elementum et, bibendum at, posuere sit ame" +
        "t, nibh. Duis tincidunt lectus quis dui viverra vestibulum. Suspendiss" +
        "e vulputate aliquam dui. Nulla elementum dui ut augue. Aliquam vehicul" +
        "a mi at mauris. Maecenas placerat, nisl at consequat rhoncus, sem nunc" +
        " gravida justo, quis eleifend arcu velit quis lacus. Morbi magna magna" +
        ", tincidunt a, mattis non, imperdiet vitae, tellus. Sed odio est, auct" +
        "or ac, sollicitudin in, consequat vitae, orci. Fusce id felis. Vivamus" +
    " sollicitudin metus eget eros."

    enum RandomStringMethod {
        case words(Int)
        case length(Int)
        case randomWords(max: Int)
        case randomLength(max: Int)

        /// Generates a random number between 1 and max.
        /// Except you specify 0 as upper bound. Then you'll get always 0.
        static func random(upTo max: Int) -> Int {

            if max <= 0 {
                return 0
            }
            return Int(arc4random_uniform(UInt32(Swift.max(max, 0)))) + 1
        }
    }

    static func random(using method: RandomStringMethod) -> String {

        switch method {

        case .randomWords(let max):
            return randomWordsString(of: RandomStringMethod.random(upTo: max), from: loremIpsumBaseString)

        case .words(let count):
            return randomWordsString(of: count, from: loremIpsumBaseString)

        case .randomLength(let max):
            return randomLengthString(of: RandomStringMethod.random(upTo: max), from: loremIpsumBaseString)

        case .length(let length):
            return randomLengthString(of: length, from: loremIpsumBaseString)
        }
    }

    private static func randomLengthString(of length: Int, from base: String) -> String {

        let workingBase: String

        if length > base.count {
            workingBase = String(repeating: (base + " "), count: Int(length) / base.count + 1)
        } else {
            workingBase = base
        }

        let start = workingBase.startIndex
        let end = workingBase.index(start, offsetBy: String.IndexDistance(Swift.max(length, 0)))
        return String(workingBase[start..<end])
    }

    private static func randomWordsString(of count: Int, from base: String) -> String {
        
        var result: [String] = []
        let availableWords = base.components(separatedBy: " ")
        let availableWordCount = availableWords.count
        for i in 0..<Swift.max(count, 0) {
            let word = availableWords[i % availableWordCount]
            result.append(word)
        }
        return result.joined(separator: " ")
    }

}
