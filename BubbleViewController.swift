//
//  BubbleViewController.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/6.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class BubbleViewController: UIViewController {

    @IBOutlet weak var dismissBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        dismissBtn.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
        dismissBtn.layer.cornerRadius = CGRectGetHeight(self.dismissBtn.frame) / 2
        dismissBtn.layer.shadowColor = UIColor.blackColor().CGColor
        dismissBtn.layer.shadowOpacity = 0.75
        dismissBtn.layer.shadowRadius = 5.0
        dismissBtn.layer.shadowOffset = CGSize(width: 0, height: 1.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func dismissView(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
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
