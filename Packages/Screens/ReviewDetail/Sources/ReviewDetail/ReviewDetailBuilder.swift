
import UIKit
import Entities

public struct ReviewDetailBuilder {
    
    public static func build(review: Review) -> UIViewController {
        let viewModel = ReviewDetailViewModel(with: review)
        let controller = ReviewDetailViewController(viewModel: viewModel)
        return controller
    }
}
