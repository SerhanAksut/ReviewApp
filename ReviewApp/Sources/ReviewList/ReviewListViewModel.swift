
// MARK: - IO
protocol ReviewListViewModelInput: AnyObject {
    func loadReviewList()
    var numberOfReview: Int { get }
    func review(at index: Int) -> Review
}

protocol ReviewListViewModelOutput: AnyObject {
    func displayLoading()
    func hideLoading()
    func reloadUI()
    func displayError(title: String, message: String, buttonTitle: String)
}

final class ReviewListViewModel {
    
    // MARK: - Properties
    private let network: AppStoreApi
    weak var output: ReviewListViewModelOutput?
    private var allReviews: [Review] = []
    
    private var state: State = .idle {
        didSet {
            stateUpdated(state)
        }
    }
    
    // MARK: - Initialization
    init(network: AppStoreApi) {
        self.network = network
    }
}

// MARK: - ReviewListViewModel Inputs
extension ReviewListViewModel: ReviewListViewModelInput {
    func loadReviewList() {
        state = .loading
                
        network.fetchReviewList() { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let reviews):
                self.allReviews = reviews
                self.state = .loaded(reviews)
            case .failure(let error):
                self.state = .error(error.localizedDescription)
            }
        }
    }
    
    var numberOfReview: Int {
        state.reviews.count
    }
    
    func review(at index: Int) -> Review {
        state.reviews[index]
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
        case .loaded:
            output?.reloadUI()
            output?.hideLoading()
        case .error(let message):
            output?.hideLoading()
            output?.displayError(
                title: "Hata",
                message: message,
                buttonTitle: "Tamam"
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
            if case .loaded(let reviewList) = self {
                return reviewList
            }
            return []
        }
    }
}
