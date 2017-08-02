//: Playground - noun: a place where people can play

import UIKit
import UI_Framework
import PlaygroundSupport

let vm = ViewModelImpl()
vm.title = "Hello CocoaHeads!"
let ctrl = ViewController(viewModel: vm)

PlaygroundPage.current.liveView = ctrl.view
PlaygroundPage.current.needsIndefiniteExecution = true

ctrl.label.text == "Hello CocoaHeads!"