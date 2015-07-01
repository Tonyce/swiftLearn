//
//  ExtendTransition.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/1.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import Foundation

import UIKit

class ExtendTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var transitionContext: UIViewControllerContextTransitioning?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        
        let containerView = transitionContext.containerView()
        self.transitionContext = transitionContext
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! FirstViewController
        let fromView = fromViewController.view //from view
        let toController: UIViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var toView = toController.view
        
//        toView.clipsToBounds = true
//        
//        let scaleTransform = CGAffineTransformMakeScale(1, 0.3)
//       
//        toView.transform = scaleTransform
//        
        containerView!.addSubview(fromView)
        containerView!.addSubview(toView)
        containerView!.bringSubviewToFront(toView)
//
//        UIView.animateWithDuration(1, animations: {
//            toView.transform = CGAffineTransformIdentity
//            }, completion: {
//                _ in
//                transitionContext.completeTransition(true)
//        })
        let buttonFrame = fromViewController.btn.frame
        let buttonFrameCenter = fromViewController.btn.center
        print("\(buttonFrameCenter)")
        let endFrame = CGRectMake(  buttonFrameCenter.x - CGRectGetHeight(toView.frame) , buttonFrameCenter.y-CGRectGetHeight(fromView.frame), CGRectGetHeight(toView.frame)*2, CGRectGetHeight(toView.frame)*2)
        
//        containerView!.addSubview(fromViewController.view)
//        containerView!.addSubview(destinationView)
        
        let maskPath = UIBezierPath(ovalInRect: buttonFrame)
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = toView.frame
        maskLayer.path = maskPath.CGPath
        maskLayer.fillColor = UIColor.redColor().CGColor
        toView.layer.mask = maskLayer
        
        let bigCirclePath = UIBezierPath(ovalInRect: endFrame)
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.delegate = self
        pathAnimation.fromValue = maskPath.CGPath
        pathAnimation.toValue = bigCirclePath
        pathAnimation.duration = 0.3
//                pathAnimation.duration = transitionDuration(transitionContext)
//        maskLayer.fillColor = UIColor.redColor().CGColor
        maskLayer.path = bigCirclePath.CGPath
        maskLayer.addAnimation(pathAnimation, forKey: "pathAnimation")
        
//        fromView.backgroundColor = UIColor.redColor()
        toView.backgroundColor = UIColor.whiteColor()

//        toView.backgroundColor = UIColor.redColor()
//        UIView.animateWithDuration(0.23, animations: {
//            //            toView.transform = CGAffineTransformIdentity
////                            
//            }, completion: {
//                            _ in
//                            
//                            transitionContext.completeTransition(true)
//                    })
    }
    
     override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if let transitionContext = self.transitionContext {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}