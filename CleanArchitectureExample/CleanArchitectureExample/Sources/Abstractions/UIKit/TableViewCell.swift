import UIKit

class TableViewCell: UITableViewCell {
    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupProperties()
        setupViewHierarchy()
        setupLayoutConstraints()
    }

    // MARK: Abstract

    func setupProperties() {
        // no-op by default
    }

    func setupViewHierarchy() {
        // no-op by default
    }

    func setupLayoutConstraints() {
        // no-op by default
    }

    @available(*, unavailable, message: "Use init(style:reuseIdentifier) instead")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableViewCell: Reusable {}

