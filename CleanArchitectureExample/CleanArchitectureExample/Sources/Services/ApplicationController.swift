import UIKit

final class ApplicationController {

    init(dependencies: ApplicationDependenciesProvider) {
        self.dependencies = dependencies
    }

    private let dependencies: ApplicationDependenciesProvider

    private(set) lazy var rootViewController: UINavigationController = {
        let viewController = BoredomViewController(configurator: dependencies.boredomConfigurator)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }()

    func configureCache() {
        URLCache.shared = URLCache(memoryCapacity: 20 * 1024 * 1024, diskCapacity: 20 * 1024 * 1024, diskPath: nil)
    }
    
}
