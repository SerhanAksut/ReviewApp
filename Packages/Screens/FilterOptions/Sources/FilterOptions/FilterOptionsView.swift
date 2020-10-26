
import UIKit
import UIKitHelper

// MARK: - Event Handler
protocol FilterOptionsViewDelegate: class {
    func didSelectOption(at index: Int)
}

final class FilterOptionsView: UIView {
    
    // MARK: - Properties
    private let titleLabel = makeLabel(
        textAlignment: .center,
        font: .boldSystemFont(ofSize: 17),
        numberOfLines: 1,
        text: Constants.title
    )
    
    private lazy var vStack = with(
        UIStackView(arrangedSubviews: [
            titleLabel
        ])
    ) {
        $0.axis = .vertical
        $0.spacing = 16
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    let contentView = with(UIView()) {
        $0.backgroundColor = .appWhiteColor
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    weak var delegate: FilterOptionsViewDelegate?
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        addSubview(contentView)
        contentView.addSubview(vStack)
        
        var constraints = [
            vStack.alignFitEdges(insetedBy: 16),
            contentView.alignCenter()
        ]
        .flatMap { $0 }
        
        constraints += [
            contentView.alignLeading(offset: 30),
            contentView.alignTrailing(offset: 30)
        ]
        constraints.activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Populate UI
extension FilterOptionsView {
    func populate(with datasource: [FilterOptionItemModel]) {
        datasource.enumerated().forEach { index, optionItem in
            let itemView = FilterOptionItemView()
            itemView.populate(with: optionItem)
            itemView.tag = index
            let tapGesture = UITapGestureRecognizer(
                target: self,
                action: #selector(didSelectOption(sender:))
            )
            tapGesture.numberOfTapsRequired = 1
            itemView.addGestureRecognizer(tapGesture)
            vStack.addArrangedSubview(itemView)
        }
    }
}

// MARK: - Actions
extension FilterOptionsView {
    @objc func didSelectOption(sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag else { return }
        delegate?.didSelectOption(at: tag)
    }
}

// MARK: - FilterOptionItemView
private final class FilterOptionItemView: UIView {
    
    // MARK: - Properties
    private let optionNameLabel = makeLabel(
        textAlignment: .left,
        font: .systemFont(ofSize: 14),
        numberOfLines: 0
    )
    
    private let checkIcon = with(UIImageView()) {
        $0.contentMode = .right
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
        $0.setContentHuggingPriority(.required, for: .horizontal)
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    private lazy var hStack = with(
        UIStackView(arrangedSubviews: [
            optionNameLabel,
            checkIcon
        ])
    ) {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .center
        $0.distribution = .fill
    }
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        addSubview(hStack)
        hStack.alignFitEdges().activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Populate UI
extension FilterOptionItemView {
    func populate(with optionItem: FilterOptionItemModel) {
        optionNameLabel.text = optionItem.itemName
        checkIcon.image = optionItem.isChecked
            ? UIImage(named: "checked")
            : UIImage(named: "unchecked")
    }
}

// MARK: - Make Label
private func makeLabel(
    textAlignment: NSTextAlignment,
    font: UIFont,
    numberOfLines: Int,
    text: String? = nil
) -> UILabel {
    with(UILabel()) {
        $0.textAlignment = textAlignment
        $0.textColor = .appBlackColor
        $0.font = font
        $0.numberOfLines = numberOfLines
        $0.text = text
        $0.setContentHuggingPriority(.required, for: .vertical)
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
    }
}

// MARK: - Constants
private enum Constants {
    static let title = "Filter Options"
}
