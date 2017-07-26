//
//  UI_FrameworkTests.swift
//  UI_FrameworkTests
//
//  Created by Marek Mościchowski on 25.07.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

import XCTest
@testable import UI_Framework

class UI_FrameworkTests: XCTestCase {
  
  func testExample() {
    let vm = ViewModelImpl()
    let vc = ViewController(viewModel: vm)
    vm.title.value = "test"
    vc.loadViewIfNeeded()
    XCTAssertEqual(vc.label.text, "test")
  }
  
}
