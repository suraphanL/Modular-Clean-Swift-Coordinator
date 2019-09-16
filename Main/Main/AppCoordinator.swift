//
//  AppCoordinator.swift
//  Main
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright © 2019 SCB. All rights reserved.
//

import Foundation
import CoordinatorKit
import LoginFlow
import HomePageFlow

enum DeepLink {
  case auth
  case home
}

// The coordinator and its children create a composite pattern
// From here it would be easy to make an iterator of the children
// Or use chain of responsibility to bubble up errors
class AppCoordinator: Coordinator<Any>, UITabBarControllerDelegate {
  
  let tabBarController = UITabBarController()
  
  var tabs: [UIViewController: Coordinator<Any>] = [:]
  
  lazy var homeCoordinator: HomeCordinatorImplementation = {
    let navigationController = UINavigationController()
    navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
    let router = Router(navigationController: navigationController)
    let coordinator = HomeCordinatorImplementation(router: router)
    return coordinator
  }()
  
//  lazy var accountCoordinator: AccountCoordinator = {
//    let navigationController = UINavigationController()
//    navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
//    let router = Router(navigationController: navigationController)
//    let coordinator = AccountCoordinator(router: router, store: store)
//    return coordinator
//  }()
  
//  private let store: StoreType
  
  override init(router: RouterType) {
    super.init(router: router)
    router.setRootModule(tabBarController, hideBar: true)
    tabBarController.delegate = self
    setTabs([homeCoordinator])
  }
  
//  override func start(with link: DeepLink?) {
//    guard let link = link else {
//      return
//    }
//
////    // Forward link or intercept it
////    switch link {
////    case .auth:
////      presentAuthFlow()
////    case .home:
////      // Switch to the home tab because our link says so
////      guard let index = tabBarController.viewControllers?.index(of: homeCoordinator.toPresentable()) else {
////        return
////      }
////      tabBarController.selectedIndex = index
////    }
//  }
  
  func setTabs(_ coordinators: [Coordinator<Any>], animated: Bool = false) {
    
    tabs = [:]
    
    // Store view controller to coordinator mapping
    let vcs = coordinators.map { coordinator -> UIViewController in
      let viewController = coordinator.toPresentable()
      tabs[viewController] = coordinator
      return viewController
    }
    
    tabBarController.setViewControllers(vcs, animated: animated)
  }
  
  
  // Present a vertical flow
  func presentAuthFlow() {
    let navigationController = UINavigationController()
    let navRouter = Router(navigationController: navigationController)
    let coordinator = LoginFlowCoordinatorImplementation(router: navRouter)
    
    coordinator.onCancel = { [weak self, weak coordinator] in
      self?.router.dismissModule(animated: true, completion: nil)
      self?.removeChild(coordinator)
    }
    
    coordinator.onAuthenticated = { [weak self, weak coordinator] token in
//      self?.store.token = token
      self?.router.dismissModule(animated: true, completion: nil)
      self?.removeChild(coordinator)
    }
    
    addChild(coordinator)
    coordinator.start()
    router.present(coordinator, animated: true)
  }
  
  
  // MARK: UITabBarControllerDelegate
  
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    presentAuthFlow()
    return false
//    guard let coordinator = tabs[viewController] else { return true }
    
    // Let's protect this tab because we can
//    if coordinator is AccountCoordinator && !store.isLoggedIn {
//      presentAuthFlow()
//      return false
//    } else {
//      return true
//    }
  }
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    
  }
}
