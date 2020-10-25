
import UIKit
import UIKitHelper
import Coordinators

private typealias Handlers = LoadingHandler & ErrorHandler

final class ReviewListViewController: UIViewController, Handlers {
    
    // MARK: - Properties
    private lazy var viewSource = with(ReviewListView()) {
        $0.tableView.dataSource = self
        $0.tableView.delegate = self
    }
    
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
        
        viewModel.output = self
        viewModel.loadReviewList()
        
        title = "Review List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}

// MARK: - UITableView Datasource
extension ReviewListViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.numberOfReview
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: ReviewListCell = tableView.dequeue(at: indexPath)
        let review = viewModel.review(at: indexPath.row)
        cell.populate(with: review)
        return cell
    }
}

// MARK: - UITableView Delegate
extension ReviewListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        viewModel.didSelectReview(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - ReviewListViewModel Output
extension ReviewListViewController: ReviewListViewModelOutput {
    func displayLoading() {
        showLoading()
    }
    
    func hideLoading() {
        removeLoading()
    }
    
    func reloadUI(with reviews: [Review]) {
        viewSource.tableView.reloadData()
    }
    
    func displayError(title: String, message: String, buttonTitle: String) {
        showAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func showReviewDetail(with reviewID: String) {
        coordinator?.showReviewDetail(with: reviewID)
    }
}

// MARK: - UIKit Preview
#if DEBUG
import SwiftUI
import UIKitPreview
import AppstoreAPI

struct ReviewListViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            ReviewListBuilder.build(
                apiClient: .happyPath
            )
        }
        .edgesIgnoringSafeArea(.all)
    }
}
#endif
