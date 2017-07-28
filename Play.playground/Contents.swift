//: Playground - noun: a place where people can play

import UIKit
import MMTests
import PlaygroundSupport
import UI_Framework

let runner = MMTestRunner()
let array = runner.runTests("UI_Framework.framework") as! [MMTestResult]

let summary = Helper.testSummary(array)
