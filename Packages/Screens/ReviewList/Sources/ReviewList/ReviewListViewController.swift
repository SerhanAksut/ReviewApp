
import UIKit
import Coordinators

final class ReviewListViewController: UIViewController {
    
    // MARK: - Properties
    private let viewSource = ReviewListView()
    
    private let viewModel: ReviewListViewModel
    weak var coordinator: ReviewListCoordinatorProtocol?
    
    // MARK: - Initialization
    init(viewModel: ReviewListViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewSource
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Review List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}

// MARK: - ReviewListViewModel Output
extension ReviewListViewController: ReviewListViewModelOutput {
    func displayLoading() {
        // TODO: Show Loading
    }
    
    func hideLoading() {
        // TODO: Hide Loading
    }
    
    func reloadUI(with reviews: [Review]) {
        // TODO: Reload UI
    }
    
    func displayError(with message: String) {
        // TODO: Show Error Alert
    }
    
    func showReviewDetail(with reviewID: String) {
        // TODO: Navigate to Review Detail
    }
}

// MARK: - UIKit Preview
#if DEBUG
import SwiftUI
import UIKitPreview
import AppstoreAPI

struct ReviewListViewController_Preview: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        UIViewControllerPreview {
            ReviewListBuilder.build(
                apiClient: .delayed(client: .error)
            )
        }
        .colorScheme(.dark)
        .edgesIgnoringSafeArea(.all)
    }
}
#endif
