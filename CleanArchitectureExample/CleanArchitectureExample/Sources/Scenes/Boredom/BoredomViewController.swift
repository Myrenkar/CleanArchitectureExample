import UIKit

protocol BoredomViewControllerInput {
    func appendActivity(viewModel: Boredom.GetActivity.ViewModel)
}

protocol BoredomViewControllerOutput: class {
    func addActivity()
}

final class BoredomViewController: ViewController {

    // MARK: - Properties

    weak var output: BoredomViewControllerOutput?
    var router: BoredomRouter!

    private let boredomView = BoredomView()
    private let dataSource: UITableViewDataSource & BoredTableViewDataSourceProtocol
    private let configurator: BoredomConfiguratorProtocol

    // MARK: - Initialization

    init(configurator: BoredomConfiguratorProtocol, dataSource: UITableViewDataSource & BoredTableViewDataSourceProtocol = BoredTableViewDataSource()) {
        self.configurator = configurator
        self.dataSource = dataSource
        super.init()
        configurator.configure(viewController: self)
    }

    // MARK: - Overrides

    override func loadView() {
        view = boredomView
    }

    override func setupProperties() {
        super.setupProperties()

        boredomView.tableView.dataSource = dataSource
        boredomView.tableView.registerClass(BoredomCell.self)
    }

    override func setupNavigationItem() {
        super.setupNavigationItem()

        title = "Are you bored? Check some activities"

        boredomView.addButton.action = #selector(addButtonTapped)
        boredomView.addButton.target = self
        navigationItem.rightBarButtonItem = boredomView.addButton
    }

}

extension BoredomViewController: BoredomViewControllerInput {
    func appendActivity(viewModel: Boredom.GetActivity.ViewModel) {
        dataSource.add(item: viewModel)
        DispatchQueue.main.async {
            self.boredomView.tableView.reloadData()
        }
    }
}

extension BoredomViewController {
    @objc private func addButtonTapped() {
        output?.addActivity()
    }
}
