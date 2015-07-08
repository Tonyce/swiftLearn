//
//  KeyChainPersistentceViewController.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/7.
//  Copyright © 2015年 D_ttang. All rights reserved.
//


//简单来讲，一共就是四个函数
//
//SecItemCopyMatching － 查询和获取
//SecItemUpdate － 更新
//SecItemAdd － 添加
//SecItemDelete － 删除

import UIKit

class KeyChainPersistentceViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        usernameTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    

    @IBAction func add(sender: AnyObject) {
        print("add")
        
        let keyChainItem = self.createDefaultKeyChainItemDic()
        if SecItemCopyMatching(keyChainItem,nil) == noErr{
            self.alertWithMessage("User name already exits")
        }else{
            keyChainItem.setObject(self.passwordTextfield.text!.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion:true)!, forKey: kSecValueData as String)
            let status = SecItemAdd(keyChainItem, nil)
            self.alertWithStatus(status)
        }
    }
    
    
    @IBAction func update(sender: AnyObject) {
        print("update")
        let keyChainItem = self.createDefaultKeyChainItemDic()
        if SecItemCopyMatching(keyChainItem,nil) == noErr{
            let updateDictionary = NSMutableDictionary()
            updateDictionary.setObject(self.passwordTextfield.text!.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion:true)!, forKey:kSecValueData as String)
            let status = SecItemUpdate(keyChainItem,updateDictionary)
            self.alertWithStatus(status)
        }else{
            self.alertWithMessage("The keychain doesnot exist")
        }
    }
    
    @IBAction func deleteKeyChain(sender: AnyObject) {
        print("delete")
        let keyChainItem = self.createDefaultKeyChainItemDic()
        if SecItemCopyMatching(keyChainItem,nil) == noErr{
            let status = SecItemDelete(keyChainItem)
            self.alertWithStatus(status)
        }else{
            self.alertWithMessage("The keychain doesnot exist")
            
        }
    }
    
    @IBAction func getKeyChain(sender: AnyObject) {
        print("get")
        let keyChainItem = self.createDefaultKeyChainItemDic()
        keyChainItem.setObject(kCFBooleanTrue, forKey: kSecReturnData as String)
        keyChainItem.setObject(kCFBooleanTrue, forKey: kSecReturnAttributes as String)
        var queryResult: Unmanaged<AnyObject>?
        _ = SecItemCopyMatching(keyChainItem,&queryResult)
        let opaque = queryResult?.toOpaque()
//        var contentsOfKeychain: NSString?
        if let op = opaque {
            let retrievedData = Unmanaged<NSDictionary>.fromOpaque(op).takeUnretainedValue()
            let passwordData = retrievedData.objectForKey(kSecValueData) as! NSData
            let passwordString = NSString(data: passwordData, encoding: NSUTF8StringEncoding)!
            self.alertWithMessage("Password: \(passwordString)")
        }else{
            self.alertWithMessage("The keychain doesnot exist")
        }
    }
    
    //创建默认的描述字典
    func createDefaultKeyChainItemDic()->NSMutableDictionary{
        let keyChainItem = NSMutableDictionary()
        keyChainItem.setObject(kSecClassInternetPassword as NSString, forKey: kSecClass as NSString)
        keyChainItem.setObject("blog.csdn.net/hello_hwc", forKey:  kSecAttrServer as NSString)
        keyChainItem.setObject(self.usernameTextfield.text! as String, forKey: kSecAttrAccount as NSString)
        return keyChainItem
    }
    
    //用UIAlertController提示信息
    func alertWithMessage(message:String){
        let alertController = UIAlertController(title:"Info", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.Cancel, handler:nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    func alertWithStatus(status:OSStatus){
        if(status == 0){
            self.alertWithMessage("Success")
        }else{
            self.alertWithMessage("Fail ErrorCode is\(status)")
        }
    }

}

extension KeyChainPersistentceViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
