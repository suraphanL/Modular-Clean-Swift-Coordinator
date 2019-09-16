//
//  SignUpRouter.swift
//  LoginFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol SignUpRouterInput {
  func navigateToSomewhere()
}

protocol SignUpRouterOutput: class {
  func proceedToOtp(router: SignUpRouter)
}


class SignUpRouter: SignUpRouterInput {
  weak var viewController: SignUpViewController!
  weak var coordinator: SignUpRouterOutput?
  // MARK: - Navigation

  func navigateToSomewhere() {
    coordinator?.proceedToOtp(router: self)
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
