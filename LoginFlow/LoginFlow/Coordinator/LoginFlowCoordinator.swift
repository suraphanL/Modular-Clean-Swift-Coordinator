//
//  LoginFlowCoordinator.swift
//  LoginFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright © 2019 SCB. All rights reserved.
//

import Foundation
import CoordinatorKit


public protocol LoginFlowCoordinatorDelegate: class {
  func coordinatorDidFinish()
}

public protocol LoginFlowCoordinator {
  func showSignUp()
}

final class BundleToken {}

public class LoginFlowCoordinatorImplementation: Coordinator<Any>, LoginFlowCoordinator {
  // Coordinator and Communicate back with 2 options
  // Delegate
  weak var delegate: LoginFlowCoordinatorDelegate?
  
  // Callback
  public var onCancel: (() -> Void)?
  public var onAuthenticated: ((String) -> ())?
  
  
  lazy var loginViewController: LoginViewController = {
    let storyBoard = UIStoryboard(name: "LoginFlow", bundle: Bundle(for: BundleToken.self))
    let controller = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    controller.router.coordinator = self
//    controller.delegate = self
    return controller
  }()
  
  public override init(router: RouterType) {
    super.init(router: router)
    router.setRootModule(loginViewController, hideBar: false)
  }
  
  public func showSignUp() {
    let storyBoard = UIStoryboard(name: "LoginFlow", bundle: Bundle(for: BundleToken.self))
    let controller = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
    controller.router.coordinator = self
    router.push(controller, animated: true, completion: nil)
  }
  
  public func showOtp() {
    let storyBoard = UIStoryboard(name: "LoginFlow", bundle: Bundle(for: BundleToken.self))
    let controller = storyBoard.instantiateViewController(withIdentifier: "OtpViewController") as! OtpViewController
    router.push(controller, animated: true, completion: nil)
  }

}

extension LoginFlowCoordinatorImplementation: LoginRouterOutput {
  func proceedToSignUpForm(router: LoginRouter) {
    showSignUp()
  }
  
  func proceedToOtp(router: LoginRouter) {
    showOtp()
  }
  
  func closeLoginFlow(router: LoginRouter) {
    onCancel?()
  }
}

extension LoginFlowCoordinatorImplementation: SignUpRouterOutput {
  func proceedToOtp(router: SignUpRouter) {
    showOtp()
  }
}

/*
import UIKitpublic
protocol RouterType: class, Presentable {
  var navigationController: UINavigationController { get }
  var rootViewController: UIViewController { get }
  func present(_ module: Presentable, animated: Bool)
  func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?)
  func popModule(animated: Bool)
  func dismissModule(animated: Bool, completion: (() -> Void)?)
  func setRootModule(_ module: Presentable, hideBar: Bool)
  func popToRootModule(animated: Bool)
}

final public class Router: NSObject, RouterType, UINavigationControllerDelegate {
  private var completions: [UIViewController : () -> Void]
  public var rootViewController: UIViewController...
  public unowned let navigationController: UINavigationController
  public init(navigationController: UINavigationController) {
    self.navigationController = navigationController
    self.completions = [:]
    super.init()
    self.navigationController.delegate = self
  }
  public func toPresentable() -> UIViewController {
    return navigationController
  }
  public func present(_ module: Presentable, animated: Bool) {
    guard let controller = module.toPresentable() else {
      return
    }
    navigationController.present(controller, animated: animated, completion: nil)
  }
  
  public func dismissModule(animated: Bool, completion: (() -> Void)?) {
    navigationController.dismiss(animated: animated, completion: completion)
  }
  
  public func push(_ module: Presentable, animated: Bool = true, completion: (() -> Void)? = nil) {        // Avoid pushing UINavigationController onto stack
    guard let controller = module.toPresentable(),
      controller is UINavigationController == false else {
        return
    }
    if let completion = completion {
      completions[controller] = completion
    }
    navigationController.pushViewController(controller, animated: animated)
  }
  
  public func popModule(animated: Bool = true)  {
    
    if let controller = navigationController.popViewController(animated: animated) {
      runCompletion(for: controller)
    }
  }
  
  public func setRootModule(_ module: Presentable, hideBar: Bool){
    guard let controller = module.toPresentable() else {
      return
    }
    navigationController.setViewControllers([controller], animated: false)
    navigationController.isNavigationBarHidden = hideBar
  }
  public func popToRootModule(animated: Bool) {
    if let controllers = navigationController.popToRootViewController(animated: animated) {
      controllers.forEach { runCompletion(for: $0) }
    }
  }
  fileprivate func runCompletion(for controller: UIViewController) {
    guard let completion = completions[controller] else {
      return
    }
    completion()
    completions.removeValue(forKey: controller)
  }    // MARK: UINavigationControllerDelegate
  public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
    
    // Ensure the view controller is popping
    guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(poppedViewController) else {
      return
    }
    runCompletion(for: poppedViewController)
  }
}


public protocol Coordinatable: class, Presentable {
  var router: RouterType { get }
  var onCompletion: (() -> Void)? { get set }
  func start()
}

open class Coordinator: NSObject, Coordinatable {
  
  public var childCoordinators: [Coordinator] = []
  public var router: Router
  public init(router: Router) {
    self.router = router
    super.init()
  }
  
  open var onCompletion: (() -> Void)?
  
  open func start() {}
  public func addChild(_ coordinator: Coordinator) {
    childCoordinators.append(coordinator)
  }
  
  public func removeChild(_ coordinator: Coordinator) {
    if let coordinator = coordinator,
      let index = childCoordinators.index(of: coordinator) {
      childCoordinators.remove(at: index)
    }
  }    // Make this function open so we can override it in a different module
  open func toPresentable() -> UIViewController {
    return router.toPresentable()
  }
}



import Foundationopen
class ProfileCoordinator: Coordinator {
  fileprivate let store: StoreType
  fileprivate let profile: Profile
  lazy var viewController: ProfileViewController = {
    let viewModel = LocationProfileViewModel(profile: profile)
    return ProfileViewController(viewModel: viewModel)
  }()
  public init(router: RouterType, store: StoreType, profile: Profile) {
    self.store = store
    self.profile = profile
    super.init(router: router)
  }
  open override func start() {}
  open override func toPresentable() -> UIViewController {
    return viewController
  }
}


let coordinator = ProfileCoordinator(router: router, store: store, profile: profile)
addChild(coordinator)
router.push(coordinator) { [weak self, weak coordinator] in
  // This executes when the back button is pressed
  self?.removeChild(coordinator)
}
coordinator.start()

*/
