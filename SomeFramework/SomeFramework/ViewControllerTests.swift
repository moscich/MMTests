//
//  ViewControllerTests.swift
//  UI_Framework
//
//  Created by Marek Mościchowski on 03.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

import Foundation
import MMTests

class ViewControllerTests : MMTestCase {
  
  func testExample() {
    print("Let's go mate!")
    let vm = LoginViewModelImpl()
    let ctrl = LoginViewController(viewModel: vm)
    _ = ctrl.view
    MMTestCase.assertEqual(ctrl.label.text! as NSObject, object: "" as NSObject, context: #function)
  }
  
}
