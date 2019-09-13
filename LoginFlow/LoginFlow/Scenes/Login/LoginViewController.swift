//
//  LoginViewController.swift
//  LoginFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol LoginViewControllerInterface: class {
  func displaySomething(viewModel: Login.Something.ViewModel)
}

class LoginViewController: UIViewController, LoginViewControllerInterface {
  var interactor: LoginInteractorInterface!
  var router: LoginRouter!

  // MARK: - Object lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  private func configure(viewController: LoginViewController) {
    let router = LoginRouter()
    router.viewController = viewController

    let presenter = LoginPresenter()
    presenter.viewController = viewController

    let interactor = LoginInteractor()
    interactor.presenter = presenter
//    interactor.worker = LoginWorker(store: LoginStore())

    viewController.interactor = interactor
    viewController.router = router
  }

  // MARK: - View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    doSomethingOnLoad()
  }

  // MARK: - Event handling

  func doSomethingOnLoad() {
    // NOTE: Ask the Interactor to do some work

    let request = Login.Something.Request()
    interactor.doSomething(request: request)
  }

  // MARK: - Display logic

  func displaySomething(viewModel: Login.Something.ViewModel) {
    // NOTE: Display the result from the Presenter

    // nameTextField.text = viewModel.name
  }

  // MARK: - Router

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.passDataToNextScene(segue: segue)
  }

  @IBAction func unwindToLoginViewController(from segue: UIStoryboardSegue) {
    print("unwind...")
    router.passDataToNextScene(segue: segue)
  }
}
