//
//  PlayFittBounceView.swift
//  Shape-Animations
//
//  Created by Ryan David Forsyth on 2020-10-26.
//

import UIKit

@IBDesignable
class PlayFittBounceView: UIView, NibLoadable {
    
    @IBOutlet weak var labelStart: UILabel!
    @IBOutlet weak var labelEnd: UILabel!
    @IBOutlet weak var labelExtension: UIView!
    @IBOutlet weak var extendoLLength: NSLayoutConstraint!
    
    let reg:CGFloat = 15, extended:CGFloat = 85
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    func setColour(_ color: UIColor) {
        self.labelStart.textColor = color
        self.labelEnd.textColor = color
        self.labelExtension.backgroundColor = color
    }
    
    func extendoAnimation() {
        
        self.extendoLLength.constant = self.extendoLLength.constant == extended ? reg : extended
        
        let isExpanding = self.extendoLLength.constant == extended
        
        UIView.animate(withDuration: isExpanding ? 0.5 : 0.6,
                       delay: isExpanding ? 0 : 0.0,
                       options: isExpanding ? .curveEaseOut : .curveEaseIn) {
            
            self.layoutIfNeeded()
            
        } completion: { (finished) in
            
            self.extendoAnimation()
        }

    }

}

