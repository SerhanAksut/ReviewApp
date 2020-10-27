
import Entities

extension ReviewDetailModel {
    static let mockHappyPath = Self(
        rating: "⭐️⭐️⭐️⭐️⭐️",
        author: "Author1",
        title: "Title1",
        content: "Content1"
    )
    
    static let mockRatingEmpty = Self(
        rating: "",
        author: "Author1",
        title: "Title1",
        content: "Content1"
    )
    
    static let mockAuthorEmpty = Self(
        rating: "⭐️⭐️⭐️⭐️⭐️",
        author: "",
        title: "Title1",
        content: "Content1"
    )
    
    static let mockTitleEmpty = Self(
        rating: "⭐️⭐️⭐️⭐️⭐️",
        author: "Author1",
        title: "",
        content: "Content1"
    )
    
    static let mockContentEmpty = Self(
        rating: "⭐️⭐️⭐️⭐️⭐️",
        author: "Author1",
        title: "Title1",
        content: ""
    )
}
