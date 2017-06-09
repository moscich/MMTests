//
//  LoginViewController.swift
//  UI_Framework
//
//  Created by Marek Mościchowski on 03.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

class LoginViewController : UIViewController {
  
  let viewModel : LoginViewModel
  @IBOutlet var label: UILabel!
  
  init(viewModel: LoginViewModel) {
    self.viewModel = viewModel
    super.init(nibName: "LoginViewController", bundle: Bundle.init(for: type(of: self)))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    self.label.reactive.text <~ viewModel.title
  }
}
