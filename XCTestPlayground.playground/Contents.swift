//: Playground - noun: a place where people can play

import UIKit
import XCTest
import MMTests
import UI_Framework
import PlaygroundSupport

class MMTestDemoTests: XCTestCase {
  
  func testEmptyString() {
    let vm = ViewModelImpl()
    let ctrl = ViewController(viewModel: vm)
    ctrl.loadViewIfNeeded()
    XCTAssertEqual(ctrl.label.text!, "")
  }
  
  func testString() {
    let vm = ViewModelImpl()
    vm.title = "Test"
    let ctrl = ViewController(viewModel: vm)
    ctrl.loadViewIfNeeded()
    XCTAssertEqual(ctrl.label.text!, "Test")
  }
  
}

class TestObserver: NSObject, XCTestObservation {
  func testCase(_ testCase: XCTestCase,
                didFailWithDescription description: String,
                inFile filePath: String?,
                atLine lineNumber: UInt) {
    let displayer = MMDisplayer()
    displayer.send("F\(description)") {
      PlaygroundPage.current.finishExecution()
    }
  }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared().addTestObserver(testObserver)


MMTestDemoTests.defaultTestSuite().run()