//
//  CustomImageView.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/8.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.

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
    */
    func customShape(){
        let mask: CAShapeLayer = CAShapeLayer()
//        mask.path          = [[self polygonPathWithRect:self.imageView.bounds lineWidth:0.0 sides:6] CGPath];
        mask.path          = self.polygonPathWithRect(self.bounds, lineWidth: 0.0 ,sides: 6).CGPath
        mask.strokeColor   = UIColor.redColor().CGColor
        mask.fillColor     = UIColor.whiteColor().CGColor
        self.layer.mask = mask
    }
    
    
    /** Create UIBezierPath for regular polygon inside a CGRect
    *
    * @param square        The CGRect of the square in which the path should be created.
    * @param lineWidth     The width of the stroke around the polygon. The polygon will be inset such that the stroke stays within the above square.
    * @param sides         How many sides to the polygon (e.g. 6=hexagon; 8=octagon, etc.).
    *
    * @return              UIBezierPath of the resulting polygon path.
    */
    func polygonPathWithRect(square: CGRect, lineWidth: CGFloat, sides:Int) -> UIBezierPath {
        let path = UIBezierPath()
        
        let a: CGFloat = 2.0
        let b: CGFloat = CGFloat(M_PI / Double(sides))
        let theta = a * b
        let c: CGFloat = CGFloat(cosf(Float(theta) / 2.0))
        let d: CGFloat = CGFloat(tanf(Float(theta) / 2.0))
        let squareWidth = min(square.size.width, square.size.height)
        
        var length = squareWidth - lineWidth
        if sides % 4 != 0 {
            length = length * c
        }
        
        let sideLength = length * d
        
        var point = CGPoint(x: squareWidth / 2.0 + sideLength / 2.0, y: squareWidth - (squareWidth - length) / 2.0)
        var angle = CGFloat(M_PI)
        path.moveToPoint(point)
        
        
        for (var side = 0; side < sides; side++) {
            let x: CGFloat = point.x + sideLength * CGFloat(cosf(Float(angle)))
            let y: CGFloat = point.y + sideLength * CGFloat(sinf(Float(angle)))
            point = CGPointMake(x, y)
            path.addLineToPoint(point)
            angle += theta
        }
        
        path.closePath()
        return path
    }
//    - (UIBezierPath *)polygonPathWithRect:(CGRect)square
//    lineWidth:(CGFloat)lineWidth
//    sides:(NSInteger)sides
//    {
//    UIBezierPath *path  = [UIBezierPath bezierPath];
//    
//    CGFloat theta       = 2.0 * M_PI / sides;                           // how much to turn at every corner
//    CGFloat squareWidth = MIN(square.size.width, square.size.height);   // width of the square
//    
//    // calculate the length of the sides of the polygon
//    
//    CGFloat length      = squareWidth - lineWidth;
//    if (sides % 4 != 0) {                                               // if not dealing with polygon which will be square with all sides ...
//    length = length * cosf(theta / 2.0);                            // ... offset it inside a circle inside the square
//    }
//    CGFloat sideLength = length * tanf(theta / 2.0);
//    
//    // start drawing at `point` in lower right corner
//    
//    CGPoint point = CGPointMake(squareWidth / 2.0 + sideLength / 2.0, squareWidth - (squareWidth - length) / 2.0);
//    CGFloat angle = M_PI;
//    [path moveToPoint:point];
//    
//    // draw the sides and rounded corners of the polygon
//    
//    for (NSInteger side = 0; side < sides; side++) {
//    point = CGPointMake(point.x + sideLength * cosf(angle), point.y + sideLength * sinf(angle));
//    [path addLineToPoint:point];
//    angle += theta;
//    }
//    
//    [path closePath];
//    
//    return path;
//    }

}
