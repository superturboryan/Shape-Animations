//
//  SecondCirclesViewController.swift
//  Shape-Animations
//
//  Created by Ryan David Forsyth on 2020-10-26.
//

import UIKit

class SecondCirclesViewController: UIViewController {
    
    @IBOutlet weak var firstCircle: UIImageView!
    @IBOutlet weak var secondCircle: UIImageView!
    @IBOutlet weak var thirdCircle: UIImageView!
    
    @IBOutlet weak var firstCircleHeight: NSLayoutConstraint!
    @IBOutlet weak var secondCircleHeight: NSLayoutConstraint!
    @IBOutlet weak var thirdCircleHeight: NSLayoutConstraint!
    
    @IBOutlet weak var leftCircleWidth: NSLayoutConstraint!
    @IBOutlet weak var secondCircleWidth: NSLayoutConstraint!
    @IBOutlet weak var rightCircleWidth: NSLayoutConstraint!
    
    var isUpright:Bool = true
    var spinCount:CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        firstCircle.layer.cornerRadius = firstCircle.frame.size.height/2
//        secondCircle.layer.cornerRadius = secondCircle.frame.size.height/2
//        thirdCircle.layer.cornerRadius = thirdCircle.frame.size.height/2
        
        animateCircles()
    }
    
    func animateCircles() {
        
        let reg:CGFloat = 200, big:CGFloat = 450, shrunk:CGFloat = 50
        
        if self.isUpright {
            self.firstCircleHeight.constant = self.secondCircleHeight.constant == reg ? shrunk : reg
            self.thirdCircleHeight.constant = self.secondCircleHeight.constant == reg ? shrunk : reg
            self.secondCircleHeight.constant = self.secondCircleHeight.constant == reg ? big : reg
        }
        else {
            self.leftCircleWidth.constant = self.secondCircleWidth.constant == reg ? shrunk : reg
            self.rightCircleWidth.constant = self.secondCircleWidth.constant == reg ? shrunk : reg
            self.secondCircleWidth.constant = self.secondCircleWidth.constant == reg ? big : reg
        }
        
        let animatingToReg = self.secondCircleHeight.constant == reg && self.secondCircleWidth.constant == reg
        
        UIView.animate(withDuration: animatingToReg ? 0.6 : 0.7,
                       delay: 0,
                       usingSpringWithDamping: animatingToReg ? 1.0 : 0.7,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut) {
            
            self.view.layoutIfNeeded()
            
        } completion: { (finished) in
            
            if animatingToReg {
            
                UIView.animate(withDuration: 0.45,
                               delay: 0.0,
                               options: .curveEaseInOut) {
                    
                    let rotation = CGAffineTransform(rotationAngle: (90*self.spinCount) * (.pi/180))
                    self.view.transform = rotation
                    self.spinCount += 1
                    
                } completion: { (finished) in
                        
                    self.isUpright.toggle()
                    self.animateCircles()
                }
            }
            else {
                self.animateCircles()
            }
            
        }

    }

}
