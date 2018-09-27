import Foundation

/// Describes a type that is providing application dependencies.
protocol ApplicationDependenciesProvider {
    var apiClient: APIClient { get }
    var boredomConfigurator: BoredomConfiguratorProtocol { get }
}

final class DefaultApplicationDependenciesProvider: ApplicationDependenciesProvider {
    private(set) lazy var apiClient: APIClient = { [unowned self] in
        return DefaultAPIClient()
    }()

    private(set) lazy var boredomConfigurator: BoredomConfiguratorProtocol = {
        return BoredomConfigurator(router: BoredomRouter(), presenter: BoredomPresenter(), interactor: BoredomInteractor())
    }()
}
