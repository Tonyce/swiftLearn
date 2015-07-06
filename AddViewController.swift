//
//  AddViewController.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/6.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var addBtn: UIButton!
    let transition = BubbleTransition()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addBtn.layer.cornerRadius = CGRectGetHeight(self.addBtn.frame) / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
            controller.transitioningDelegate = self
            controller.modalPresentationStyle = .Custom
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

extension AddViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
//        transition.transitionMode = .Pop
        transition.startingPoint = addBtn.center
        transition.bubbleColor = addBtn.backgroundColor!
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Dismiss
        transition.startingPoint = addBtn.center
        transition.bubbleColor = addBtn.backgroundColor!
        return transition
    }
}
