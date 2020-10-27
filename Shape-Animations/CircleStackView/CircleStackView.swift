//
//  CircleStackView.swift
//  Shape-Animations
//
//  Created by Ryan David Forsyth on 2020-10-26.
//

import UIKit

enum CircleStackViewConfig {
    case LeftAlign
    case RightAlign
}

class CircleStackView: UIStackView {
    
    var circles: [UIView] = [UIView]()
    
    var firstCircleWidthConstraint: NSLayoutConstraint?
    var secondCircleWidthConstraint: NSLayoutConstraint?
    
    var timer: Timer?
    
    let small:CGFloat = 0.1,
        big:CGFloat   = 0.9
    
    func animateInfiniteLoop() {
        
        self.performCircleAnimation()
    }
    
    func stopAnimating() {
        
        self.timer?.invalidate()
    }
    
    func setupCircles(withConfiguration config:CircleStackViewConfig) {
        
        
        self.axis = .horizontal
        self.spacing = -30
        
        // TODO: Use config to set up accordingly
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let firstCircle = circleView(withColor: .systemPink)
        self.circles.append(firstCircle)
        self.addArrangedSubview(firstCircle)
        firstCircle.layer.cornerRadius = 33
        
        let firstCircleWidth = (self.frame.width * (config == .LeftAlign ? small : big))
        self.firstCircleWidthConstraint = NSLayoutConstraint(item: firstCircle,
                                                             attribute: .width,
                                                          relatedBy: .equal,
                                                          toItem: nil,
                                                          attribute: .notAnAttribute,
                                                          multiplier: 1,
                                                          constant: firstCircleWidth)
        firstCircle.addConstraint(self.firstCircleWidthConstraint!)
        
        
        let secondCircle = circleView(withColor: .systemPurple)
        self.circles.append(secondCircle)
        self.insertArrangedSubview(secondCircle, at: config == .LeftAlign ? 0 : 1)
        secondCircle.layer.cornerRadius = 33
        
        UIView .animate(withDuration: 1.0,
                        delay: 0,
                        options: .curveEaseInOut) {
            self.layoutIfNeeded()
        } completion: { (finished) in
            
        }
    }
    
    func performCircleAnimation() {
            
        let firstCurrentWidth = self.circles[0].frame.width
        
        let firstNewWidth = firstCurrentWidth == self.frame.size.width * small ?
            self.frame.size.width * big :
            self.frame.size.width * small
        
        self.firstCircleWidthConstraint?.constant = firstNewWidth

        UIView .animate(withDuration: 0.55,
                        delay: 0.03,
                        options: .curveEaseInOut) {
            
            self.layoutIfNeeded()
            
        } completion: { (finished) in
            
            self.performCircleAnimation()
        }
    }
    
    func circleView(withColor color:UIColor) -> UIImageView {
        let circle = UIImageView(image: UIImage(systemName: "circle.fill"))
        circle.tintColor = color
        circle.scalesLargeContentImage = true
        circle.contentMode = .scaleToFill
        return circle
    }

}
