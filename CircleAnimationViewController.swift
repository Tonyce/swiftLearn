//
//  CircleAnimationViewController.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/5.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class CircleAnimationViewController: UIViewController {

    var starView:StarView = StarView(frame: CGRectMake(0, 0, 100, 100))
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        starView.center = CGPointMake(self.view.center.x, self.view.center.y-200)
        self.view.addSubview(starView)
        
        let number = randomInRange(1...100)
        starView.startLoadNumber(number)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func animation(sender: UIButton) {
        let number = randomInRange(1...100)
        starView.startLoadNumber(number)

    }
    func initProcess(){
        
    }
    
    func randomInRange(range: Range<Int>) -> Int {
        
        let count = UInt32(range.endIndex - range.startIndex)
        return  Int(arc4random_uniform(count)) + range.startIndex
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

class StarView: UIView  {
    var progressLayer: CAShapeLayer = CAShapeLayer()
    var passesLabel:UILabel = UILabel(frame: CGRectMake(15, 64, 60, 20))
    var tensSliderContainer:SliderLabelContainer = SliderLabelContainer(frame: CGRectMake(27, 13, 20, 45), type: SliderLabelContainerType.TensDigitType)
    var singleSliderContainer:SliderLabelContainer = SliderLabelContainer(frame: CGRectMake(50, 13, 20, 45), type: SliderLabelContainerType.SingleDigitType)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        progressLayer.lineWidth = 2
        progressLayer.fillColor = UIColor.clearColor().CGColor
        progressLayer.strokeColor = UIColor.whiteColor().CGColor
        progressLayer.path = UIBezierPath(ovalInRect: self.bounds).CGPath
        self.layer.addSublayer(progressLayer)
        
        passesLabel.backgroundColor = UIColor.blueColor()
        passesLabel.font = UIFont.systemFontOfSize(15)
        passesLabel.text = "PASSES"
        passesLabel.textColor = UIColor.whiteColor()
        passesLabel.center = CGPointMake(CGRectGetWidth(self.bounds)/2.0, CGRectGetHeight(self.bounds)/2+20.0)
        passesLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(passesLabel)
        self.addSubview(singleSliderContainer)
        self.addSubview(tensSliderContainer)
    }
    
    func startLoadNumber(num:Int){
        let tensDigit:Int = num/10
        let singleDigit:Int = num%10
        
        print(tensDigit)
        print(singleDigit)
        tensSliderContainer.scrollToNum(tensDigit)
        singleSliderContainer.scrollToNum(singleDigit)
        
        startDrawCircleAnimation()
    }
    
    override func layoutSubviews() {
        let radius:CGFloat = CGRectGetWidth(self.bounds)/2.0
        let center = CGPointMake(radius, radius)
        let startAngle = -M_PI_2
        let endAngle = M_PI_2*3.0
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        progressLayer.path = circlePath.CGPath
    }
    
    func startDrawCircleAnimation(){
        let pathAnimation:CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        pathAnimation.duration = 0.5
        progressLayer.addAnimation(pathAnimation, forKey: "pathAnimation")
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


enum SliderLabelContainerType{
    case SingleDigitType
    case TensDigitType
}

class SliderLabelContainer: UIView {
    
    var singleDigitsScroll:UIScrollView!
    private var scrollType:SliderLabelContainerType = SliderLabelContainerType.SingleDigitType
    
    init(frame: CGRect, type:SliderLabelContainerType) {
        super.init(frame: frame)
        
        scrollType = type
        
        singleDigitsScroll = UIScrollView(frame: self.bounds)
        singleDigitsScroll.contentSize = CGSizeMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)*10)
        for i in 0...10{
            let label:UILabel = UILabel(frame: CGRectMake(0, CGRectGetHeight(self.bounds) * CGFloat(i), CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)))
            label.text = "\(i)"
            label.textAlignment = NSTextAlignment.Center
            label.font = UIFont.boldSystemFontOfSize(30)
            label.textColor = UIColor.whiteColor()
            singleDigitsScroll.addSubview(label)
        }
        
        self.addSubview(singleDigitsScroll)
    }
    
    func scrollToNum(num:Int){
        
        if scrollType == .SingleDigitType{
            UIView.animateWithDuration(0.85, animations: { () -> Void in
                self.singleDigitsScroll.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * CGFloat(num))
            })
        }else {
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.singleDigitsScroll.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * CGFloat(num))
            })
        }
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}
