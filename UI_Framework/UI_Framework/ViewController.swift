//
//  ViewController.swift
//  UI_Framework
//
//  Created by Marek Mościchowski on 03.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

public class ViewController : UIViewController {
  
  let viewModel : ViewModel
  @IBOutlet var label: UILabel!
  
  public init(viewModel: ViewModel) {
    self.viewModel = viewModel
    super.init(nibName: "ViewController", bundle: Bundle.init(for: type(of: self)))
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    self.label.reactive.text <~ viewModel.title
  }
}
