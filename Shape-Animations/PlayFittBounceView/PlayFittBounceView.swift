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
    
    let reg:CGFloat = 20, extended:CGFloat = 90
    
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
        
        UIView.animate(withDuration: isExpanding ? 0.4 : 0.6,
                       delay: isExpanding ? 0 : 0.2,
                       options: isExpanding ? .curveEaseOut : .curveEaseInOut) {
            
            self.layoutIfNeeded()
            
        } completion: { (finished) in
            
            self.extendoAnimation()
        }

    }

}


public protocol NibLoadable {
    static var nibName: String { get }
}

public extension NibLoadable where Self: UIView {
    
    static var nibName: String {
        return String(describing: Self.self) // defaults to the name of the class implementing this protocol.
    }
    
    static var nib: UINib {
        return UINib(nibName: Self.nibName, bundle: nil)
    }
    
    func setupFromNib() {
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else { fatalError("Error loading \(self) from nib") }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}
