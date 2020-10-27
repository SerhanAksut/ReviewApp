
import Entities

public protocol ReviewListCoordinatorProtocol: class {
    
    func showReviewDetail(with review: Review)
    func showFilterOptions(
        items: [String],
        selectedIndex: Int?,
        completion: @escaping (Int?) -> Void
    )
}
