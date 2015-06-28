//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//
//func printFrom1To1000() {
//    for counter in 0...1000 {
//        var a = counter
//    }
//}
//
//var timer = NSTimer.scheduledTimerWithTimeInterval(0,
//    target: self,
//    selector: Selector("printFrom1To1000"),
//    userInfo: nil,
//    repeats: false
//)
//timer.fire()
class myClass: NSTimer{
    func printFrom1To1000() {
        for counter in 0...1000 {
            var b = counter
        }
    }
}

let myClassInstance = myClass()

var timer = NSTimer.scheduledTimerWithTimeInterval(10,
    target: myClassInstance,
    selector: Selector("printFrom1To1000"),
    userInfo: nil,
    repeats: false
)
timer.fire()