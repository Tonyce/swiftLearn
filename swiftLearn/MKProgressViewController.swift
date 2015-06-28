//
//  MKProgressViewController.swift
//  subPhoto
//
//  Created by D_ttang on 15/6/28.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

let kMMRingStrokeAnimationKey = "mmmaterialdesignspinner.stroke"
let kMMRingRotationAnimationKey = "mmmaterialdesignspinner.rotation"

class MKProgressViewController: UIViewController {
    
    let ovalShapeLayer: CAShapeLayer = CAShapeLayer()
    let shapeView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapeView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        shapeView.backgroundColor = UIColor.whiteColor()
        shapeView.layer.cornerRadius = CGRectGetHeight(shapeView.bounds) / 2
        
        shapeView.layer.shadowColor = UIColor.blackColor().CGColor
        shapeView.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        shapeView.layer.shadowOpacity = 0.5
        
        self.view.addSubview(shapeView)
        
        
        ovalShapeLayer.strokeColor = UIColor.redColor().CGColor
        ovalShapeLayer.fillColor = UIColor.clearColor().CGColor
        ovalShapeLayer.lineWidth = 4.0
        ovalShapeLayer.frame = CGRectMake(0, 0, shapeView.frame.width, shapeView.frame.height)
        //        ovalShapeLayer.backgroundColor = UIColor.orangeColor().CGColor
        let refreshRadius = shapeView.frame.size.height/2 * 0.5
        let path = UIBezierPath(ovalInRect: CGRect(
            x: shapeView.frame.size.width/2 - refreshRadius,
            y: shapeView.frame.size.height/2 - refreshRadius,
            width: 2 * refreshRadius,
            height: 2 * refreshRadius))
        
        ovalShapeLayer.path = path.CGPath
        
        shapeView.layer.addSublayer(ovalShapeLayer)
        beginRefreshing()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func beginRefreshing() {
        
        //        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        //        strokeStartAnimation.fromValue = -0.5
        //        strokeStartAnimation.toValue = 1.0
        //
        //        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        //        strokeEndAnimation.fromValue = 0.0
        //        strokeEndAnimation.toValue = 1.0
        //
        //        let strokeAnimationGroup = CAAnimationGroup()
        //        strokeAnimationGroup.duration = 1.5
        //        strokeAnimationGroup.repeatDuration = 5.0
        //        strokeAnimationGroup.animations = [strokeStartAnimation, strokeEndAnimation]
        //        ovalShapeLayer.addAnimation(strokeAnimationGroup, forKey: nil)
        let animation = CABasicAnimation()
        //        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.keyPath = "transform.rotation"
        animation.duration = 4.0;
        animation.fromValue = 0.0;
        animation.toValue = 2 * M_PI;
        animation.repeatCount = Float.infinity
        
        ovalShapeLayer.addAnimation(animation, forKey: kMMRingRotationAnimationKey)
        
        let headAnimation = CABasicAnimation()
        headAnimation.keyPath = "strokeStart"
        headAnimation.duration = 1.0;
        headAnimation.fromValue = 0.0;
        headAnimation.toValue = 0.25;
        
        
        let tailAnimation = CABasicAnimation()
        tailAnimation.keyPath = "strokeEnd"
        tailAnimation.duration = 1.0
        tailAnimation.fromValue = 0.0
        tailAnimation.toValue = 1.0
        tailAnimation.delegate = self
        
        
        let endHeadAnimation = CABasicAnimation()
        endHeadAnimation.keyPath = "strokeStart"
        endHeadAnimation.beginTime = 1.0
        endHeadAnimation.duration = 0.5
        endHeadAnimation.fromValue = 0.25
        endHeadAnimation.toValue = 1.0
        
        let endTailAnimation = CABasicAnimation()
        endTailAnimation.keyPath = "strokeEnd"
        endTailAnimation.beginTime = 1.0
        endTailAnimation.duration = 0.5
        endTailAnimation.fromValue = 1.0
        endTailAnimation.toValue = 1.0
        
        let animations = CAAnimationGroup()
        animations.duration = 1.5
        animations.animations = [headAnimation, tailAnimation, endHeadAnimation, endTailAnimation]
        animations.repeatCount = Float.infinity
        ovalShapeLayer.addAnimation(animations, forKey: kMMRingStrokeAnimationKey)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
