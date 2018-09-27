import Foundation

protocol BoredomRoutingLogic {
    func show(activityDetails activity: Boredom.GetActivity.Response)
}

final class BoredomRouter: NSObject, BoredomRoutingLogic {
    weak var viewController: BoredomViewController?

    // MARK: Routing

    func show(activityDetails activity: Boredom.GetActivity.Response) {
        print(activity.type)
    }
}
