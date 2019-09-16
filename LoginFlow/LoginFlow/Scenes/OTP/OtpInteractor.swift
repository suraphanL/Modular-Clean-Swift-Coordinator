//
//  OtpInteractor.swift
//  LoginFlow
//
//  Created by Suraphan Laokondee on 16/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol OtpInteractorInterface {
  func doSomething(request: Otp.Something.Request)
}

class OtpInteractor: OtpInteractorInterface {
  var presenter: OtpPresenterInterface!
 

  // MARK: - Business logic

  func doSomething(request: Otp.Something.Request) {
    
  }
}
