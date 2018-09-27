import UIKit

class View: UIView {

    // MARK: - Init

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupProperties()
        setupLayoutConstraints()
    }

    // MARK: - Setup

    func setupViewHierarchy() {}
    func setupLayoutConstraints() {}
    func setupProperties() {}

    // MARK: - Unavailable

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
