import UIKit

protocol BoredomConfiguratorProtocol {
    func configure(viewController: BoredomViewController)
}

final class BoredomConfigurator: BoredomConfiguratorProtocol {

    // MARK: - Properties

    private let router: BoredomRouter
    private let presenter: BoredomPresenter
    private let interactor: BoredomInteractor

    // MARK: - Initialization

    init(router: BoredomRouter, presenter: BoredomPresenter, interactor: BoredomInteractor) {
        self.router = router
        self.presenter = presenter
        self.interactor = interactor
    }

    // MARK: - BoredomConfiguratorProtocol

    func configure(viewController: BoredomViewController) {
        router.viewController = viewController

        presenter.output = viewController
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}

extension BoredomViewController: BoredomPresenterOutput {
    func addActivity(response: Boredom.GetActivity.ViewModel) {
        appendActivity(viewModel: response)
    }
}

extension BoredomPresenter: BoredomInteractorOutput {
    func addActivity(response: Boredom.GetActivity.Response) {
        getActivity(response: response)
    }

    func handle(error: Error) {
        print(error.localizedDescription)
    }
}

extension BoredomInteractor: BoredomViewControllerOutput {
    func addActivity() {
        getActivity(request: Boredom.GetActivity.Request())
    }
}
