
import UIKit
import UIKitHelper
import Coordinators
import Entities

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
        view.backgroundColor = .appWhiteColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.output = self
        viewModel.loadReviewList()
        
        title = Constants.title
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "filter"),
            style: .plain,
            target: self,
            action: #selector(didSelectFilterButton)
        )
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
    
    func reloadUI(tags: [String], reviews: [Review]) {
        viewSource.reloadUI(tags: tags, reviews: reviews)
    }
    
    func displayError(title: String, message: String, buttonTitle: String) {
        showAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func showReviewDetail(with review: Review) {
        coordinator?.showReviewDetail(with: review)
    }
    
    func showFilterOptions(items: [String], selectedIndex: Int) {
        coordinator?.showFilterOptions(
            items: items,
            selectedIndex: selectedIndex,
            completion: { [weak viewModel] selectedIndex in
                guard let index = selectedIndex else { return }
                viewModel?.filterOptionSelected(at: index)
            }
        )
    }
}

// MARK: - Actions
extension ReviewListViewController {
    @objc func didSelectFilterButton() {
        viewModel.didSelectFilterButton()
    }
}

// MARK: - Constants
private enum Constants {
    static let title = "Review List"
}

// MARK: - UIKit Preview
#if DEBUG
import SwiftUI
import UIKitPreview
import AppstoreAPI

struct ReviewListViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            UINavigationController(
                rootViewController: ReviewListBuilder.build(
                    apiClient: .happyPath
                )
            )
        }
        .colorScheme(.light)
        .edgesIgnoringSafeArea(.all)
    }
}
#endif
