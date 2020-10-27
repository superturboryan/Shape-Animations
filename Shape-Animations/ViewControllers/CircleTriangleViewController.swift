//
//  CircleTriangleViewController.swift
//  Shape-Animations
//
//  Created by Ryan David Forsyth on 2020-10-26.
//

import UIKit

class CircleTriangleViewController: UIViewController {

    @IBOutlet weak var topTriangle: UIImageView!
    @IBOutlet weak var circle: UIImageView!
    @IBOutlet weak var bottomTriangle: UIImageView!
    @IBOutlet weak var circleHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.topTriangle.transform = CGAffineTransform(rotationAngle: 180 * (.pi/180))
        
        self.animateCircleShrinkAndExpand()
    }
    
    func animateCircleShrinkAndExpand() {
    
        let reg:CGFloat = 375, small:CGFloat = 100
        
        self.circleHeightConstraint.constant =
            self.circleHeightConstraint.constant == reg ? small : reg
        
        if self.circleHeightConstraint.constant == small {
            UIView.animate(withDuration: 0.4,
                           delay: 0,
                           options: .curveEaseInOut) {
                
                self.circle.alpha = self.circleHeightConstraint.constant == reg ? 1.0 : 0.8
                self.view.layoutIfNeeded()
                
            } completion: { (finished) in
                
                self.animateCircleShrinkAndExpand()
            }
        }
        else {
            UIView.animate(withDuration: 0.55,
                            delay: 0,
                            usingSpringWithDamping: 0.8,
                            initialSpringVelocity: 1.0,
                            options: .curveEaseInOut) {
                
                self.circle.alpha = self.circleHeightConstraint.constant == reg ? 1.0 : 0.8
                self.view.layoutIfNeeded()
                
            } completion: { (finished) in
                
                self.animateCircleShrinkAndExpand()
            }
        }
    }


}
