//
//  CustomView.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/8.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class CustomView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func drawRect(rect: CGRect) {
        // Drawing code
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()
        
        CGContextBeginPath(ctx)
        
        CGContextMoveToPoint   (ctx, CGRectGetMinX(rect), CGRectGetMidY(rect));  // top left
        CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect));  // mid right
        CGContextAddLineToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));  // bottom left
        
        CGContextClosePath(ctx);
        
        CGContextSetRGBFillColor(ctx, 241/255.0, 241/255.0, 241/255.0, 1);
        CGContextFillPath(ctx);

    }


}

//let ctx:CGContextRef = UIGraphicsGetCurrentContext()
//
//CGContextBeginPath(ctx)
//
//CGContextMoveToPoint   (ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));  // top left
//CGContextAddLineToPoint(ctx, CGRectGetMidX(rect), CGRectGetMinY(rect));  // mid right
//CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect));  // bottom left
//
//CGContextClosePath(ctx);
//
//CGContextSetRGBFillColor(ctx, 241/255.0, 241/255.0, 241/255.0, 1);
//CGContextFillPath(ctx);
