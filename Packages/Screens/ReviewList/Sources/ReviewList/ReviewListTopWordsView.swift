
import UIKit
import UIKitHelper

final class ReviewListTopWordsView: UIView {
    
    // MARK: - Properties
    private let titleLabel = with(UILabel()) {
        $0.textAlignment = .left
        $0.textColor = .appBlackColor
        $0.font = .boldSystemFont(ofSize: 17)
        $0.text = Constants.title
    }
    
    private let wordsHStack = makeStackView(
        subViews: [],
        axis: .horizontal,
        spacing: 10,
        distribution: .fill
    )
    
    private lazy var vStack = makeStackView(
        subViews: [titleLabel, wordsHStack],
        axis: .vertical,
        spacing: 16
    )
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        addSubview(vStack)
        vStack.alignFitEdges(insetedBy: 16).activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Populate UI
extension ReviewListTopWordsView {
    func populate(with words: [String]) {
        wordsHStack.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        words.forEach {
            let tagLabel = TagLabel()
            tagLabel.text = "#\($0)"
            wordsHStack.addArrangedSubview(tagLabel)
        }
        wordsHStack.addArrangedSubview(UIView())
    }
}

// MARK: - Tag Label
private final class TagLabel: UILabel {
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        textAlignment = .center
        textColor = .appWhiteColor
        font = .boldSystemFont(ofSize: 13)
        setContentHuggingPriority(.required, for: .horizontal)
        
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        backgroundColor = .appBlackColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += 10
            contentSize.width += 20
            return contentSize
        }
    }
}

// MARK: - Make StackView
private func makeStackView(
    subViews: [UIView] = [],
    axis: NSLayoutConstraint.Axis,
    spacing: CGFloat,
    alignment: UIStackView.Alignment = .fill,
    distribution: UIStackView.Distribution = .fill
) -> UIStackView {
    with(UIStackView(arrangedSubviews: subViews)) {
        $0.axis = axis
        $0.spacing = spacing
        $0.alignment = alignment
        $0.distribution = distribution
    }
}

// MARK: - Constants
private enum Constants {
    static let title = "Top Words:"
}
