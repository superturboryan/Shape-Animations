//
//  UIView+Extension.swift
//  Shape-Animations
//
//  Created by Ryan David Forsyth on 2020-10-27.
//

import UIKit

public extension UIView {
    
    static func colourForIndex(_ index:Int) -> UIColor {
        switch index {
        case 0: return .systemPurple
        case 1: return .systemBlue
        case 2: return .systemTeal
        case 3: return .systemGreen
        case 4: return .systemYellow
        case 5: return .systemOrange
        case 6: return .systemPink
        default: return .white
        }
    }
    
    func addPulsatingLayer(withColor color:UIColor) {
        
        self.clipsToBounds = false
        
        let pulsatingLayer = CAShapeLayer()
        pulsatingLayer.path = UIBezierPath(arcCenter: .zero,
                                           radius: self.bounds.size.width/2 - 7,
                                           startAngle: 0,
                                           endAngle: 2*CGFloat.pi,
                                           clockwise: true).cgPath
        
        pulsatingLayer.strokeColor = color.cgColor
        pulsatingLayer.lineWidth = 10
        pulsatingLayer.fillColor = color.cgColor
        pulsatingLayer.position = CGPoint(x: self.bounds.size.width/2,
                                          y: self.bounds.size.height/2)
        
        self.layer.addSublayer(pulsatingLayer)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [growAnimation(),]
        animationGroup.duration = 2.0
        animationGroup.fillMode = .forwards
        animationGroup.isRemovedOnCompletion = false
        animationGroup.timingFunction = CAMediaTimingFunction(name: .easeOut)
        
        // Use CATransaction to add completion block to CABasicAnimation
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                pulsatingLayer.removeFromSuperlayer()
            }
        }
        pulsatingLayer.add(animationGroup, forKey: "animationGroup")
        CATransaction.commit()
    }
    
    private func growAnimation() -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 6.0
        //        animation.duration = 2.0
        
        return animation
    }
    
    private func fadeAnimation() -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.toValue = 0.3
        //        animation.duration = 1.0
        
        
        return animation
    }
}
