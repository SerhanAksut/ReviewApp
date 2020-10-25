
import UIKit
import UIKitHelper

// MARK: - Event Handler
protocol FilterOptionsViewDelegate: class {
    func didSelectOption(at index: Int)
}

final class FilterOptionsView: UIView {
    
    // MARK: - Properties
    private let vStack = UIStackView(arrangedSubviews: [])
    
    private let contentView = with(UIView()) {
        $0.backgroundColor = .appBlackColor
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    weak var delegate: FilterOptionsViewDelegate?
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        addSubview(contentView)
        contentView.addSubview(vStack)
        
        var constraints = [
            vStack.alignFitEdges(),
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
    @objc func didSelectOption(sender: UIView) {
        delegate?.didSelectOption(at: sender.tag)
    }
}

// MARK: - FilterOptionItemView
private final class FilterOptionItemView: UIView {
    
    // MARK: - Properties
    private let optionNameLabel = with(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .appBlackColor
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.setContentHuggingPriority(.required, for: .vertical)
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
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
        hStack.alignEdges(
            leading: 16,
            trailing: 16,
            top: 10,
            bottom: 10
        )
        .activate()
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
