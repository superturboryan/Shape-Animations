//
//  PlayFittBounceViewController.swift
//  Shape-Animations
//
//  Created by Ryan David Forsyth on 2020-10-26.
//

import UIKit

class PlayFittBounceViewController: UIViewController {

    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var pf1: PlayFittBounceView!
    @IBOutlet weak var pf2: PlayFittBounceView!
    @IBOutlet weak var pf3: PlayFittBounceView!
    @IBOutlet weak var pf4: PlayFittBounceView!
    @IBOutlet weak var pf5: PlayFittBounceView!
    @IBOutlet weak var pf6: PlayFittBounceView!
    @IBOutlet weak var pf7: PlayFittBounceView!
    
    var pfViews: [PlayFittBounceView] = [PlayFittBounceView]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        pfViews.append(pf1)
        pfViews.append(pf2)
        pfViews.append(pf3)
        pfViews.append(pf4)
        pfViews.append(pf5)
        pfViews.append(pf6)
        pfViews.append(pf7)
        
        for i in 0..<pfViews.count {
            
            pfViews[i].setColour(colourForIndex(i))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + (0.05 * Double(i))) {
                
                self.pfViews[i].extendoAnimation()
            }
        }
    }
    
    func colourForIndex(_ index:Int) -> UIColor {
        switch index {
        case 0: return .systemPurple
        case 1: return .systemBlue
        case 2: return .systemTeal
        case 3: return .systemGreen
        case 4: return .systemYellow
        case 5: return .systemOrange
        case 6: return .systemPink
        default: return .white
        }
    }
}
