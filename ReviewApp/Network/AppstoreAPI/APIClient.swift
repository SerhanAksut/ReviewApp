

struct APIClient {
    typealias Completion<Model> = (Result<Model, APIError>) -> Void
    
    var reviewList: (@escaping Completion<[Review]>) -> Void
}
