//
//  CustomPresentingUpTransition.swift
//  Reveola
//
//  Created by MPIS on 4/12/20.
//  Copyright © 2020 MPIS. All rights reserved.
//

import Foundation
import UIKit

class CustomPresentingUpTransition: NSObject , UIViewControllerAnimatedTransitioning {
    
    let duration = 1.4
    var scrolUp = true
    
    
    
    
    init(scrolUp : Bool) {
        
        self.scrolUp = scrolUp
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
          let toVC = transitionContext.viewController(forKey: .to)
          else {
            return
        }

        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
        
        
        let height = fromVC.view.frame.height
        let originalFrame = fromVC.view.frame
        
//        var rightFrame = originalFrame
//        rightFrame.origin.y  += height
//        var leftFrame = originalFrame
//        leftFrame.origin.y -= height // 2.0
//
//        var downFrame , upFrame : CGRect!
        
        
        var downFrame = originalFrame
        var upFrame = originalFrame
        if scrolUp {
            downFrame.origin.y  += height
            upFrame.origin.y -= height

        }else{
            upFrame.origin.y += height 
            downFrame.origin.y  -= height

        }
//        var downFrame = originalFrame
//        downFrame.origin.y  += height
//        var upFrame = originalFrame
//        upFrame.origin.y -= height // 2.0

        
        toVC.view.frame = downFrame
        
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
                        fromVC.view.frame = upFrame
                        toVC.view.frame = originalFrame

        }) { (_) in
            transitionContext.completeTransition(true)
        }
        

        
    }
    
    
}


