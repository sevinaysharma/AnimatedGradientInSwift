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
    
    ///color set generator
    static func colorSet(_ set: Int, color: Int = 3) -> [[UIColor]] {
        var colorSet = [[UIColor]]()
        if set == 0 || color == 0{
            return []
        }
        
        var colors = [UIColor]()
        for _ in 0...(color-1){
            colors.append(.random())
        }
        
        // First color of first color should be same as last color of last colorset to make a smooth gradient animation
        colorSet.append([colors[0],colors[1]])
        colorSet.append([colors[1],colors[2]])
        colorSet.append([colors[2],colors[0]])
        return colorSet
    }
}