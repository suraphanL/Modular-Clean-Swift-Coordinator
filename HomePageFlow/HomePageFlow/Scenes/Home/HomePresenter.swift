//
//  HomePresenter.swift
//  HomePageFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol HomePresenterInterface {
  func presentSomething(response: Home.Something.Response)
}

class HomePresenter: HomePresenterInterface {
  weak var viewController: HomeViewControllerInterface!

  // MARK: - Presentation logic

  func presentSomething(response: Home.Something.Response) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller. The resulting view model should be using only primitive types. Eg: the view should not need to involve converting date object into a formatted string. The formatting is done here.

    let viewModel = Home.Something.ViewModel()
    viewController.displaySomething(viewModel: viewModel)
  }
}
