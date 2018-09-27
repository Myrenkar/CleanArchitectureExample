import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    private let applicationDependencies = DefaultApplicationDependenciesProvider()
    private lazy var applicationController = ApplicationController(dependencies: self.applicationDependencies)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        applicationController.configureCache()

        window!.rootViewController = applicationController.rootViewController
        window!.makeKeyAndVisible()

        return true
    }

}
