//: Playground - noun: a place where people can play

import UIKit
import MMTests
import PlaygroundSupport

let runner = MMTestRunner()
let array = runner.runTests() as! [MMTestResult]

let summary = Helper.testSummary(array)