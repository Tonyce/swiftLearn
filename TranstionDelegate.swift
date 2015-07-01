//
//  TranstionDelegate.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/1.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import Foundation

import UIKit

class TransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ExtendTransition()
    }
    
//    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return ScaleTransition()
//        return ExtendTransition()
//    }
}