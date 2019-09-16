//
//  HomeCoordinator.swift
//  HomePageFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright © 2019 SCB. All rights reserved.
//

import Foundation
import CoordinatorKit

public protocol HomeCordinator {
  
}
private final class BundleToken {}

public class HomeCordinatorImplementation: Coordinator<Any>, HomeCordinator {

  lazy var homeViewController: HomeViewController = {
    let storyBoard = UIStoryboard(name: "HomeFlow", bundle: Bundle(for: BundleToken.self))
    let controller = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    return controller
  }()

  public override init(router: RouterType) {
    super.init(router: router)
    router.setRootModule(homeViewController, hideBar: false)
  }
}
