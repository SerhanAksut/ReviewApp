
import UIKit
import UIKitHelper

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    let reviewListCoordinator = ReviewListCoordinator()
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .appWhiteColor
        window.makeKeyAndVisible()
        reviewListCoordinator.start(window: window)
        
        self.window = window
    }
}
