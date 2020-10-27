import XCTest

@testable import ReviewDetail

final class ReviewDetailTests: XCTestCase {
    
    var rating: String!
    var authorName: String!
    var title: String!
    var content: String!
    
    override func setUp() {
        super.setUp()
        
        rating = ""
        authorName = ""
        title = ""
        content = ""
    }
    
    override func tearDown() {
        rating = nil
        authorName = nil
        title = nil
        content = nil
    }
    
    func test__outputs_when_pageLoaded_with_happyPath() {
        let viewModel = ReviewDetailViewModel.init(with: .mockHappyPath)
        viewModel.output = self
        viewModel.loadDetails()
        
        XCTAssertEqual("⭐️⭐️⭐️⭐️⭐️ (ver: 3.21)", rating)
        XCTAssertEqual("Author1", authorName)
        XCTAssertEqual("Title1", title)
        XCTAssertEqual("Content1", content)
    }
    
    func test__authorName_when_pageLoaded_with_author_empty() {
        let viewModel = ReviewDetailViewModel(with: .mockAuthorEmpty)
        viewModel.output = self
        viewModel.loadDetails()
        
        XCTAssertEqual("⭐️⭐️⭐️⭐️⭐️ (ver: 3.21)", rating)
        XCTAssertEqual("", authorName)
        XCTAssertEqual("Title3", title)
        XCTAssertEqual("Content3", content)
    }
    
    func test__title_when_pageLoaded_with_title_empty() {
        let viewModel = ReviewDetailViewModel(with: .mockTitleEmpty)
        viewModel.output = self
        viewModel.loadDetails()
        
        XCTAssertEqual("⭐️⭐️⭐️⭐️⭐️ (ver: 3.21)", rating)
        XCTAssertEqual("Author4", authorName)
        XCTAssertEqual("", title)
        XCTAssertEqual("Content4", content)
    }
    
    func test__content_when_pageLoaded_with_title_empty() {
        let viewModel = ReviewDetailViewModel(with: .mockContentEmpty)
        viewModel.output = self
        viewModel.loadDetails()
        
        XCTAssertEqual("⭐️⭐️⭐️⭐️⭐️ (ver: 3.21)", rating)
        XCTAssertEqual("Author5", authorName)
        XCTAssertEqual("Title5", title)
        XCTAssertEqual("", content)
    }
}

// MARK: - Output
extension ReviewDetailTests: ReviewDetailViewModelOutput {
    func displayRating(with text: String) {
        rating = text
    }
    
    func displayAuthor(with authorName: String) {
        self.authorName = authorName
    }
    
    func displayTitle(with title: String) {
        self.title = title
    }
    
    func displayContent(with content: String) {
        self.content = content
    }
}
