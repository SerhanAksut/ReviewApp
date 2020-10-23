import Foundation

public struct AppstoreAPI {
    public typealias Completion<Model> = (Result<Model, AppStoreApiError>) -> Void
    
    public var reviewList: (Completion<[Review]>) -> Void
    
    public init(
        reviewList: @escaping (Completion<[Review]>) -> Void
    ) {
        self.reviewList = reviewList
    }
}
