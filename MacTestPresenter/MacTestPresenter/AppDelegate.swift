//
//  AppDelegate.swift
//  MacTestPresenter
//
//  Created by Marek Mościchowski on 09.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  var statusBar = NSStatusBar.system()
  var statusBarItem : NSStatusItem = NSStatusItem()
  var menu: NSMenu = NSMenu()
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {

    NotificationCenter.default.addObserver(self, selector: #selector(updateBar), name: NSNotification.Name(rawValue: "updateBar"), object: nil)
    
    statusBarItem = statusBar.statusItem(withLength: -1)
    statusBarItem.menu = menu
    let attString = NSMutableAttributedString(string: "Łom\nBom")
    attString.addAttribute(NSForegroundColorAttributeName, value: NSColor.red, range: NSRange.init(location: 0, length: 3))
    attString.addAttribute(NSForegroundColorAttributeName, value: NSColor.green, range: NSRange.init(location: 4, length: 3))
    attString.addAttribute(NSFontAttributeName, value: NSFont.systemFont(ofSize: 10), range: NSRange.init(location: 0, length: 7))
    statusBarItem.attributedTitle = attString
    
  }
  
  @objc func updateBar(notification: Notification){
    let string = notification.object as! String
    let components = string.components(separatedBy: ",")
    let passed = Int(components[0])!
    let failed = Int(components[1])!
    self.updateBarItem(passed: passed, failed: failed)
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
    
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}

