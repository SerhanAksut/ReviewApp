
import UIKit
import UIKitHelper
import Entities

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
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
