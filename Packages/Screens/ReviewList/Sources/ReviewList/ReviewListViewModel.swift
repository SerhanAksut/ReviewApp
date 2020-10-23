
import AppstoreAPI

public final class ReviewListViewModel {
    let apiClient: AppstoreAPI
    
    public init(apiClient: AppstoreAPI) {
        self.apiClient = apiClient
    }
}
