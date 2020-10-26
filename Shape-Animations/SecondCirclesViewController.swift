//
//  SecondCirclesViewController.swift
//  Shape-Animations
//
//  Created by Ryan David Forsyth on 2020-10-26.
//

import UIKit

class SecondCirclesViewController: UIViewController {
    
    @IBOutlet weak var firstCircle: UIView!
    @IBOutlet weak var secondCircle: UIView!
    @IBOutlet weak var thirdCircle: UIView!
    
    
    @IBOutlet weak var firstCircleHeight: NSLayoutConstraint!
    @IBOutlet weak var secondCircleHeight: NSLayoutConstraint!
    @IBOutlet weak var thirdCircleHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstCircle.layer.cornerRadius = firstCircle.frame.size.height/2
        secondCircle.layer.cornerRadius = secondCircle.frame.size.height/2
        thirdCircle.layer.cornerRadius = thirdCircle.frame.size.height/2
        
        animateCircles()
    }
    
    func animateCircles() {
        
        let reg:CGFloat = 200, big:CGFloat = 500, shrunk:CGFloat = 50
        
        self.firstCircleHeight.constant = self.secondCircleHeight.constant == reg ? shrunk : reg
        self.thirdCircleHeight.constant = self.secondCircleHeight.constant == reg ? shrunk : reg
        self.secondCircleHeight.constant = self.secondCircleHeight.constant == reg ? big : reg
        
        UIView.animate(withDuration: 1.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .curveEaseInOut) {
            
            self.view.layoutIfNeeded()
            
            self.firstCircle.layer.cornerRadius = self.firstCircle.frame.size.height/2;
            //            self.secondCircle.layer.cornerRadius = self.secondCircle.frame.size.height/2;
            self.thirdCircle.layer.cornerRadius = self.thirdCircle.frame.size.height/2;
            
        } completion: { (finished) in
            
            self.animateCircles()
        }

    }

}
