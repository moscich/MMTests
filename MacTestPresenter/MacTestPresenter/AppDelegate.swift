//
//  AppDelegate.swift
//  MacTestPresenter
//
//  Created by Marek Mościchowski on 09.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, GCDAsyncSocketDelegate {
  
  var statusBar = NSStatusBar.system()
  var statusBarItem : NSStatusItem = NSStatusItem()
  var menu: NSMenu = NSMenu()
  var sock: GCDAsyncSocket?
  var newSock: GCDAsyncSocket?
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    
    statusBarItem = statusBar.statusItem(withLength: -1)
    statusBarItem.menu = menu
    let attString = NSMutableAttributedString(string: "P\nF")
    attString.addAttribute(NSForegroundColorAttributeName, value: NSColor.green, range: NSRange.init(location: 0, length: 3))
    attString.addAttribute(NSForegroundColorAttributeName, value: NSColor.red, range: NSRange.init(location: 4, length: 3))
    attString.addAttribute(NSFontAttributeName, value: NSFont.systemFont(ofSize: 10), range: NSRange.init(location: 0, length: 7))
    statusBarItem.attributedTitle = attString
    
    sock = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
    
    do {
      try sock?.accept(onPort: 12345)
    } catch  {
      print("error = ")
    }
  }
  
  func socket(_ sock: GCDAsyncSocket!, didAcceptNewSocket newSocket: GCDAsyncSocket!) {
    self.newSock = newSocket
    self.newSock?.readData(withTimeout: -1, tag: 0)
  }
  
  func socket(_ sock: GCDAsyncSocket!, didRead data: Data!, withTag tag: Int) {
    let string = String.init(data: data, encoding: .utf8)
    if string?.characters.first == "F" {
      let notif = NSUserNotification()
      let message = string!.substring(from: string!.index(string!.startIndex, offsetBy: 1))
      notif.title = "Tests Failed"
      notif.informativeText = message
      NSUserNotificationCenter.default.scheduleNotification(notif)
    } else {
      let components = string?.components(separatedBy: "|")
      updateBarItem(passed: Int(components![0])!, failed: Int(components![1])!)
      self.newSock?.readData(withTimeout: -1, tag: 0)
    }
  }
  
  func updateBarItem(passed:Int, failed:Int) {
    let passedString = "\(passed)"
    let failedString = "\(failed)"
    let string = "\(passedString)\n\(failedString)"
    let attString = NSMutableAttributedString(string: string)
    attString.addAttribute(NSForegroundColorAttributeName, value: NSColor.green, range: NSRange.init(location: 0, length: passedString.characters.count))
    attString.addAttribute(NSForegroundColorAttributeName, value: NSColor.red, range: NSRange.init(location: passedString.characters.count + 1, length: failedString.characters.count))
    attString.addAttribute(NSFontAttributeName, value: NSFont.systemFont(ofSize: 10), range: NSRange.init(location: 0, length: string.characters.count))
    statusBarItem.attributedTitle = attString
    
    if failed > 0 {
      let notif = NSUserNotification()
      notif.title = "Failed \(failed)"
      notif.informativeText = "Passed \(passed)\nFailed \(failed)"
      //      notif.
      NSUserNotificationCenter.default.scheduleNotification(notif)
    }
  }
  
  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}

