
import UIKit
import UIKitHelper
import Coordinators
import Entities

private typealias ActionHandlers = LoadingHandler & ErrorHandler

final class ReviewListViewController: UIViewController, ActionHandlers {
    
    // MARK: - Properties
    private lazy var viewSource = with(ReviewListView()) {
        $0.tableView.dataSource = self
        $0.tableView.delegate = self
    }
    
    private let viewModel: ReviewListViewModel
    
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
        view.backgroundColor = .appWhiteColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.output = self
        viewModel.loadReviewList()
        
        title = "Review List"
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
    
    func reloadUI(tags: [String], reviews: [Review]) {
        viewSource.tableView.reloadData()
    }
    
    func displayError(title: String, message: String, buttonTitle: String) {
        showAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
}
