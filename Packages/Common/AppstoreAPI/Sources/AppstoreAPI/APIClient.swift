
import Entities

public struct APIClient {
    public typealias Completion<Model> = (Result<Model, APIError>) -> Void
    
    public var reviewList: (@escaping Completion<[Review]>) -> Void
    
    public init(
        reviewList: @escaping (@escaping Completion<[Review]>) -> Void
    ) {
        self.reviewList = reviewList
    }
}
