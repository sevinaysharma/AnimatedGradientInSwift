//
//  UIColor+Extensions.swift
//  AnimatedGradient
//
//  Created by Vinay Sharma on 26/06/22.
//

import Foundation
import UIKit

extension UIColor {
    ///generate a random color
    static func random() -> UIColor {
        return UIColor(red: CGFloat.random(in: 0...255)/255, green: CGFloat.random(in: 0...255)/255, blue: CGFloat.random(in: 0...255)/255, alpha: 1)
    }
}
