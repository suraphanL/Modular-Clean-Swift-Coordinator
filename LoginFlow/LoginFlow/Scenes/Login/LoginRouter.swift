//
//  LoginRouter.swift
//  LoginFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol LoginRouterInput {
  func navigateToSignUpForm()
  func navigateToHomePage()
  func navigateToOtp()
}
//TODO: Should we remove router?
protocol LoginRouterOutput: class {
  func proceedToSignUpForm(router: LoginRouter)
  func proceedToOtp(router: LoginRouter)
  func closeLoginFlow(router: LoginRouter)
}

class LoginRouter: LoginRouterInput {
  weak var viewController: LoginViewController!
  weak var coordinator: LoginRouterOutput?
  
  // MARK: - Navigation
  
  func navigateToSignUpForm() {
    coordinator?.proceedToSignUpForm(router: self)
    // NOTE: Teach the router how to navigate to another scene. Some examples follow:
    
    // 1. Trigger a storyboard segue
    // viewController.performSegueWithIdentifier("ShowSomewhereScene", sender: nil)
    
    // 2. Present another view controller programmatically
    // viewController.presentViewController(someWhereViewController, animated: true, completion: nil)
    
    // 3. Ask the navigation controller to push another view controller onto the stack
    // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
    
    // 4. Present a view controller from a different storyboard
    // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
    // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
    // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
  }
  
  func navigateToHomePage() {
    coordinator?.closeLoginFlow(router: self)
  }
  
  func navigateToOtp() {
    coordinator?.proceedToOtp(router: self)
  }
  
  // Without Coordinator
  public func showOtp() {
    let storyBoard = UIStoryboard(name: "LoginFlow", bundle: Bundle(for: BundleToken.self))
    let controller = storyBoard.instantiateViewController(withIdentifier: "OtpViewController") as! OtpViewController
    viewController.navigationController?.pushViewController(controller, animated: true)
  }
  
  // MARK: - Communication
  func passDataToNextScene(segue: UIStoryboardSegue) {
    // NOTE: Teach the router which scenes it can communicate with
    
    if segue.identifier == "ShowSomewhereScene" {
      passDataToSomewhereScene(segue: segue)
    }
  }
  
  func passDataToSomewhereScene(segue: UIStoryboardSegue) {
    // NOTE: Teach the router how to pass data to the next scene
    
    // let someWhereViewController = segue.destinationViewController as! SomeWhereViewController
    // someWhereViewController.interactor.model = viewController.interactor.model
  }
}
