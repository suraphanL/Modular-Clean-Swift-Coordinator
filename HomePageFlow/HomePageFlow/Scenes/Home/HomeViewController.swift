//
//  HomeViewController.swift
//  HomePageFlow
//
//  Created by Suraphan Laokondee on 13/9/19.
//  Copyright (c) 2019 SCB. All rights reserved.
//

import UIKit

protocol HomeViewControllerInterface: class {
  func displaySomething(viewModel: Home.Something.ViewModel)
}

class HomeViewController: UIViewController, HomeViewControllerInterface {
  var interactor: HomeInteractorInterface!
  var router: HomeRouter!

  // MARK: - Object lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  private func configure(viewController: HomeViewController) {
    let router = HomeRouter()
    router.viewController = viewController

    let presenter = HomePresenter()
    presenter.viewController = viewController

    let interactor = HomeInteractor()
    interactor.presenter = presenter
//    interactor.worker = HomeWorker(store: HomeStore())

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

    let request = Home.Something.Request()
    interactor.doSomething(request: request)
  }

  // MARK: - Display logic

  func displaySomething(viewModel: Home.Something.ViewModel) {
    // NOTE: Display the result from the Presenter

    // nameTextField.text = viewModel.name
  }

  // MARK: - Router

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.passDataToNextScene(segue: segue)
  }

  @IBAction func unwindToHomeViewController(from segue: UIStoryboardSegue) {
    print("unwind...")
    router.passDataToNextScene(segue: segue)
  }
}
