//
//  SignUpPresenter.swift
//  LoginFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol SignUpPresenterInterface {
  func presentSomething(response: SignUp.Something.Response)
}

class SignUpPresenter: SignUpPresenterInterface {
  weak var viewController: SignUpViewControllerInterface!

  // MARK: - Presentation logic

  func presentSomething(response: SignUp.Something.Response) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller. The resulting view model should be using only primitive types. Eg: the view should not need to involve converting date object into a formatted string. The formatting is done here.

    let viewModel = SignUp.Something.ViewModel()
    viewController.displaySomething(viewModel: viewModel)
  }
}
