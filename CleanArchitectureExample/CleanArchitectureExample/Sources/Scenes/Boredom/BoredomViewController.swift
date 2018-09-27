import UIKit

protocol BoredomViewControllerInput {
    func appendActivity(viewModel: Boredom.GetActivity.ViewModel)
}

protocol BoredomViewControllerOutput: class {
    func addActivity()
}

final class BoredomViewController: ViewController {
    weak var output: BoredomViewControllerOutput?
    var router: BoredomRouter!

    private let boredomView = BoredomView()
    private let configurator: BoredomConfiguratorProtocol

    private var activities: [Boredom.GetActivity.ViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.boredomView.tableView.reloadData()
            }
        }
    }

    init(configurator: BoredomConfiguratorProtocol) {
        self.configurator = configurator
        super.init()
        configurator.configure(viewController: self)
    }

    override func loadView() {
        view = boredomView
    }

    override func setupProperties() {
        super.setupProperties()

        boredomView.tableView.dataSource = self
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

extension BoredomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BoredomCell = tableView.dequeue()
        let currentActivity = activities[indexPath.row]

        cell.nameLabel.text = currentActivity.activity
        cell.typeLabel.text = currentActivity.type
        cell.participantsLabel.text = "Participants: \(currentActivity.participants)"
        cell.priceLabel.text = "Price: \(currentActivity.price)"

        return cell
    }
}

extension BoredomViewController: BoredomViewControllerInput {
    func appendActivity(viewModel: Boredom.GetActivity.ViewModel) {
        self.activities.append(viewModel)
    }
}

extension BoredomViewController {
    @objc private func addButtonTapped() {
        output?.addActivity()
    }
}
