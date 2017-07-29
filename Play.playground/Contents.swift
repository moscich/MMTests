//: Playground - noun: a place where people can play

import UIKit
import MMTests
import PlaygroundSupport
import UI_Framework



let runner = MMTestRunner()
let array = runner.runTests("UI_Framework.framework") as! [MMTestResult]

let summary = Helper.testSummary(array)

let displayer = MMDisplayer()
displayer.send(summary.passed, failed: summary.failed) {
  PlaygroundPage.current.finishExecution()
}











public class Helper {
  public static func testSummary(_ results:[MMTestResult]) -> (passed:Int,failed:Int) {
    
    let passed = results.reduce(0) {
      let passed = $1.passed ? 1 : 0
      return $0 + passed
    }
    
    let failed = results.reduce(0) {
      let failed = $1.passed ? 0 : 1
      return $0 + failed
    }
    return (passed,failed)
  }
}