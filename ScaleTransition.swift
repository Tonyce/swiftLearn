//
//  ScaleTransition.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/1.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import Foundation

import UIKit

class ScaleTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var transitionContext: UIViewControllerContextTransitioning?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    }
}
