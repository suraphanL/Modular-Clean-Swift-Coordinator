//
//  SignUpInteractor.swift
//  LoginFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol SignUpInteractorInterface {
  func doSomething(request: SignUp.Something.Request)
}

class SignUpInteractor: SignUpInteractorInterface {
  var presenter: SignUpPresenterInterface!

  // MARK: - Business logic

  func doSomething(request: SignUp.Something.Request) {
  }
}
