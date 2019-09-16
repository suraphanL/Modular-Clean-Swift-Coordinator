//
//  DetailPresenter.swift
//  SubFlow
//
//  Created by Suraphan Laokondee on 16/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol DetailPresenterInterface {
  func presentSomething(response: Detail.Something.Response)
}

class DetailPresenter: DetailPresenterInterface {
  weak var viewController: DetailViewControllerInterface!

  // MARK: - Presentation logic

  func presentSomething(response: Detail.Something.Response) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller. The resulting view model should be using only primitive types. Eg: the view should not need to involve converting date object into a formatted string. The formatting is done here.

    let viewModel = Detail.Something.ViewModel()
    viewController.displaySomething(viewModel: viewModel)
  }
}
