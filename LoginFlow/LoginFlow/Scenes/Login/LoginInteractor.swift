//
//  LoginInteractor.swift
//  LoginFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol LoginInteractorInterface {
  func doSomething(request: Login.Something.Request)
}

class LoginInteractor: LoginInteractorInterface {
  var presenter: LoginPresenterInterface!
  
  // MARK: - Business logic

  func doSomething(request: Login.Something.Request) {
  }
}
