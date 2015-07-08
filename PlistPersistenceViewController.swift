//
//  PlistPersistenceViewController.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/7.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

//只有如下集中OC类才能够用writeToFile(<path: String>, atomically: <Bool>)方法将它们存储到属性列表中
//NSArray
//NSMutableArray
//NSDictionary
//NSMutableDictionary
//NSData
//NSMutableData
//NSString
//NSMutableString
//NSNumber
//NSDate


import UIKit

class PlistPersistenceViewController: UIViewController {

    @IBOutlet weak var textFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let filename:NSString = self.filePath("properties.plist")
        if NSFileManager.defaultManager().fileExistsAtPath(filename as String) {
            let data:NSArray = NSArray(contentsOfFile: filename as String)!
            textFiled.text = data.objectAtIndex(0) as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPush(sender: AnyObject) {
        print("click")
        let filename:NSString = self.filePath("properties.plist")
        print(filename)
        let data:NSMutableArray = NSMutableArray()
        
        data.addObject(textFiled.text!)
        data.writeToFile(filename as String, atomically: true)
    }
    
    //这个函数首先是获取Documents目录，每个程序都有自己的Documents文件夹，并且它们仅仅只能读写自己的Documents文件夹中的内容，这也是我们数据存储的地方。那么如何检索Documents目录的完整路径呢？这里我们使用C函数NSSearchPathForDirectoriesInDomain()来查找各种目录。
    
    //这个函数中的常量NSSearchPathDirectory.DocumentDirectort表明我们正在查找Documents目录的路径（NSSearchPathDirectory中还有其他的目录路径，感兴趣的读者可以前去看一看）；第二个常量NSSearchPathDomainMask.UserDomainMask表明我们希望将搜索限制在应用程序的沙盒内。
    //虽然这个函数返回了一个匹配路径的数组，但是我们知道数组中位于索引0处的一定是Documents目录，因为每个应用程序仅有一个Documents目录，因此只有一个目录符合指定的检索条件。
    
    //之后，我们在刚刚检索到的路径尾巴后面附上另外一个字符串来创建文件名，这就要使用stringByAppendingPathComponent方法.
    
    //完成此调用之后，filePath()这个函数就是返回应用程序的Documents目录中的filename文件的完整路径了，这个时候我们就可以来创建、读取文件了
    

    func filePath(filename: NSString) -> NSString {
        let mypaths:NSArray = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let mydocpath:NSString = mypaths.objectAtIndex(0) as! NSString
        let filepath = mydocpath.stringByAppendingPathComponent(filename as String)
        return filepath
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
