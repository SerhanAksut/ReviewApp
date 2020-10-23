
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

// MARK: - UIKit Preview
#if DEBUG
import SwiftUI
import AppstoreAPI

struct ReviewListViewController_Preview: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        Text("Review List")
    }
}
#endif
