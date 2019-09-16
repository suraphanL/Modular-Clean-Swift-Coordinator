//
//  OtpViewController.swift
//  LoginFlow
//
//  Created by Suraphan Laokondee on 16/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol OtpViewControllerInterface: class {
  func displaySomething(viewModel: Otp.Something.ViewModel)
}

class OtpViewController: UIViewController, OtpViewControllerInterface {
  var interactor: OtpInteractorInterface!
  var router: OtpRouter!

  // MARK: - Object lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  private func configure(viewController: OtpViewController) {
    let router = OtpRouter()
    router.viewController = viewController

    let presenter = OtpPresenter()
    presenter.viewController = viewController

    let interactor = OtpInteractor()
    interactor.presenter = presenter
    

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

    let request = Otp.Something.Request()
    interactor.doSomething(request: request)
  }

  // MARK: - Display logic

  func displaySomething(viewModel: Otp.Something.ViewModel) {
    // NOTE: Display the result from the Presenter

    // nameTextField.text = viewModel.name
  }

  // MARK: - Router

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.passDataToNextScene(segue: segue)
  }

  @IBAction func unwindToOtpViewController(from segue: UIStoryboardSegue) {
    print("unwind...")
    router.passDataToNextScene(segue: segue)
  }
}
