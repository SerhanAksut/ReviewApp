
import UIKit
import UIKitHelper

final class ReviewListView: UIView {
    
    // MARK: - Properties
    let tableView = with(UITableView(frame: .zero, style: .plain)) {
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 160
        $0.register(
            ReviewListCell.self,
            forCellReuseIdentifier: ReviewListCell.identifier
        )
        $0.tableFooterView = UIView()
    }
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        addSubview(tableView)
        tableView.alignFitEdges().activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
