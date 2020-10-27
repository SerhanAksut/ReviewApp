
import UIKit
import UIKitHelper
import Entities

final class ReviewListView: UIView {
    
    // MARK: - Properties
    let topWordsView = with(ReviewListTopWordsView()) {
        $0.isHidden = true
    }
    
    let tableView = with(UITableView(frame: .zero, style: .plain)) {
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 160
        $0.register(
            ReviewListCell.self,
            forCellReuseIdentifier: ReviewListCell.identifier
        )
        $0.tableFooterView = UIView()
    }
    
    private lazy var vStack = with(
        UIStackView(arrangedSubviews: [
            topWordsView,
            tableView
        ])
    ) {
        $0.axis = .vertical
        $0.spacing = .zero
        $0.alignment = .fill
        $0.distribution = .fill
    }
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        addSubview(vStack)
        vStack.alignFitEdges().activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Populate UI
extension ReviewListView {
    func reloadUI(tags: [String], reviews: [Review]) {
        topWordsView.populate(with: tags)
        UIView.animate(withDuration: 0.3) { [weak topWordsView] in
            topWordsView?.isHidden = tags.isEmpty
        }
        tableView.reloadData()
    }
}
