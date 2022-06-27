//
//  AnimatedGradientView.swift
//  AnimatedGradient
//
//  Created by Vinay Sharma on 26/06/22.
//

import Foundation
import UIKit

class AnimatedGradientView: UIView {
    
    var gradientSet = [UIColor]()
    var duration: CFTimeInterval = 2.5
    var diagonalGradient: Bool = false
    
    var gradientLayer: GradientAnimationLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    
}
