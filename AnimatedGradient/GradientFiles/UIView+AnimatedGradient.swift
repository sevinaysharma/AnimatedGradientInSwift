//
//  AnimateGradientUtility.swift
//  AnimatedGradient
//
//  Created by Vinay Sharma on 26/06/22.
//

import Foundation
import UIKit

extension UIView {
    //   adds a animated gradient with sets of color passed
    /// First color of first colorset should be same as last color of last colorset to make a smooth gradient animation
    func animatedGradient(_ gradientSet: [[UIColor]], diagonalGradient: Bool = false){
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.frame = self.bounds
        
        self.layer.addSublayer(gradient)
        gradient.colors = (gradientSet.first ?? []).map({ return $0.cgColor })
        
        let gradientAnimation = GradientAnimation(gradientSet: gradientSet, gradient: gradient)
        if diagonalGradient {
            gradient.startPoint = CGPoint(x:0.0, y:0.0)
            gradient.endPoint = CGPoint(x:1.0, y:1.0)
        }else{
            // you can modify start and end point to your choice
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
    }
}

class GradientAnimationLayer: CAGradientLayer,CAAnimationDelegate {
    var gradientColorSet: [[CGColor]] = []
    var colorIndex: Int = 0
    
    override init() {
        super.init()
        animate()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate(){
        self.colors = gradientColorSet[colorIndex]
        let animation = CABasicAnimation(keyPath: "colors")
        animation.delegate = self
        animation.duration = 2.5
//        animation.autoreverses = true
//        self.repeatCount = .infinity
        animation.fromValue = gradientColorSet[colorIndex]
        updateColorIndex()
        animation.toValue = gradientColorSet[colorIndex]
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        self.add(animation, forKey: "colors")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag{
            self.animate()
        }
    }
    
    func updateColorIndex(){
        if colorIndex < gradientColorSet.count - 1 {
            colorIndex += 1
        } else {
            colorIndex = 0
        }
    }
}

class GradientAnimation: CABasicAnimation, CAAnimationDelegate {
    var gradientColorSet: [[CGColor]] = []
    var colorIndex: Int = 0
    var gradient: CAGradientLayer = CAGradientLayer()
    
    override init() {
        super.init()
        self.keyPath = "colors"
//        self.delegate = self
    }
    
    required init(gradientSet: [[UIColor]], gradient: CAGradientLayer) {
        super.init()
        self.gradient = gradient
        self.gradientColorSet = gradientSet.map({ return $0.map({ return $0.cgColor})})
        self.animate()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate(){
        gradient.colors = gradientColorSet[colorIndex]
        let animation = CABasicAnimation(keyPath: "colors")
        animation.delegate = self
        animation.duration = 2.5
//        animation.autoreverses = true
//        self.repeatCount = .infinity
        animation.fromValue = gradientColorSet[colorIndex]
        updateColorIndex()
        animation.toValue = gradientColorSet[colorIndex]
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        gradient.add(animation, forKey: "colors")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag{
            self.animate()
        }
    }
    
    func updateColorIndex(){
        if colorIndex < gradientColorSet.count - 1 {
            colorIndex += 1
        } else {
            colorIndex = 0
        }
    }
    
}
