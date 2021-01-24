
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .appWhiteColor
        let viewModel = ReviewListViewModel(apiClient: .live)
        let controller = ReviewListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.barTintColor = .appWhiteColor
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.tintColor = .appBlackColor
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
