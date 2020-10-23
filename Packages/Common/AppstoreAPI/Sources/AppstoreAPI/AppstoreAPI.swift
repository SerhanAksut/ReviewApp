import Foundation

public struct AppstoreAPI {
    public typealias Completion<Model> = (Result<Model, AppstoreAPIError>) -> Void
    
    public var reviewList: (@escaping Completion<[Review]>) -> Void
    
    public init(
        reviewList: @escaping (@escaping Completion<[Review]>) -> Void
    ) {
        self.reviewList = reviewList
    }
}
