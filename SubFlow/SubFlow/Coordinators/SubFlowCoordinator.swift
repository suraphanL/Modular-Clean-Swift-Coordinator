//
//  SubFlowCoordinator.swift
//  SubFlow
//
//  Created by Suraphan Laokondee on 16/9/19.
//  Copyright © 2019 SCB. All rights reserved.
//

import Foundation
import CoordinatorKit

private final class BundleToken {}


public protocol SubFlowCoordinator {
  
}

// This is a horizontal flow

public class SubFlowCoordinatorImplementation: Coordinator<Any>, SubFlowCoordinator {
  lazy var viewController: DetailViewController = {
    let storyBoard = UIStoryboard(name: "SubFlow", bundle: Bundle(for: BundleToken.self))
    let controller = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    return controller
  }()
  
  public override init(router: RouterType) {
    super.init(router: router)
    viewController.view.backgroundColor = .blue
  }
  
  // We must override toPresentable() so it doesn't
  // default to the router's navigationController
  override public func toPresentable() -> UIViewController {
    return viewController
  }
}
