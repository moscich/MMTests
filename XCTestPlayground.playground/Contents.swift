//: Playground - noun: a place where people can play

import UIKit
import XCTest
import UI_Framework

class MMTestDemoTests: XCTestCase {
  
  func testEmptyString() {
    let vm = ViewModelImpl()
    let ctrl = ViewController(viewModel: vm)
    ctrl.loadViewIfNeeded()
    XCTAssertEqual(ctrl.label.text!, "")
  }
}

MMTestDemoTests.defaultTestSuite().run()

//import UI_Framework
//import XCTest
//import MMTests
//import PlaygroundSupport
//
//class ViewControllerTests: XCTestCase {
//  func testEmpty() {
//    
//    let vm = ViewModelImpl()
//    let ctrl = ViewController(viewModel: vm)
//    ctrl.loadViewIfNeeded()
//    XCTAssertEqual(ctrl.label.text!, "")
//  }
//}
//
//class TestObserver: NSObject, XCTestObservation {
//
//  func testCase(_ testCase: XCTestCase,
//                didFailWithDescription description: String,
//                inFile filePath: String?,
//                atLine lineNumber: UInt) {
//    let displayer = MMDisplayer()
//    displayer.send("F\(description)") {
//      PlaygroundPage.current.finishExecution()
//    }
//  }
//}
//
//let testObserver = TestObserver()
//XCTestObservationCenter.shared().addTestObserver(testObserver)
//

