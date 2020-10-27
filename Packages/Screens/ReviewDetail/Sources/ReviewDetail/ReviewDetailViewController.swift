
import UIKit
import SwiftKit

final class ReviewDetailViewController: UIViewController {
    
    // MARK: - Properties
    private let viewSource = ReviewDetailView()
    
    private let viewModel: ReviewDetailViewModel
    
    // MARK: - Initialization
    init(viewModel: ReviewDetailViewModel) {
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
        title = Constants.title
        
        viewModel.loadDetails()
    }
}

// MARK: - ReviewDetailViewModel Output
extension ReviewDetailViewController: ReviewDetailViewModelOutput {
    func displayRating(with text: String) {
        viewSource.ratingLabel.text = text
        viewSource.ratingLabel.isHidden = text.trimmed.isEmpty
    }
    
    func displayAuthor(with authorName: String) {
        viewSource.authorLabel.text = authorName
        viewSource.authorLabel.isHidden = authorName.trimmed.isEmpty
    }
    
    func displayTitle(with title: String) {
        viewSource.titleLabel.text = title
        viewSource.titleLabel.isHidden = title.trimmed.isEmpty
    }
    
    func displayContent(with content: String) {
        viewSource.contentLabel.text = content
        viewSource.contentLabel.isHidden = content.trimmed.isEmpty
    }
}

// MARK: - Constants
private enum Constants {
    static let title = "Review Detail"
}

// MARK: - UIKit Preview
#if DEBUG
import SwiftUI
import UIKitPreview
import Entities

struct ReviewDetailViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            ReviewDetailBuilder.build(
                review: ReviewDetailModel(
                    rating: "⭐️⭐️⭐️⭐️⭐️",
                    author: "Author1",
                    title: "Title1",
                    content: "Content1"
                )
            )
        }
        .colorScheme(.dark)
        .edgesIgnoringSafeArea(.all)
    }
}
#endif
