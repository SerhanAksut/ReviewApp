
import AppstoreAPI

public final class ReviewListViewModel {
    let api: AppstoreAPI
    
    public init(api: AppstoreAPI) {
        self.api = api
        
        api.reviewList { result in
            switch result {
            case .success(let reviewList): break
            case .failure(let error): break
            }
        }
    }
}
