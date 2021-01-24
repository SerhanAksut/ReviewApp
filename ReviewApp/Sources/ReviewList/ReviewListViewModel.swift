
import AppstoreAPI
import SwiftKit
import Entities

// MARK: - IO
protocol ReviewListViewModelInput {
    func loadReviewList()
    var numberOfReview: Int { get }
    func review(at index: Int) -> Review
}

protocol ReviewListViewModelOutput: AnyObject {
    func displayLoading()
    func hideLoading()
    func reloadUI(tags: [String], reviews: [Review])
    func displayError(title: String, message: String, buttonTitle: String)
}

final class ReviewListViewModel {
    
    // MARK: - Properties
    private let apiClient: APIClient
    weak var output: ReviewListViewModelOutput?
    private var allReviews: [Review] = []
    
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

// MARK: - ReviewListViewModel Inputs
extension ReviewListViewModel: ReviewListViewModelInput {
    func loadReviewList() {
        state = .loading
        apiClient.reviewList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let reviews):
                self.allReviews = reviews
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
            output?.reloadUI(tags: [], reviews: reviews)
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
            switch self {
            case .loaded(let reviews):
                return reviews
            default:
                return []
            }
        }
    }
}
