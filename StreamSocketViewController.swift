//
//  SocketViewController.swift
//  swiftLearn
//
//  Created by D_ttang on 15/7/4.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit

class StreamSocketViewController: UIViewController {

    var inputStream : NSInputStream?
    var outputStream : NSOutputStream?
    var receivedData: NSMutableData!
    
    let host = "localhost"
    let port = 30000
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.connect()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func send(sender: UIButton) {
//        print("sending...")
        sendData()
    }
    
    func connect() {
        var readStream : Unmanaged<CFReadStream>?
        var writeStream : Unmanaged<CFWriteStream>?
        let host : CFString = NSString(string: self.host)
        let port : UInt32 = UInt32(self.port)
        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, host, port, &readStream, &writeStream)
        
        inputStream = readStream!.takeUnretainedValue()
        outputStream = writeStream!.takeUnretainedValue()
        
//        inputStream!.delegate = self
//        outputStream!.delegate = self
        
        inputStream?.setProperty(kCFBooleanTrue, forKey: kCFStreamPropertyShouldCloseNativeSocket as String)
        outputStream?.setProperty(kCFBooleanTrue, forKey: kCFStreamPropertyShouldCloseNativeSocket as String)
        
        inputStream!.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        outputStream!.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
//        CFReadStreamScheduleWithRunLoop(readStream, NSRunLoop().getCFRunLoop(), NSDefaultRunLoopMode)
//        CFWriteStreamScheduleWithRunLoop(writeStream, NSRunLoop().getCFRunLoop(), NSDefaultRunLoopMode)
        
        inputStream!.open()
        outputStream!.open()
    }
    
    func sendData(){
        let data: NSData = "hello world".dataUsingEncoding(NSUTF8StringEncoding)!
        print("\(outputStream?.streamStatus.rawValue)")
        outputStream?.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
    }


    func reciveServer(message mes: String){
        print("message has been recived :\(mes)")
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

extension StreamSocketViewController: NSStreamDelegate {
    func stream(theStream: NSStream, handleEvent eventCode: NSStreamEvent) {
        print("stream event \(eventCode)")
        switch eventCode {
        case NSStreamEvent.OpenCompleted:
            print("OpenCompleted")
        case NSStreamEvent.HasBytesAvailable:

            print("has bytes")
            if theStream == inputStream{
                var buffer: UInt8 = 0
                var len: Int!
                
                while (inputStream?.hasBytesAvailable != nil){
                    len = inputStream?.read(&buffer, maxLength: 1024)
                    if len > 0{
                        let output = NSString(bytes: &buffer, length: len, encoding:NSUTF8StringEncoding)
                        
                        if nil != output{
                            self.reciveServer(message: output as! String)
                        }
                    }
                }
            }else {
                print("some other")
            }

        case NSStreamEvent.ErrorOccurred:
            print("Can not connect to the host!")
        case NSStreamEvent.EndEncountered:
            print("EndEncountered")
            outputStream!.close()
            outputStream!.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
            outputStream = nil
        default:
            print("Unknown event")
        }
//        if theStream == inputStream {
//                        print("inputStream status : \(theStream.streamStatus.rawValue)")
//        }
//        if theStream == outputStream {
//            print("outputStream status : \(theStream.streamStatus.rawValue)")
//        }

    }
}