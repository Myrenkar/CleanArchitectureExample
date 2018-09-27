import UIKit

class ViewController: UIViewController {

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupProperties()
        setupNavigationItem()
        setupBindings()
    }

    // MARK: - Setup

    func setupProperties() {}

    func setupNavigationItem() {}

    func setupBindings() {}

    // MARK: - Unavailable

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
