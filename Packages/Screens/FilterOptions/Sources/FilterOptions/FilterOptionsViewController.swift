
import UIKit
import UIKitHelper

final class FilterOptionsViewController: UIViewController, ErrorHandler {
    
    // MARK: - Properties
    private let viewSource = FilterOptionsView()
    
    private let dependencies: FilterOptionsDependencies
    
    // MARK: - Initialization
    init(dependencies: FilterOptionsDependencies) {
        self.dependencies = dependencies
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = viewSource
        view.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSource.delegate = self
        dependencies.viewModel.output = self
        dependencies.viewModel.loadOptionItems()
    }
}

// MARK: - FilterOptionsViewModel Output
extension FilterOptionsViewController: FilterOptionsViewModelOutput {
    func loadUI(with datasource: [FilterOptionItemModel]) {
        viewSource.populate(with: datasource)
    }
    
    func displayError(title: String, message: String, buttonTitle: String) {
        viewSource.contentView.isHidden = true
        showAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    func close(with selectedIndex: Int) {
        dependencies.completion(selectedIndex)
        dismiss(animated: true)
    }
}

// MARK: - Actions
extension FilterOptionsViewController: FilterOptionsViewDelegate {
    func didSelectOption(at index: Int) {
        dependencies.viewModel.optionItemSelected(at: index)
    }
}

// MARK: - UIKit Preview
#if DEBUG
import SwiftUI
import UIKitPreview

struct ReviewListViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            FilterOptionsBuilder.build(
                items: [],
                selectedIndex: nil,
                completion: { index in
                    if let index = index {
                        print(index)
                    }
                }
            )
        }
        .colorScheme(.dark)
        .edgesIgnoringSafeArea(.all)
    }
}
#endif
