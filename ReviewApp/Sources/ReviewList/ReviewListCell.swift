
import UIKit

final class ReviewListCell: UITableViewCell {
    
    // MARK: - Properties
    static let cellId = "ReviewListCellid"
    
    private let ratingVersionLabel = makeLabel(font: .systemFont(ofSize: 18))
    private let authorLabel = makeLabel(font: .systemFont(ofSize: 15))
    
    private let titleLabel = makeLabel(
        font: .boldSystemFont(ofSize: 16),
        numberOfLines: 2
    )
    
    private let contentLabel = makeLabel(
        font: .systemFont(ofSize: 14),
        numberOfLines: 3
    )
    
    private lazy var vStack = with(
        UIStackView(arrangedSubviews: [
            ratingVersionLabel,
            authorLabel,
            titleLabel,
            contentLabel
        ])
    ) {
        $0.axis = .vertical
        $0.spacing = 5
        $0.alignment = .fill
        $0.distribution = .fill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            vStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            vStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            vStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Populate UI
extension ReviewListCell {
    func populate(with review: Review) {
        ratingVersionLabel.text = review.ratingVersionText
        authorLabel.text = review.authorText
        titleLabel.text = review.title
        contentLabel.text = review.content
    }
}

// MARK: - Make Label
private func makeLabel(
    font: UIFont,
    numberOfLines: Int = 1
) -> UILabel {
    with(UILabel()) {
        $0.textAlignment = .left
        $0.numberOfLines = numberOfLines
        $0.textColor = .appBlackColor
        $0.font = font
        $0.setContentHuggingPriority(.required, for: .vertical)
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
    }
}

// MARK: - Accessibility
extension ReviewListCell {
    func setupAccessibility(with review: Review) {
        isAccessibilityElement = true
        accessibilityLabel = "\(review.author) tarafından, \(review.version) sürümünde yapılan, \(review.rating) yıldızlı yorum. \(review.title), \(review.content)"
    }
}
