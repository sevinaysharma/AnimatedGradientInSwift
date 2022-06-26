//
//  GradientAnimationLayer.swift
//  AnimatedGradient
//
//  Created by Vinay Sharma on 26/06/22.
//

import Foundation
import UIKit

class GradientAnimationLayer: CAGradientLayer,CAAnimationDelegate {
    var gradientColorSet: [[CGColor]] = []
    var colorIndex: Int = 0
    var animationDuration: CFTimeInterval = 3.0
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init(gradientSet: [[UIColor]], duration: CFTimeInterval) {
        super.init()
        self.animationDuration = duration
        self.gradientColorSet = gradientSet.map({ return $0.map({ return $0.cgColor})})
        self.animate()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate(){
        self.colors = gradientColorSet[colorIndex]
        let animation = CABasicAnimation(keyPath: "colors")
        animation.delegate = self
        animation.duration = self.animationDuration
        animation.fromValue = gradientColorSet[colorIndex]
        updateColorIndex()
        animation.toValue = gradientColorSet[colorIndex]
        animation.fillMode = .both
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

