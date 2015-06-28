//
//  TimerViewController.swift
//  swiftLearn
//
//  Created by D_ttang on 15/6/28.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var backZeroBtn: UIButton!
    
    var timer = NSTimer()
    var timeCount = 0
    var timerRuning = false
    
    func Counting(){
        timeCount += 1
        showLabel.text = "\(timeCount)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func startAction(sender: UIButton) {
        if !timerRuning {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
            timerRuning = true
        }
    }
    
    
    @IBAction func stopAction(sender: UIButton) {
        if timerRuning {
            timer.invalidate()
            timerRuning = false
        }
    }

    
    @IBAction func backZeroAction(sender: AnyObject) {
        timeCount = 0
        showLabel.text = "0"
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
