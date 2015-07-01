//
//  FirstViewController.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/1.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let thisTransitionDelegate = TransitionDelegate()
    
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        btn.frame.size.height = 100
//        btn.frame.size.width = 100
        // Do any additional setup after loading the view.
        btn.layer.cornerRadius = CGRectGetHeight(btn.frame) / 2
        btn.backgroundColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goNext(sender: UIButton) {
        let SecondView = storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        SecondView.transitioningDelegate = thisTransitionDelegate
        presentViewController(SecondView, animated: true, completion: nil)
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
