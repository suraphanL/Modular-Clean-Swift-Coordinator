//
//  HomeInteractor.swift
//  HomePageFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol HomeInteractorInterface {
  func doSomething(request: Home.Something.Request)
}

class HomeInteractor: HomeInteractorInterface {
  var presenter: HomePresenterInterface!

  // MARK: - Business logic

  func doSomething(request: Home.Something.Request) {
  }
}
