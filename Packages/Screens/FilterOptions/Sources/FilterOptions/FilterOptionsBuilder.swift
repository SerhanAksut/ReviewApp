
import UIKit

public struct FilterOptionsBuilder {
    
    public static func build(
        items: [String],
        selectedIndex: Int?,
        completion: @escaping (Int?) -> Void
    ) -> UIViewController {
        let viewModel = FilterOptionsViewModel(
            items: items,
            selectedIndex: selectedIndex
        )
        let dependencies = FilterOptionsDependencies(
            viewModel: viewModel,
            completion: completion
        )
        let controller = FilterOptionsViewController(
            dependencies: dependencies
        )
        return controller
    }
}
