//
//  DetailModels.swift
//  SubFlow
//
//  Created by Suraphan Laokondee on 16/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

struct Detail {
  /// This structure represents a use case
  struct Something {
    /// Data struct sent to Interactor
    struct Request {}
    /// Data struct sent to Presenter
    struct Response {}
    /// Data struct sent to ViewController
    struct ViewModel {}
  }
}
