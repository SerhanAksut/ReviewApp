
import Foundation

// MARK: - IO
protocol FilterOptionsViewModelInput {
    func loadOptionItems()
    func optionItemSelected(at index: Int)
}

protocol FilterOptionsViewModelOutput: class {
    func loadUI(with datasource: [FilterOptionItemModel])
    func displayError(title: String, message: String, buttonTitle: String)
    func close(with selectedIndex: Int)
}

final class FilterOptionsViewModel {
    
    // MARK: - Properties
    private let items: [String]
    private let selectedIndex: Int?
    weak var output: FilterOptionsViewModelOutput?
    
    // MARK: - Initialization
    init(items: [String], selectedIndex: Int?) {
        self.items = items
        self.selectedIndex = selectedIndex
    }
}

// MARK: - FilterOptionsViewModel Input
extension FilterOptionsViewModel: FilterOptionsViewModelInput {
    func loadOptionItems() {
        if items.isEmpty {
            output?.displayError(
                title: Constants.errorTitle,
                message: Constants.message,
                buttonTitle: Constants.errorAlertButtonTitle
            )
        } else {
            let datasource = items
                .enumerated()
                .map { index, itemName in
                    FilterOptionItemModel(
                        itemName: itemName,
                        isChecked: index == selectedIndex
                    )
                }
            output?.loadUI(with: datasource)
        }
    }
    
    func optionItemSelected(at index: Int) {
        output?.close(with: index)
    }
}

// MARK: - Constants
private enum Constants {
    static let errorTitle = "Error"
    static let message = "There is no option item."
    static let errorAlertButtonTitle = "Ok"
}
