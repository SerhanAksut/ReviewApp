
import UIKit
import Coordinators
import AppstoreAPI

public struct ReviewListBuilder {
    
    public static func build(
        apiClient: APIClient,
        coordinator: ReviewListCoordinatorProtocol? = nil
    ) -> UIViewController {
        let viewModel = ReviewListViewModel(apiClient: apiClient)
        let controller = ReviewListViewController(viewModel: viewModel)
        controller.coordinator = coordinator
        return controller
    }
}
