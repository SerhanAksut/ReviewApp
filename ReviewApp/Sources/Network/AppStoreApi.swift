
import Foundation

class AppStoreApi {
    
    let url: URL? = URL(string: "https://itunes.apple.com/tr/rss/customerreviews/id=375380948/sortby=mostrecent/json")
    
    func fetchReviewList(completion: @escaping (Result<[Review], Error>) -> () ) {
        
        guard let _url = url else { return }
        
        let task = URLSession.shared.dataTask(with: _url) { (data, _, error) in
            
            DispatchQueue.main.async {
                if let err = error {
                    completion(.failure(err))
                }
                                
                if let responseData = data {
                    
                    do {
                        let feed = try JSONDecoder().decode(Feed.self, from: responseData)
                        completion(.success(feed.reviews))
                    } catch let decodeError {
                        completion(.failure(decodeError))
                    }
                }
            }
            
        }
        task.resume()
    }
    
}
