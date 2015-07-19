//
//  AutoLayoutAnimationViewController.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/20.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class AutoLayoutAnimationViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func animation(sender: AnyObject) {
        
        UIView.animateWithDuration(2, animations: {
            self.topViewHeight.constant += 100
            self.view.layoutIfNeeded()
        })
        

//        view.layoutIfNeeded()
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
