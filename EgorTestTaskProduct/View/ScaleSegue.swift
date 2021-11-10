//
//  ScaleSegue.swift
//  EgorTestTaskProduct
//
//  Created by JoyDev on 10.11.2021.
//

import UIKit

class ScaleSegue: UIStoryboardSegue {

    override func perform() {
        scale()
    }
    
    private func scale(){
        let toVieController = self.destination
        let fromVieController = self.source
        
        let containerView = fromVieController.view.superview
        let originalCenter = fromVieController.view.center
        
        toVieController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toVieController.view.center = originalCenter
        
        containerView?.addSubview(toVieController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            toVieController.view.transform = CGAffineTransform.identity
            
        }, completion: { success in
            fromVieController.present(toVieController, animated: false, completion: nil)
        })
    }
}
