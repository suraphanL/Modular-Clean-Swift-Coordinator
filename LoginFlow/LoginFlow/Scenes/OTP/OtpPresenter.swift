//
//  OtpPresenter.swift
//  LoginFlow
//
//  Created by Suraphan Laokondee on 16/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol OtpPresenterInterface {
  func presentSomething(response: Otp.Something.Response)
}

class OtpPresenter: OtpPresenterInterface {
  weak var viewController: OtpViewControllerInterface!

  // MARK: - Presentation logic

  func presentSomething(response: Otp.Something.Response) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller. The resulting view model should be using only primitive types. Eg: the view should not need to involve converting date object into a formatted string. The formatting is done here.

    let viewModel = Otp.Something.ViewModel()
    viewController.displaySomething(viewModel: viewModel)
  }
}
