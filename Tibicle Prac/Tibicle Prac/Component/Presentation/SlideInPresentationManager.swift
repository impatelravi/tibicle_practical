//
//  SlideInPresentationManager.swift
//  DemoPickerView
//
//  Created by Ravi Patel on 03/07/20.
//  Copyright © 2020 Ravi Patel. All rights reserved.
//

enum PresentationDirection {
    case left
    case right
    case top
    case bottom
}

import UIKit

class SlideInPresentationManager: NSObject {
    var direction = PresentationDirection.left
    var ratio: CGFloat = 0.75
}

extension SlideInPresentationManager: UIViewControllerTransitioningDelegate{
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = SlideInPresentationController(presentedVC: presented, presenting: presenting, direction: direction, ratio: ratio)
        return presentationController
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: direction, isPresentation: false)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: direction, isPresentation: true)
    }
}


