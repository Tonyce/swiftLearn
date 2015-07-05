//
//  CFSocketViewController.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/4.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit
import CoreFoundation
//import <CoreFoundation/CoreFoundation.h>
//include <sys/socket.h>
//include <netinet/in.h>

class CFSocketViewController: UIViewController {

    var socket: CFSocketRef!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        
//        var context: CFSocketContext  = CFSocketContext()
//        CFDataRef address = CFDataCreate(
//            kCFAllocatorDefault,
//            (UInt8*)&addr,
//            sizeof(addr));
//        socket = CFSocketCreate(kCFAllocatorDefault,
//            PF_INET, SOCK_STREAM, IPPROTO_TCP, CFOptionFlags(CFSocketCallBackType.ReadCallBack), { (socket, CFSocketCallBackType(rawValue: <#T##CFOptionFlags#>), <#CFData!#>, <#UnsafePointer<Void>#>, <#UnsafeMutablePointer<Void>#>) -> Void in
//                <#code#>
//            }, context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
