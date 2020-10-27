
import Foundation

public struct ReviewDetailModel: Equatable {
    public let rating: String
    public let author: String
    public let title: String
    public let content: String
    
    public init(
        rating: String,
        author: String,
        title: String,
        content: String
    ) {
        self.rating = rating
        self.author = author
        self.title = title
        self.content = content
    }
}
