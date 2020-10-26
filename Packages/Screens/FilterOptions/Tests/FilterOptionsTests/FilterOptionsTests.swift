
import XCTest
@testable import FilterOptions

final class FilterOptionsTests: XCTestCase {
    
    var datasource: [FilterOptionItemModel]!
    var selectedIndex: Int!
    var errorTitle: String!
    var errorMessage: String!
    var errorButtonTitle: String!
    
    override func setUp() {
        super.setUp()
        
        datasource = []
        selectedIndex = nil
        errorTitle = ""
        errorMessage = ""
        errorButtonTitle = ""
    }
    
    override func tearDown() {
        datasource = nil
        selectedIndex = nil
        errorTitle = nil
        errorMessage = nil
        errorButtonTitle = nil
    }
    
    func test__loadUI_when_view_loaded_with_happy_path_and_no_selectedIndex() {
        let viewModel = FilterOptionsViewModel(items: mock, selectedIndex: nil)
        viewModel.output = self
        viewModel.loadOptionItems()
        
        let expectedResult = mock.map {
            FilterOptionItemModel(
                itemName: $0,
                isChecked: false
            )
        }
        
        XCTAssertEqual(expectedResult, datasource)
    }
    
    func test__loadUI_when_view_loaded_with_happy_path_and_selectedIndex_exists() {
        let viewModel = FilterOptionsViewModel(items: mock, selectedIndex: 2)
        viewModel.output = self
        viewModel.loadOptionItems()
        
        let expectedResult = mock
            .enumerated()
            .map { index, itemName in
                FilterOptionItemModel(
                    itemName: itemName,
                    isChecked: index == 2
                )
            }
        
        XCTAssertEqual(expectedResult, datasource)
    }
    
    func test__displayError_when_view_loaded_with_emptyItemList() {
        let viewModel = FilterOptionsViewModel(items: [], selectedIndex: nil)
        viewModel.output = self
        viewModel.loadOptionItems()
        
        XCTAssertEqual("Error", errorTitle)
        XCTAssertEqual("There is no option item.", errorMessage)
        XCTAssertEqual("Ok", errorButtonTitle)
    }
    
    func test__close_when_user_select_an_option_without_default_selectedIndex() {
        let viewModel = FilterOptionsViewModel(items: mock, selectedIndex: nil)
        viewModel.output = self
        viewModel.optionItemSelected(at: 2)
        
        XCTAssertEqual(2, selectedIndex)
    }
    
    func test__close_when_user_select_an_option_with_default_selectedIndex() {
        let viewModel = FilterOptionsViewModel(items: mock, selectedIndex: 1)
        viewModel.output = self
        viewModel.optionItemSelected(at: 4)
        
        XCTAssertEqual(4, selectedIndex)
    }
}

// MARK: - Output
extension FilterOptionsTests: FilterOptionsViewModelOutput {
    func loadUI(with datasource: [FilterOptionItemModel]) {
        self.datasource = datasource
    }
    
    func displayError(title: String, message: String, buttonTitle: String) {
        self.errorTitle = title
        self.errorMessage = message
        self.errorButtonTitle = buttonTitle
    }
    
    func close(with selectedIndex: Int) {
        self.selectedIndex = selectedIndex
    }
}
