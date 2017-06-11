//: Playground - noun: a place where people can play

import UIKit
import MMTests
import UI_Framework
import ReactiveSwift
import ReactiveCocoa
import Result
import PlaygroundSupport

let runner = MMTestRunner()
let array = runner.runTests() as! [MMTestResult]
let results =
  array.map {return "\($0.name!) \($0.passed)"}

let summary = testSummary(array)

let displayer = MMDisplayer()
displayer.send(summary.passed, failed: summary.failed) {
  PlaygroundPage.current.finishExecution()
}

PlaygroundPage.current.needsIndefiniteExecution = true

func testSummary(_ results:[MMTestResult]) -> (passed:Int,failed:Int) {
  
  let passed = array.reduce(0) {
    let passed = $1.passed ? 1 : 0
    return $0 + passed
  }
  
  let failed = array.reduce(0) {
    let failed = $1.passed ? 0 : 1
    return $0 + failed
  }
  return (passed,failed)
}