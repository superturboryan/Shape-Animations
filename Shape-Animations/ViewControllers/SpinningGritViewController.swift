//
//  SpinningGritViewController.swift
//  Shape-Animations
//
//  Created by Ryan David Forsyth on 2020-10-26.
//

import UIKit

class SpinningGritViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let initialRotation:CGFloat = 45
    let rotationDegrees:CGFloat = 90
    var rotationCount:CGFloat = 1
    
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
        
        performRotationAndScale()
        
    }
    
    @objc func performRotationAndScale() {
        
        let isExpanding = self.imageView.frame.size.width <= 100
        
        if isExpanding {
            let colorIndex = Int((rotationCount/2).truncatingRemainder(dividingBy: 7))
            print(colorIndex)
            let color = UIView.colourForIndex(colorIndex)
            self.bgView.addPulsatingLayer(withColor: color)
        }
        
        UIView.animate(withDuration: isExpanding ? 0.45 : 0.65,
                       delay: isExpanding ? 0.0 : 0.05,
                       options: .curveEaseInOut) {
            
            let big:CGFloat = 3.0, reg:CGFloat = 1.0
            
            let xScale:CGFloat = isExpanding ? big : reg
            let yScale:CGFloat = isExpanding ? big : reg
            
            let rotationRadians:CGFloat = (self.rotationCount * (self.rotationDegrees * (.pi/180)))
            
            let rotateTransform = CGAffineTransform(rotationAngle:rotationRadians)
            let scaleTransform = CGAffineTransform(scaleX: xScale, y: yScale)
            
            self.imageView.transform = rotateTransform.concatenating(scaleTransform)
            
            self.rotationCount += 1
            
        } completion: { (finished) in
            
            self.performRotationAndScale()
        }
    }


}
