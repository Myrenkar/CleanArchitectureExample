import Foundation

protocol BoredomRoutingLogic {
    func show(activityDetails activity: Boredom.GetActivity.Response)
}

final class BoredomRouter: NSObject, BoredomRoutingLogic {

    // MARK: - Properties

    weak var viewController: BoredomViewController?

    // MARK: BoredomRoutingLogic

    func show(activityDetails activity: Boredom.GetActivity.Response) {
        // TODO: Show details view controller
    }
}
