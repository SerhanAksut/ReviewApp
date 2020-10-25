
import Foundation

// MARK: - IO
protocol FilterOptionsViewModelInput {
    func loadOptionItems()
    func optionItemSelected(at index: Int)
    func closeButtonTapped()
}

protocol FilterOptionsViewModelOutput: class {
    func loadUI(with datasource: [FilterOptionItemModel])
    func close(with selectedIndex: Int?)
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
    
    func optionItemSelected(at index: Int) {
        output?.close(with: index)
    }
    
    func closeButtonTapped() {
        output?.close(with: nil)
    }
}
