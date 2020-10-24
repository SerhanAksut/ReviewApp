
import AppstoreAPI

// MARK: - IO
protocol ReviewListViewModelInput {
    func loadReviewList()
    func didSelectReview(at index: Int)
}

protocol ReviewListViewModelOutput: class {
    func displayLoading()
    func hideLoading()
    func reloadUI(with reviews: [Review])
    func displayError(with message: String)
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
    
    func didSelectReview(at index: Int) {
        let review = state.reviews[index]
        output?.showReviewDetail(with: review.id)
    }
}

// MARK: - Internal Helpers
private extension ReviewListViewModel {
    func stateUpdated(_ newState: State) {
        output?.reloadUI(with: [])
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
            output?.displayError(with: message)
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
}
