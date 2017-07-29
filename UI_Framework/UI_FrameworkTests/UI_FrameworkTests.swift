//
//  UI_FrameworkTests.swift
//  UI_FrameworkTests
//
//  Created by Marek Mościchowski on 29.07.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

import XCTest
import UI_Framework

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
