import UIKit

protocol BoredTableViewDataSourceProtocol {
    func add(item: Boredom.GetActivity.ViewModel)
}

final class BoredTableViewDataSource: NSObject, UITableViewDataSource, BoredTableViewDataSourceProtocol {

    // MARK: - Properties

    private var items: [Boredom.GetActivity.ViewModel] = []

    // MARK: - Initialization

    override init() {
        items = []
        super.init()
    }

    // MARK: - BoredTableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BoredomCell = tableView.dequeue()
        let currentActivity = items[indexPath.row]

        cell.nameLabel.text = currentActivity.activity
        cell.typeLabel.text = currentActivity.type
        cell.participantsLabel.text = "Participants: \(currentActivity.participants)"
        cell.priceLabel.text = "Price: \(currentActivity.price)"

        return cell
    }

    // MARK: - BoredTableViewDataSourceProtocol

    func add(item: Boredom.GetActivity.ViewModel) {
        items.append(item)
    }
}
