
import Entities

extension Review {
    static let mockHappyPath = Self(
        id: "1",
        author: "Author1",
        rating: 5,
        title: "Title1",
        content: "Content1",
        version: "3.21"
    )
    
    static let mockRatingEmpty = Self(
        id: "2",
        author: "Author2",
        rating: 0,
        title: "Title2",
        content: "Content2",
        version: "3.21"
    )
    
    static let mockAuthorEmpty = Self(
        id: "3",
        author: "",
        rating: 5,
        title: "Title3",
        content: "Content3",
        version: "3.21"
    )
    
    static let mockTitleEmpty = Self(
        id: "4",
        author: "Author4",
        rating: 5,
        title: "",
        content: "Content4",
        version: "3.21"
    )
    
    static let mockContentEmpty = Self(
        id: "5",
        author: "Author5",
        rating: 5,
        title: "Title5",
        content: "",
        version: "3.21"
    )
}
