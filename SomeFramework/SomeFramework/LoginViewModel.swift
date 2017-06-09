//
//  LoginViewModel.swift
//  UI_Framework
//
//  Created by Marek Mościchowski on 04.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

import Foundation
import ReactiveSwift

protocol LoginViewModel {
  var title: MutableProperty<String> {get}
}
