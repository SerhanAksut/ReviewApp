
import UIKit
import Coordinators
import AppstoreAPI

public struct ReviewListBuilder {
    
    public static func build(
        apiClient: AppstoreAPI,
        coordinator: ReviewListCoordinatorProtocol? = nil
    ) -> UIViewController {
        let viewModel = ReviewListViewModel(apiClient: apiClient)
        let controller = ReviewListViewController(viewModel: viewModel)
        controller.coordinator = coordinator
        let navController = UINavigationController(rootViewController: controller)
        return navController
    }
}
