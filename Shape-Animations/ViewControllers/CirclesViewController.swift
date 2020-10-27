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
        
        mainStackView.spacing = -2
        mainStackView.distribution = .fillEqually
        
        addTapper()
        
        for _ in 1...5 {
            
            addLine()
        }
    }
    
    @objc func addLine() {
        let circleStackView = CircleStackView()
        let config:CircleStackViewConfig = self.mainStackView.arrangedSubviews.count % 2 == 0 ? .LeftAlign : .RightAlign
        circleStackView.setupCircles(withConfiguration:config)
        
        mainStackView.addArrangedSubview(circleStackView)
        
        circleStackView.animateInfiniteLoop()
    }
    
    func addTapper() {
        let tapper = UITapGestureRecognizer()
        tapper.addTarget(self, action: #selector(addLine))
        self.mainStackView.addGestureRecognizer(tapper)
    }
    
}

