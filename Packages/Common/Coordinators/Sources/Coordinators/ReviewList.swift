
public protocol ReviewListCoordinatorProtocol: class {
    
    func showReviewDetail(with reviewID: String)
    func showFilterOptions(items: [String], selectedIndex: Int)
}
