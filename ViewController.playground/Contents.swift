//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import UI_Framework

let vm = ViewModelImpl()
let ctrl = ViewController(viewModel: vm)

vm.title.value = "Hello CocoaHeads!"

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = ctrl.view
