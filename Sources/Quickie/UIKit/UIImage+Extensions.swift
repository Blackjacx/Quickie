//
//  UIImage+Extensions.swift
//  Quickie
//
//  Created by Stefan Herold on 21.02.20.
//  Copyright © 2020 Stefan Herold. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UIImage {

    func randomImage(of inSize: CGSize) -> UIImage {
        let nx: CGFloat = CGFloat(arc4random() % UInt32(self.size.width - inSize.width))
        let ny: CGFloat = CGFloat(arc4random() % UInt32(self.size.height - inSize.height))
        let cropRect = CGRect(x: nx, y: ny, width: inSize.width, height: inSize.height)
        guard let cgImg = cgImage?.cropping(to: cropRect) else { return UIImage() }
        return UIImage(cgImage: cgImg)
    }
}
#endif
