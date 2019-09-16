//
//  DetailInteractor.swift
//  SubFlow
//
//  Created by Suraphan Laokondee on 16/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol DetailInteractorInterface {
  func doSomething(request: Detail.Something.Request)
  
}

class DetailInteractor: DetailInteractorInterface {
  var presenter: DetailPresenterInterface!

  // MARK: - Business logic

  func doSomething(request: Detail.Something.Request) {
    
  }
}
