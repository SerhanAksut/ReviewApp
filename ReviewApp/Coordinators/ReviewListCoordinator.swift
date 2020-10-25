
import UIKit
import AppstoreAPILive
import Coordinators
import ReviewList
import FilterOptions

final class ReviewListCoordinator: ReviewListCoordinatorProtocol {
    private var navigationController: UINavigationController?
    
    func start(window: UIWindow) {
        let controller = ReviewListBuilder.build(
            apiClient: .live,
            coordinator: self
        )
        let navigationController = UINavigationController(
            rootViewController: controller
        )
        navigationController.navigationBar.barTintColor = .appWhiteColor
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.tintColor = .appBlackColor
        window.rootViewController = navigationController
        self.navigationController = navigationController
    }
    
    func showReviewDetail(with reviewID: String) {
        
    }
    
    func showFilterOptions(
        items: [String],
        selectedIndex: Int?,
        completion: @escaping (Int?) -> Void
    ) {
        let controller = FilterOptionsBuilder.build(
            items: items,
            selectedIndex: selectedIndex,
            completion: completion
        )
        navigationController?.present(controller, animated: true)
    }
}
