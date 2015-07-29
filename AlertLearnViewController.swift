//
//  AlertLearnViewController.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/30.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class AlertLearnViewController: UIViewController {

    var controller:UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        controller = UIAlertController(title: "Title",
//            message: "Message",
//            preferredStyle: .Alert)
//        let action = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default,
//            handler: {
//                (paramAction:UIAlertAction!) in
//                print("The Done button was tapped")
//            })
//        controller!.addAction(action)

        controller = UIAlertController(
            title: "Choose how you would like to share this photo",
            message: "You cannot bring back a deleted photo",
            preferredStyle: .ActionSheet)
        
        let actionEmail = UIAlertAction(title: "Via email", style: UIAlertActionStyle.Default,
            handler: {(paramAction:UIAlertAction!) in
            /* Send the photo via email */
            })
        let actionImessage = UIAlertAction(title: "Via iMessage", style: UIAlertActionStyle.Default,
            handler: {(paramAction:UIAlertAction!) in
            /* Send the photo via iMessage */
            })
        let actionDelete = UIAlertAction(title: "Delete photo", style: UIAlertActionStyle.Destructive,
            handler: {(paramAction:UIAlertAction!) in
            /* Delete the photo here */
            })
        
        controller!.addAction(actionEmail)
        controller!.addAction(actionImessage)
        controller!.addAction(actionDelete)
        
    }
    
    override func viewDidAppear(animated: Bool) {
                super.viewDidAppear(animated)
                self.presentViewController(controller!, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(sender: AnyObject) {
//        let buttonTitle = "sender.titleLabel?.text" // 1
//        var message = ""
//        if buttonTitle == country!.correctAnswer { // 2
//            message = "You answered correctly!"
//        } else {
//            message = "That answer is incorrect, please try again."
//        }
//        
//        let alert = UIAlertController(title:nil, message:message, preferredStyle:UIAlertControllerStyle.ActionSheet) // 3
//        
//        alert.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default,
//            handler: {
//                (alert :UIAlertAction) in
//                print("You tapped OK")
//        })) // 4
//        
//        alert.popoverPresentationController?.sourceView = view
//        alert.popoverPresentationController?.sourceRect = sender.frame
//        
//        self.presentViewController(alert, animated: true, completion: nil) // 5
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
