
import UIKit
import UIKitHelper
import AppstoreAPI

final class ReviewListCell: UITableViewCell {
    
    // MARK: - Properties
    private let ratingLabel = with(
        makeLabel(font: .systemFont(ofSize: 18))
    ) {
        $0.setContentHuggingPriority(.required, for: .horizontal)
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    private let versionLabel = makeLabel(font: .italicSystemFont(ofSize: 15))
    
    private let authorLabel = makeLabel(font: .systemFont(ofSize: 15))
    private let titleLabel = makeLabel(font: .boldSystemFont(ofSize: 16))
    private let contentLabel = makeLabel(font: .systemFont(ofSize: 14))
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Populate UI
extension ReviewListCell {
    func populate(with review: Review) {
        
    }
}

// MARK: - Make Label
private func makeLabel(
    font: UIFont
) -> UILabel {
    with(UILabel()) {
        $0.textAlignment = .left
        $0.font = font
    }
}
