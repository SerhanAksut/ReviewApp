
import AppstoreAPI

// MARK: - IO
protocol ReviewListViewModelInput {
    func loadReviewList()
    var numberOfReview: Int { get }
    func review(at index: Int) -> Review
    func didSelectReview(at index: Int)
}

protocol ReviewListViewModelOutput: class {
    func displayLoading()
    func hideLoading()
    func reloadUI(with reviews: [Review])
    func displayError(title: String, message: String, buttonTitle: String)
    func showReviewDetail(with reviewID: String)
}

final class ReviewListViewModel {
    
    // MARK: - Properties
    private let apiClient: APIClient
    weak var output: ReviewListViewModelOutput?
    
    private var state: State = .idle {
        didSet {
            stateUpdated(state)
        }
    }
    
    // MARK: - Initialization
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}

// MARK: - ReviewListViewModel Input
extension ReviewListViewModel: ReviewListViewModelInput {
    func loadReviewList() {
        state = .loading
        apiClient.reviewList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let reviews):
                self.state = .loaded(reviews)
            case .failure(let error):
                self.state = .error(error.message)
            }
        }
    }
    
    var numberOfReview: Int {
        state.reviews.count
    }
    
    func review(at index: Int) -> Review {
        state.reviews[index]
    }
    
    func didSelectReview(at index: Int) {
        let review = state.reviews[index]
        output?.showReviewDetail(with: review.id)
    }
}

// MARK: - Internal Helpers
private extension ReviewListViewModel {
    func stateUpdated(_ newState: State) {
        switch newState {
        case .idle:
            break
        case .loading:
            output?.displayLoading()
        case .loaded(let reviews):
            output?.reloadUI(with: reviews)
            output?.hideLoading()
        case .error(let message):
            output?.hideLoading()
            output?.displayError(
                title: Constants.errorTitle,
                message: message,
                buttonTitle: Constants.errorAlertButtonTitle
            )
        }
    }
}

// MARK: - Enums
private extension ReviewListViewModel {
    /// State of the currently displayed Review list.
    enum State {
        case idle
        case loading
        case loaded([Review])
        case error(String)
        
        var reviews: [Review] {
            guard case let .loaded(reviews) = self else { return [] }
            return reviews
        }
    }
    
    enum Constants {
        static let errorTitle = "Error"
        static let errorAlertButtonTitle = "Ok"
    }
}
