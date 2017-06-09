//
//  LoginViewModelImpl.swift
//  UI_Framework
//
//  Created by Marek Mościchowski on 04.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

import Foundation
import ReactiveSwift

public class LoginViewModelImpl: LoginViewModel {
  public init() {
    
  }
  var title: MutableProperty<String> = MutableProperty("")
}
