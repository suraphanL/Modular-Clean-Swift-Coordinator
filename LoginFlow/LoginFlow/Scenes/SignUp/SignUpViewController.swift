//
//  SignUpViewController.swift
//  LoginFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol SignUpModuleOutput: class {
  func proceedToOtp(module: SignUpViewController)
}

protocol SignUpViewControllerInterface: class {
  func displaySomething(viewModel: SignUp.Something.ViewModel)
}

class SignUpViewController: UIViewController, SignUpViewControllerInterface {
  var interactor: SignUpInteractorInterface!
  var router: SignUpRouter!
  weak var coordinator: SignUpModuleOutput?
  
  // MARK: - Object lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  private func configure(viewController: SignUpViewController) {
    let router = SignUpRouter()
    router.viewController = viewController

    let presenter = SignUpPresenter()
    presenter.viewController = viewController

    let interactor = SignUpInteractor()
    interactor.presenter = presenter
//    interactor.worker = SignUpWorker(store: SignUpStore())

    viewController.interactor = interactor
    viewController.router = router
  }

  // MARK: - View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    doSomethingOnLoad()
  }

  // MARK: - Event handling

  @IBAction func otpClick(_ sender: UIButton) {
//    router.navigateToSomewhere()
    coordinator?.proceedToOtp(module: self)
  }
  
  func doSomethingOnLoad() {
    // NOTE: Ask the Interactor to do some work

    let request = SignUp.Something.Request()
    interactor.doSomething(request: request)
  }

  // MARK: - Display logic

  func displaySomething(viewModel: SignUp.Something.ViewModel) {
    // NOTE: Display the result from the Presenter

    // nameTextField.text = viewModel.name
  }

  // MARK: - Router

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.passDataToNextScene(segue: segue)
  }

  @IBAction func unwindToSignUpViewController(from segue: UIStoryboardSegue) {
    print("unwind...")
    router.passDataToNextScene(segue: segue)
  }
}
