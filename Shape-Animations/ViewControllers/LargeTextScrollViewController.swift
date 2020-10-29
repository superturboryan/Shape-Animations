//
//  LargeScrollViewController.swift
//  Shape-Animations
//
//  Created by Ryan David Forsyth on 2020-10-28.
//

import UIKit

class LargeTextScrollViewController: UIViewController {
    
    @IBOutlet weak var mainTextLabel: UILabel!
    
    var labelsBehindMainLabel: [UILabel] = [UILabel]()
    
    // SET IN XIB, also used as right margin during animation
    let mainLabelLeftMargin:CGFloat = 5
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        animateAllLabels()
        timer = Timer.scheduledTimer(timeInterval: 5.0,
                                     target: self,
                                     selector: #selector(animateAllLabels),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func setupView() {
        mainTextLabel.text = "PLAYFITT"
        mainTextLabel.addCharacterSpacing(kernValue: 120.0)
        mainTextLabel.backgroundColor = .clear
        mainTextLabel.isHidden = true
        
        addLabelBehindMainLabel(withIndex: 7) // Hack to get white label in front for now
        for i in 0...6 {
            addLabelBehindMainLabel(withIndex: i)
        }
    }

    private func addLabelBehindMainLabel(withIndex index:Int) {
            
//        let newLabelOffset = 10
//        let newLabelFrame = CGRect(x: mainTextLabel.frame.origin.x + CGFloat((newLabelOffset * (index + 1))),
//                                   y: mainTextLabel.frame.origin.y,
//                                   width: mainTextLabel.frame.size.width,
//                                   height: mainTextLabel.frame.size.height)
        
        let newLabelFrame = mainTextLabel.frame
        let newLabel = UILabel(frame: newLabelFrame)
        
        
        newLabel.textColor = UIView.colourForIndex(index)
        newLabel.attributedText = mainTextLabel.attributedText
        newLabel.font = mainTextLabel.font
        newLabel.textAlignment = mainTextLabel.textAlignment
        
        self.view.insertSubview(newLabel,
                                belowSubview: self.labelsBehindMainLabel.count == 0 ?
                                    mainTextLabel :
                                    labelsBehindMainLabel[labelsBehindMainLabel.count-1])
        
        labelsBehindMainLabel.append(newLabel)
    }
    
    @objc func animateAllLabels() {
        for i in 0..<labelsBehindMainLabel.count {
            animateLabelBackAndForth(labelsBehindMainLabel[i], withDelay: Double((i+1)) * 0.02)
        }
    }
 
    func animateLabelBackAndForth(_ label: UILabel, withDelay delay: TimeInterval) {
        
        // New frame is only different in X position
        let newFrame:CGRect =  CGRect(x: label.frame.minX == mainLabelLeftMargin ?
                                        view.frame.size.width - label.frame.size.width + mainLabelLeftMargin :
                                        mainLabelLeftMargin,
                                      y: label.frame.origin.y,
                                      width: label.frame.size.width,
                                      height: label.frame.size.height)
        
        UIView.animate(withDuration: 5.0,
                       delay: delay,
                       options: .curveEaseInOut) {
            
            label.frame = newFrame
            
        } completion: { (finished) in
            
        }
    }
}

public extension UILabel {
    func addCharacterSpacing(kernValue: Double = 1.15) {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern,
                                          value: kernValue,
                                          range: NSRange(location: 0,
                                                         length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
