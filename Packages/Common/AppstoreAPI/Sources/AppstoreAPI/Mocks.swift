
import Foundation
import Entities

public extension APIClient {
    static let happyPath = Self(
        reviewList: { completion in
            completion(.success(happyPathMock))
        }
    )
    
    static let error = Self(
        reviewList: { completion in
            completion(.failure(APIError.unknown))
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
    
    static var happyPathMock: [Review] {
        [
            Review(
                id: "1",
                author: "Author1",
                rating: 5,
                title: "Amazing!",
                content: "The best mobile banking app that I have ever used. Best mobile banking. Mobile banking. Banking",
                version: "3.1"
            ),
            Review(
                id: "2",
                author: "Author2",
                rating: 3,
                title: "Easy to use but slow!",
                content: "The interface is very user-friendly but it's working slow. Working slow. Slow. Slow loading. Working Nice. Interface.",
                version: "3.1"
            ),
            Review(
                id: "3",
                author: "Author3",
                rating: 4,
                title: "Glad to use but can be better!",
                content: "I'm glad to use but it can include more features like on the web app. It can include more features. Include more features. More features. Features",
                version: "3.1"
            ),
            Review(
                id: "4",
                author: "Author4",
                rating: 1,
                title: "Login issue!",
                content: "I can not login to the app!",
                version: "3.1"
            ),
            Review(
                id: "5",
                author: "Author5",
                rating: 2,
                title: "Not Useful!",
                content: "This app is not useful for me!. This useful for me. useful.",
                version: "3.1"
            )
        ]
    }
}
