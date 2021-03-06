//
//  AnimateGradientUtility.swift
//  AnimatedGradient
//
//  Created by Vinay Sharma on 26/06/22.
//

import UIKit

extension UIView {
    //   adds a animated gradient with sets of color passed
    /// First color of first colorset should be same as last color of last colorset to make a smooth gradient animation
    func animatedGradient(_ gradientSet: [[UIColor]], duration: CFTimeInterval = 2.5){
        let gradient: GradientAnimationLayer = GradientAnimationLayer(gradientSet: gradientSet, duration: duration)
        gradient.frame = self.bounds
        gradient.cornerRadius = self.layer.cornerRadius
        self.layer.addSublayer(gradient)
        
        // you can modify start and end point to your choice to change the flow of gradient direction
        gradient.startPoint = CGPoint(x:0.0, y:0.0)
        gradient.endPoint = CGPoint(x:1.0, y:1.0)
    }
}
