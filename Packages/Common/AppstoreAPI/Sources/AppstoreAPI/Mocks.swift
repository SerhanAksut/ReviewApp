
import Foundation

public extension APIClient {
    static let happyPath = Self(
        reviewList: { completion in
            completion(
                .success([
                    Review(
                        id: "1",
                        author: "Author1",
                        rating: 5,
                        title: "Amazing!",
                        content: "The best mobile banking app that I've ever used.",
                        version: "3.1",
                        voteSum: 5,
                        voteCount: 10
                    ),
                    Review(
                        id: "2",
                        author: "Author2",
                        rating: 3,
                        title: "Easy to use but slow!",
                        content: "The interface is very user-friendly but it's working slow.",
                        version: "3.1",
                        voteSum: 7,
                        voteCount: 9
                    ),
                    Review(
                        id: "3",
                        author: "Author3",
                        rating: 4,
                        title: "Glad to use but can be better!",
                        content: "I'm glad to use but it can include more features like on the web app.",
                        version: "3.1",
                        voteSum: 4,
                        voteCount: 6
                    )
                ])
            )
        }
    )
    
    static let error = Self(
        reviewList: { completion in
            completion(.failure(APIError.noConnection))
        }
    )
    
    static func delayed(client: APIClient) -> APIClient {
        Self(
            reviewList: { completion in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    client.reviewList(completion)
                }
            }
        )
    }
}
