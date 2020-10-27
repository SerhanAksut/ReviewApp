
import Entities

// MARK: - IO
protocol ReviewDetailViewModelInput {
    func loadDetails()
}

protocol ReviewDetailViewModelOutput: class {
    func displayRating(with text: String)
    func displayAuthor(with authorName: String)
    func displayTitle(with title: String)
    func displayContent(with content: String)
}

final class ReviewDetailViewModel {
    
    // MARK: - Properties
    private let review: Review
    weak var output: ReviewDetailViewModelOutput?
    
    // MARK: - Initialization
    init(with review: Review) {
        self.review = review
    }
}

// MARK: - ReviewDetailViewModel Input
extension ReviewDetailViewModel: ReviewDetailViewModelInput {
    func loadDetails() {
        output?.displayRating(with: review.ratingVersionText)
        output?.displayAuthor(with: review.author)
        output?.displayTitle(with: review.title)
        output?.displayContent(with: review.content)
    }
}
