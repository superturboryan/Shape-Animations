//
//  ViewController.swift
//  Shape-Animations
//
//  Created by Ryan David Forsyth on 2020-10-26.
//

import UIKit

class CirclesViewController: UIViewController {
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainStackView.spacing = 2
        
        for i in 1...10 {
            
            let circleStackView = CircleStackView()
            let config:CircleStackViewConfig = i % 2 == 0 ? .LeftAlign : .RightAlign
            circleStackView.setupCircles(withConfiguration:config)
            
            self.mainStackView.addArrangedSubview(circleStackView)
            
            circleStackView.animateInfiniteLoop()
        }
    }
    
}

