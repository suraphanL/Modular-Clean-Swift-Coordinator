//
//  HomeCoordinator.swift
//  HomePageFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright © 2019 SCB. All rights reserved.
//

import Foundation
import CoordinatorKit
import SubFlow

public protocol HomeCoordinator {
  
}

private final class BundleToken {}

public class HomeCordinatorImplementation: Coordinator<Any>, HomeCoordinator {

  lazy var homeViewController: HomeViewController = {
    let storyBoard = UIStoryboard(name: "HomeFlow", bundle: Bundle(for: BundleToken.self))
    let controller = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    controller.router.coordinator = self
    return controller
  }()

  public override init(router: RouterType) {
    super.init(router: router)
    router.setRootModule(homeViewController, hideBar: false)
  }
}

extension HomeCordinatorImplementation: HomeRouterOutput {
  func proceedToDetailPage() {
    let coordinator = SubFlowCoordinatorImplementation(router: router)
    addChild(coordinator)
    router.push(coordinator, animated: true) { [weak self, weak coordinator] in
      // This executes when the back button is pressed
      self?.removeChild(coordinator)
    }
    coordinator.start()
  }
}
