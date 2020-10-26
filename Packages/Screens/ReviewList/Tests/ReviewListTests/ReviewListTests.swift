import XCTest
import AppstoreAPI
@testable import ReviewList

final class ReviewListTests: XCTestCase {
    
    var isLoading: Bool!
    var tags: [String]!
    var reviews: [Review]!
    var errorTitle: String!
    var errorMessage: String!
    var errorButtonTitle: String!
    var reviewID: String!
    var optionItems: [String]!
    var selectedIndex: Int!
    
    override func setUp() {
        isLoading = false
        tags = []
        reviews = []
        errorTitle = ""
        errorMessage = ""
        errorButtonTitle = ""
        reviewID = ""
        optionItems = []
        selectedIndex = nil
    }
    
    override func tearDown() {
        isLoading = false
        tags = nil
        reviews = nil
        errorTitle = nil
        errorMessage = nil
        errorButtonTitle = nil
        reviewID = nil
        optionItems = nil
        selectedIndex = nil
    }
    
    func test__displayLoading_when_reviewList_requested_from_api_with_happyPath() {
        let viewModel = ReviewListViewModel(apiClient: .delayed(client: .happyPath))
        viewModel.output = self
        viewModel.loadReviewList()
        XCTAssertEqual(true, isLoading)
    }
    
    func test__hideLoading_when_reviewList_requested_from_api_with_delayed() {
        let viewModel = ReviewListViewModel(apiClient: .delayed(client: .happyPath))
        viewModel.output = self
        viewModel.loadReviewList()
        XCTAssertEqual(true, isLoading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(false, self.isLoading)
        }
    }
    
    func test__hideLoading_when_reviewList_requested_from_api_with_error() {
        let viewModel = ReviewListViewModel(apiClient: .delayed(client: .error))
        viewModel.output = self
        viewModel.loadReviewList()
        XCTAssertEqual(true, isLoading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(false, self.isLoading)
        }
    }
    
    func test__reloadUI_when_reviewList_response_handled_from_api_with_happPath() {
        let viewModel = ReviewListViewModel(apiClient: .delayed(client: .happyPath))
        viewModel.output = self
        viewModel.loadReviewList()
        XCTAssertEqual(true, isLoading)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(false, self.isLoading)
            XCTAssertEqual([], self.tags)
            
            let expectedReview1 = APIClient.happyPathMock[0]
            XCTAssertEqual(expectedReview1, self.reviews[0])
            
            let expectedReview2 = APIClient.happyPathMock[1]
            XCTAssertEqual(expectedReview2, self.reviews[0])
            
            let expectedReview3 = APIClient.happyPathMock[2]
            XCTAssertEqual(expectedReview3, self.reviews[0])
            
            let expectedReview4 = APIClient.happyPathMock[3]
            XCTAssertEqual(expectedReview4, self.reviews[0])
            
            let expectedReview5 = APIClient.happyPathMock[4]
            XCTAssertEqual(expectedReview5, self.reviews[0])
            
            let expectedReview6 = APIClient.happyPathMock[5]
            XCTAssertEqual(expectedReview6, self.reviews[0])
        }
    }
    
    func test__reloadUI_when_filter_option_changed_with_all_option_types() {
        let viewModel = ReviewListViewModel(apiClient: .happyPath)
        viewModel.output = self
        viewModel.loadReviewList()
        viewModel.filterOptionSelected(at: 4)
        
        let filteredList = APIClient.happyPathMock.filter { $0.rating == 5 }
        XCTAssertEqual(filteredList, filteredList)
        XCTAssertEqual(["best", "mobile", "banking"], tags)
        
        viewModel.filterOptionSelected(at: 3)
        XCTAssertEqual(["glad", "include", "more"], tags)
        
        let expectedReviews2 = APIClient.happyPathMock.filter { $0.rating == 4 }
        XCTAssertEqual(expectedReviews2, reviews)
        
        viewModel.filterOptionSelected(at: 2)
        XCTAssertEqual(["interface", "very", "userfriendly"], tags)
        
        let expectedReviews3 = APIClient.happyPathMock.filter { $0.rating == 3 }
        XCTAssertEqual(expectedReviews3, reviews)
        
        viewModel.filterOptionSelected(at: 1)
        XCTAssertEqual(["this", "useful"], tags)
        
        let expectedReviews4 = APIClient.happyPathMock.filter { $0.rating == 2 }
        XCTAssertEqual(expectedReviews4, reviews)
        
        viewModel.filterOptionSelected(at: 0)
        XCTAssertEqual(["login"], tags)
        
        let expectedReviews5 = APIClient.happyPathMock.filter { $0.rating == 1 }
        XCTAssertEqual(expectedReviews5, reviews)
        
        viewModel.filterOptionSelected(at: 5)
        XCTAssertEqual([], tags)
        
        let expectedReviews6 = APIClient.happyPathMock
        XCTAssertEqual(expectedReviews6, reviews)
    }
    
    func test__displayError_when_review_list_api_response_fail() {
        let viewModel = ReviewListViewModel(apiClient: .error)
        viewModel.output = self
        viewModel.loadReviewList()
        
        XCTAssertEqual("Error", errorTitle)
        let expectedMessage = AppstoreAPI.APIError.unknown.message
        XCTAssertEqual(expectedMessage, errorMessage)
        XCTAssertEqual("Ok", errorButtonTitle)
    }
    
    func test__showReviewDetail_when_a_review_selected_from_all_reviews() {
        let viewModel = ReviewListViewModel(apiClient: .happyPath)
        viewModel.output = self
        viewModel.loadReviewList()
        viewModel.didSelectReview(at: 2)
        
        let expectedID = APIClient.happyPathMock[2].id
        XCTAssertEqual(expectedID, reviewID)
    }
    
    func test__showReviewDetail_when_a_review_selected_from_filtered_reviews() {
        let viewModel = ReviewListViewModel(apiClient: .happyPath)
        viewModel.output = self
        viewModel.loadReviewList()
        viewModel.filterOptionSelected(at: 4)
        viewModel.didSelectReview(at: 0)
        
        let filteredList = APIClient.happyPathMock.filter { $0.rating == 5 }
        let expectedID = filteredList[0].id
        XCTAssertEqual(expectedID, reviewID)
    }
    
    func test__showFilterOptions_when_filter_button_tapped() {
        let viewModel = ReviewListViewModel(apiClient: .happyPath)
        viewModel.output = self
        viewModel.loadReviewList()
        viewModel.didSelectFilterButton()
        
        let expectedResult = FilterOption.allCases.map { $0.title }
        XCTAssertEqual(expectedResult, optionItems)
    }
}

// MARK: - Outputs
extension ReviewListTests: ReviewListViewModelOutput {
    func displayLoading() {
        isLoading = true
    }
    
    func hideLoading() {
        isLoading = false
    }
    
    func reloadUI(tags: [String], reviews: [Review]) {
        self.tags = tags
        self.reviews = reviews
    }
    
    func displayError(title: String, message: String, buttonTitle: String) {
        errorTitle = title
        errorMessage = message
        errorButtonTitle = buttonTitle
    }
    
    func showReviewDetail(with reviewID: String) {
        self.reviewID = reviewID
    }
    
    func showFilterOptions(items: [String], selectedIndex: Int) {
        optionItems = items
        self.selectedIndex = selectedIndex
    }
}
