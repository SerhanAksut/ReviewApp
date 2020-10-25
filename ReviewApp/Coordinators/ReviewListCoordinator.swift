
import UIKit
import AppstoreAPILive
import Coordinators
import ReviewList

final class ReviewListCoordinator: ReviewListCoordinatorProtocol {
    private var navigationController: UINavigationController?
    
    func start(window: UIWindow) {
        let reviewList = ReviewListBuilder.build(
            apiClient: .live,
            coordinator: self
        )
        let navigationController = UINavigationController(
            rootViewController: reviewList
        )
        navigationController.navigationBar.barTintColor = .white
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.tintColor = .black
        window.rootViewController = navigationController
        self.navigationController = navigationController
    }
    
    func showReviewDetail(with reviewID: String) {
        
    }
    
    func showSortingOptions(_ selectedIndex: Int) {
        
    }
}
