//
//  ViewController.swift
//  UI_Framework
//
//  Created by Marek Mościchowski on 03.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

import Foundation

public class ViewController : UIViewController {
  
  let viewModel : ViewModel
  @IBOutlet public var label: UILabel!
  
  public init(viewModel: ViewModel = ViewModelImpl()) {
    self.viewModel = viewModel
    super.init(nibName: "ViewController", bundle: Bundle.init(for: type(of: self)))
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    label.text = "Hello CocoaHeads!"
  }
}
