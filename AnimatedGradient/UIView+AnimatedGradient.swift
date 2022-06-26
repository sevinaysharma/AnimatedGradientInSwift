//
//  AnimateGradientUtility.swift
//  AnimatedGradient
//
//  Created by Vinay Sharma on 26/06/22.
//

import Foundation
import UIKit

extension UIView {
    /// adds a animated gradient with sets of color passed 
    func animatedGradient(_ gradientSet: [[UIColor]], diagonalGradient: Bool = false){
        let gradient: CAGradientLayer = CAGradientLayer()
        let gradientColorSet = gradientSet.map({ return $0.map({ return $0.cgColor})})
        var colorIndex: Int = 0
        
        gradient.frame = self.bounds
        gradient.colors = gradientColorSet[colorIndex]
        
        self.layer.addSublayer(gradient)
        
        gradient.colors = gradientColorSet[colorIndex]
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
    //    gradientAnimation.delegate = self
        gradientAnimation.duration = 3.0
        gradientAnimation.autoreverses = true
        gradientAnimation.repeatCount = .infinity
        if colorIndex < gradientColorSet.count - 1 {
            colorIndex += 1
        } else {
            colorIndex = 0
        }
        gradientAnimation.toValue = gradientColorSet[colorIndex]
        
        gradientAnimation.fillMode = .forwards
        gradientAnimation.isRemovedOnCompletion = false
        if diagonalGradient {
            gradient.startPoint = CGPoint(x:0.0, y:0.0)
            gradient.endPoint = CGPoint(x:1.0, y:1.0)
        }
        gradient.add(gradientAnimation, forKey: "colors")
    }
}

