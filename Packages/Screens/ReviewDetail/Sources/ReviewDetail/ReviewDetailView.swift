
import UIKit
import UIKitHelper

final class ReviewDetailView: UIView {
    
    // MARK: - Properties
    private let scrollView = with(UIScrollView()) {
        $0.alwaysBounceVertical = true
    }
    
    let ratingLabel = makeLabel(font: .systemFont(ofSize: 20))
    let authorLabel = makeLabel(font: .systemFont(ofSize: 17))
    let titleLabel = makeLabel(font: .boldSystemFont(ofSize: 18))
    let contentLabel = makeLabel(font: .systemFont(ofSize: 16))
    
    private lazy var vStack = with(
        UIStackView(arrangedSubviews: [
            ratingLabel,
            authorLabel,
            titleLabel,
            contentLabel
        ])
    ) {
        $0.axis = .vertical
        $0.spacing = 15
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    private let defaultInset: CGFloat = 16
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        addSubview(scrollView)
        scrollView.addSubview(vStack)
        
        let stackWidth = UIScreen.main.bounds.size.width - (defaultInset * 2)
        var constraints = scrollView.alignFitEdges()
        constraints += [
            vStack.alignLeading(offset: defaultInset),
            vStack.alignTrailing(offset: defaultInset),
            vStack.alignTop(offset: defaultInset),
            vStack.alignLessOrEqualBottom(offset: defaultInset),
            vStack.alignWidth(size: stackWidth)
        ]
        constraints.activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Make Label
private func makeLabel(
    font: UIFont
) -> UILabel {
    with(UILabel()) {
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.textColor = .appBlackColor
        $0.font = font
        $0.setContentHuggingPriority(.required, for: .vertical)
        $0.isHidden = true
    }
}
